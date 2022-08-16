using System;
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

    protected void BtnSubmitFeedback_Click(object sender, EventArgs e)
    {
        try
        {
            lblmsg.Text = "";

            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            //if (CheckUserExist(txtEmail.Text.Trim())) return;
            if (ddlQ1.SelectedIndex > 0 && ddlQ2.SelectedIndex > 0 && ddlQ3.SelectedIndex > 0 && ddlQ4.SelectedIndex > 0 && ddlQ5.SelectedIndex > 0)
            {
                
                userdt = new DataTable();
                userdt = Session["User"] as DataTable;
                int id = Convert.ToInt32(userdt.Rows[0]["UserId"]);
                // check if feedback is already submited or not
                Boolean flag = CheckFeedbackExist(id, ddlTitle.SelectedItem.Value);

                if (flag == true)
                {
                    if (SqlCon.State == ConnectionState.Closed) SqlCon.Open();

                    cmd = new SqlCommand("SubmitFeedback", SqlCon);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Cource", ddlCource.SelectedValue);
                    cmd.Parameters.AddWithValue("@Title", ddlTitle.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@FeedbackId", ddlTitle.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Question1", ddlQ1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Question2", ddlQ2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Question3", ddlQ3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Question4", ddlQ4.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Question5", ddlQ5.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Remark", txtRemark.Text);

                    cmd.Parameters.AddWithValue("@CreatedBy", id);

                    dt = new DataTable();
                    sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    //int Result=0;
                    SqlCon.Close();
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        lblmsg.CssClass = "text-success";
                        lblmsg.Text = "Feedback Submited Successfully.";
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
                    lblmsg.CssClass = "text-danger";
                    lblmsg.Text = "Feedback for this topic is Already Submitted by you";
                }
            }
            else
            {
                lblmsg.CssClass = "text-danger";
                lblmsg.Text = "Please Give rating to all questions.  try again!";
            }
            lblmsg.Focus();

        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
        
    }

    private bool CheckFeedbackExist(int userid, string feedbackid)
    {
        if (SqlCon.State == ConnectionState.Closed) SqlCon.Open();

        cmd = new SqlCommand("select COUNT(*) as feedbackCount FROM [FM_System_db].[dbo].[FeedbackResponce]  where feedbackId=@FeedbackId and CreatedBy=@CreatedBy", SqlCon);
        cmd.CommandType = CommandType.Text;

       
        cmd.Parameters.AddWithValue("@FeedbackId",Convert.ToInt32(feedbackid));        
        cmd.Parameters.AddWithValue("@CreatedBy", userid);

     int c= Convert.ToInt32(cmd.ExecuteScalar());

      //DataTable  dtCheckFeedbackCount = new DataTable();
      // SqlDataAdapter sdaFC = new SqlDataAdapter(cmd);
      //  sdaFC.Fill(dtCheckFeedbackCount);
        //int Result=0;
        SqlCon.Close();

        if (c == 0)
            return true;
        else
            return false;
    }

    protected void BtnClear_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    private void ClearForm()
    {
        //ddlCource.SelectedValue="";
        //txtTitle.Text="";
        // txtDescription.Text = "";
        // txtDate.Text = "";
        //txtQ1.Text = "";
        //txtQ2.Text = "";
        //txtQ3.Text = "";
        //txtQ4.Text = "";
        //txtQ5.Text = "";
        ddlQ1.SelectedIndex = 0;
        ddlQ2.SelectedIndex = 0;
        ddlQ3.SelectedIndex = 0;
        ddlQ4.SelectedIndex = 0;
        ddlQ5.SelectedIndex = 0;
        txtRemark.Text = "";
    }

    protected void ddlCource_SelectedIndexChanged(object sender, EventArgs e)
    {


        if (SqlCon.State == ConnectionState.Closed) SqlCon.Open();

        cmd = new SqlCommand("select Title,id from Feedback where Cource=@course and StartDate<=getdate()", SqlCon);
        cmd.Parameters.AddWithValue("@course", ddlCource.SelectedValue);

        sda = new SqlDataAdapter(cmd);
        dt = new DataTable();
        sda.Fill(dt);
        SqlCon.Close();

        ddlTitle.DataSource = dt;
        ddlTitle.DataTextField = "Title";
        ddlTitle.DataValueField = "id";
        ddlTitle.DataBind();
        ddlTitle.Items.Insert(0, new ListItem("Select Title", ""));

    }

    protected void ddlTitle_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (SqlCon.State == ConnectionState.Closed) SqlCon.Open();

        cmd = new SqlCommand("select * from Feedback where Cource=@course and Title=@title", SqlCon);
        cmd.Parameters.AddWithValue("@course", ddlCource.SelectedValue);
        cmd.Parameters.AddWithValue("@title", ddlTitle.SelectedItem.Text);

        sda = new SqlDataAdapter(cmd);
        dt = new DataTable();
        sda.Fill(dt);
        SqlCon.Close();

        if(dt.Rows.Count>0)
        {
            lblDate.InnerText = dt.Rows[0]["StartDate"].ToString();
            lblDescription.InnerText = dt.Rows[0]["Description"].ToString();
            lblQ1.InnerText = dt.Rows[0]["Question1"].ToString();
            lblQ2.InnerText = dt.Rows[0]["Question2"].ToString();
            lblQ3.InnerText = dt.Rows[0]["Question3"].ToString();
            lblQ4.InnerText = dt.Rows[0]["Question4"].ToString();
            lblQ5.InnerText = dt.Rows[0]["Question5"].ToString();
        }

    }
}