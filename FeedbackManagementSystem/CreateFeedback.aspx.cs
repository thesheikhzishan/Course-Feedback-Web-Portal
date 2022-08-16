using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class CreateFeedback : System.Web.UI.Page
{
    SqlConnection SqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlDbConnection"].ConnectionString);
    SqlCommand cmd;
    SqlDataAdapter sda;
    DataTable userdt;
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable CouseData = new DataTable();
            userdt = new DataTable();
            userdt = Session["User"] as DataTable;
            if (userdt != null && userdt.Rows.Count > 0)
            {
                string Cource = userdt.Rows[0]["Cource"].ToString();
                ddlCource.DataSource = GetTable(Cource.Split(','));
                ddlCource.DataTextField = "Cource";
                ddlCource.DataValueField = "Cource";
                ddlCource.DataBind();
                ddlCource.Items.Insert(0, new ListItem("Select Course", ""));
              
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            //do for page load only
        }

    }
    private static DataTable GetTable(string[] List)
    {
        DataTable table = new DataTable();
        table.Columns.Add("Cource", typeof(string));
      
        foreach (string c in List)
        {
            table.Rows.Add(c);
        }
     
        return table;
    }

    protected void BtnCreateFeedback_Click(object sender, EventArgs e)
    {
        try
        {
            lblmsg.Text = "";

            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            //if (CheckUserExist(txtEmail.Text.Trim())) return;
            string sdate = txtDate.Text;
            if (ddlRecurring.SelectedIndex > 0)
            {
                int count = Convert.ToInt32(ddlRecurring.SelectedItem.Value);

                if (count == 0)// non reqreing
                {
                   // sdate = (Convert.ToDateTime(sdate)).ToShortDateString();
                    if (SqlCon.State == ConnectionState.Closed) SqlCon.Open();

                    cmd = new SqlCommand("CreateFeedbck", SqlCon);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Cource", ddlCource.SelectedValue);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim()+"-"+Convert.ToDateTime(sdate).ToShortDateString());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@StartDate",Convert.ToDateTime(sdate));
                    cmd.Parameters.AddWithValue("@Question1", txtQ1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Question2", txtQ2.Text);
                    cmd.Parameters.AddWithValue("@Question3", txtQ3.Text);
                    cmd.Parameters.AddWithValue("@Question4", txtQ4.Text);
                    cmd.Parameters.AddWithValue("@Question5", txtQ5.Text);
                    userdt = new DataTable();
                    userdt = Session["User"] as DataTable;
                    int id = Convert.ToInt32(userdt.Rows[0]["UserId"]);
                    cmd.Parameters.AddWithValue("@CreatedBy", id);

                    dt = new DataTable();
                    sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    //int Result=0;
                    SqlCon.Close();
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        lblmsg.CssClass = "text-success";
                        lblmsg.Text = "Feedback Created Successfully.";
                        ClearForm();
                    }
                    else
                    {
                        lblmsg.CssClass = "text-danger";
                        lblmsg.Text = "Unable to create feedback. Please try again!";
                    }
                }

                else
                {


                    for (int i = 0; i < count; i++)
                    {
                        sdate = (Convert.ToDateTime(sdate)).ToShortDateString();

                        if (SqlCon.State == ConnectionState.Closed) SqlCon.Open();

                        cmd = new SqlCommand("CreateFeedbck", SqlCon);
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@Cource", ddlCource.SelectedValue);
                        cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim() + "-" + Convert.ToDateTime(sdate).ToShortDateString());
                       // cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                        cmd.Parameters.AddWithValue("@StartDate",Convert.ToDateTime(sdate));
                        cmd.Parameters.AddWithValue("@Question1", txtQ1.Text.Trim());
                        cmd.Parameters.AddWithValue("@Question2", txtQ2.Text);
                        cmd.Parameters.AddWithValue("@Question3", txtQ3.Text);
                        cmd.Parameters.AddWithValue("@Question4", txtQ4.Text);
                        cmd.Parameters.AddWithValue("@Question5", txtQ5.Text);
                        userdt = new DataTable();
                        userdt = Session["User"] as DataTable;
                        int id = Convert.ToInt32(userdt.Rows[0]["UserId"]);
                        cmd.Parameters.AddWithValue("@CreatedBy", id);

                        dt = new DataTable();
                        sda = new SqlDataAdapter(cmd);
                        sda.Fill(dt);
                        //int Result=0;
                        SqlCon.Close();
                        
                        if (ddlRecurring.SelectedIndex < 5)
                        {
                            //date  15 days add
                            sdate = (Convert.ToDateTime(sdate).AddDays(15)).ToShortDateString();
                        }
                        else
                        {
                            sdate = (Convert.ToDateTime(sdate).AddMonths(1)).ToShortDateString();
                        }

                    }
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        lblmsg.CssClass = "text-success";
                        lblmsg.Text = "Feedback Created Successfully.";
                        //    ClearForm();
                    }
                    else
                    {
                        lblmsg.CssClass = "text-danger";
                        lblmsg.Text = "Unable to create feedback. Please try again!";
                    }
                }

                }

           
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }



    }


    protected void BtnClear_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    private void ClearForm()
    {
        ddlCource.SelectedValue="";
        txtTitle.Text="";
         txtDescription.Text="";
         txtDate.Text="";
         txtQ1.Text="";
         txtQ2.Text="";
         txtQ3.Text="";
         txtQ4.Text="";
         txtQ5.Text = "";
    }
}