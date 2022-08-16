using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Register : System.Web.UI.Page
{
    SqlConnection SqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlDbConnection"].ConnectionString);
    SqlCommand cmd;
    SqlDataAdapter sda;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           //do something for first time page load
            lblmsg.Text = "";
            CourceDiv.Visible = false;
        }
      
    }


    protected void Btn_register_Click(object sender, EventArgs e)
    {
        try
        {
            lblmsg.Text = "";

            if (CheckUserExist(txtEmail.Text.Trim())) return;

            if(SqlCon.State == ConnectionState.Closed) SqlCon.Open();

            cmd = new SqlCommand("insert into users values (@Name, @Email, @Role,@Department,@Password,@Cource)", SqlCon);
            //cmd.CommandType= CommandType.Text;

            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);
            cmd.Parameters.AddWithValue("@Department", ddlDepart.SelectedValue);
            cmd.Parameters.AddWithValue("@Password", txtpass.Text.Trim());

            List<string> CourcesList = new List<string>();
            foreach(ListItem item in ddlCources.Items){
                if (item.Selected) CourcesList.Add(item.Text);
            }
            var str = String.Join(",", CourcesList);
            cmd.Parameters.AddWithValue("@Cource", str);

            int Result = cmd.ExecuteNonQuery();
            //int Result=0;
            SqlCon.Close();
            if (Result > 0)
            {
                lblmsg.CssClass = "text-success";
                lblmsg.Text = "User Created Successfully. Please Login!";
                ClearForm();
            }
            else
            {
                lblmsg.CssClass = "text-danger";
                lblmsg.Text = "User Not Created. Please try again!";
            }

        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
    }

    private void ClearForm()
    {
        txtName.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtpass.Text = string.Empty;
        ddlRole.SelectedValue = "";
        ddlDepart.SelectedValue = "";
        ddlCources.DataSource = new DataTable(); ;
        ddlCources.DataBind();
        ddlCources.SelectedValue = "";
        CourceDiv.Visible = false;

    }

    private Boolean CheckUserExist(string Email)
    {
        if (SqlCon.State == ConnectionState.Closed) SqlCon.Open();
        cmd = new SqlCommand("select * from Users where Email=@Email", SqlCon);
        cmd.Parameters.AddWithValue("@Email", Email);

        sda = new SqlDataAdapter(cmd);
        dt = new DataTable();
        sda.Fill(dt);
        SqlCon.Close();

        if (dt.Rows.Count > 0)
        {
            lblmsg.CssClass = "text-danger";
            lblmsg.Text = "User already exist!";
            return true;
        }

        return false;
    }

    protected void ddlDepart_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlDepart.SelectedValue != "")
        {
            CourceDiv.Visible = true;
            string Deprt = ddlDepart.SelectedValue;
            ddlCources.DataSource = GetTable(Deprt);
            ddlCources.DataTextField = "Cource";
            ddlCources.DataValueField = "Cource";
            ddlCources.DataBind();
            ddlCources.Items.Insert(0, new ListItem("Select Courses", ""));
        }
        else
        {
            ddlCources.DataSource = new DataTable();
            ddlCources.DataBind();
            ddlCources.SelectedValue = "";
        //CourceDiv.Visible = false;
        }
    }

    private static DataTable GetTable(string Dpt)
    {
        DataTable table = new DataTable();
        table.Columns.Add("Cource", typeof(string));
        //table.Columns.Add("Date", typeof(System.DateTime));

        switch (Dpt)
        {
            case "Computer Science & Engineering":
                {
                    table.Rows.Add("Computer Networks");
                    table.Rows.Add("Data Structure & Algorithms");
                    table.Rows.Add("Artificial Intelligence");
             
                    
                    break;
                }
            case "Electrical Engineering":
                {

                    table.Rows.Add("Digital Systems"); 
                    table.Rows.Add("Digital Signal Processing");
                    table.Rows.Add("Analog Circuits");
                    break;
                }
            case "Mechanical Engineering":
                {
                    table.Rows.Add("Fluid Mechanics");
                    table.Rows.Add("Kinematics Analysis & Synthesis");
                    table.Rows.Add("Machine Design");
                    break;
                }
            case "Civil Engineering":
                {
                    table.Rows.Add("Structural Engineering");
                    table.Rows.Add("Strength of Materials");
                    table.Rows.Add("Fracture Mechanics");
                    break;
                }
            default:
                {
                    //table = new DataTable();
                    break;
                }
        }

        return table;
        
    }


}