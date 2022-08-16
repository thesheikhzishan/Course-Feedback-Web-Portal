using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    SqlConnection SqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlDbConnection"].ConnectionString);
    SqlCommand cmd;
    SqlDataAdapter sda;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            lblmsg.Text = "";

            if (CheckUserExist(txtEmail.Text.Trim()))
            {

                if (SqlCon.State == ConnectionState.Closed) SqlCon.Open();

                cmd = new SqlCommand("select * from Users where Email=@Email and Password=@Password", SqlCon);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtpass.Text.Trim());

                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                SqlCon.Close();

                if (dt.Rows.Count > 0)
                {
                    //lblmsg.CssClass = "text-danger";
                    //lblmsg.Text = "Success!";
                    Session["User"] = dt;
                    Session["Name"] = dt.Rows[0]["Name"].ToString();

                    if (dt.Rows[0]["Role"].ToString() == "Student")
                    {
                        Response.Redirect("StudentDashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("FacultyDashboard.aspx");
                    }
                }
                else
                {
                    lblmsg.CssClass = "text-danger";
                    lblmsg.Text = "Invalid email or password";
                }
            }
            else
            {
                lblmsg.CssClass = "text-danger";
                lblmsg.Text = "User not registered, Please register!";
            }

        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
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
            //lblmsg.CssClass = "text-danger";
            //lblmsg.Text = "User already exist!";
            return true;
        }

        return false;
    }



}