using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            dt= Session["User"] as DataTable;
            lblName.Text = dt.Rows[0]["Name"].ToString();
            if (dt.Rows[0]["Role"].ToString() == "Student")
            {
                StudentNav.Visible = true;
                FacultyNav.Visible = false;
            }
            else
            {
                StudentNav.Visible = false;
                FacultyNav.Visible = true;
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnLogount_Click(object sender, EventArgs e)
    {
        Session["User"] = null;
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
    //protected void btnLink_Click(object sender, EventArgs e)
    //{
    //    if(dt.Rows.Count > 0){
    //        if( dt.Rows[0]["Role"].ToString() == "Student") Response.Redirect("StudentDashboard.aspx");
    //        else Response.Redirect("FacultyDashboard.aspx");
    //    }else{
    //        Response.Redirect("Login.aspx");
    //    }
    //}
}
