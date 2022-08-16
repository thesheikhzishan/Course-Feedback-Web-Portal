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
        
        DataTable CouseData = new DataTable();
        userdt = new DataTable();
        userdt = Session["User"] as DataTable;
        if (userdt != null && userdt.Rows.Count > 0)
        {
            string Cource = userdt.Rows[0]["Cource"].ToString();
            int id = Convert.ToInt32(userdt.Rows[0]["UserId"]);
            fillGrid(id, ddlCource.SelectedValue, ddlTitle.SelectedItem.Text);       
       
        }

    }

    // GetAverageRating
    protected string GetAverageRating(string id)
    {
        float c = Convert.ToSingle(id);
        string msg = "";
            if (c == 1)
                msg = "Rating :" + " Strongly Disagree ";
            else if (c == 2 )
                msg = "Rating :" +  " Disagree ";
            else if (c == 3)
                msg = "Rating :" +  " Neutral ";
            else if (c == 4 )
                msg = "Rating :" +  " Agree ";
            else if (c == 5 )
                msg = "Rating :" + " Strongly Agree ";
        

        return msg;
    }

    private void fillGrid(int id,string course, string title)
    {
        if (SqlCon.State == ConnectionState.Closed) SqlCon.Open();

        string query = "SELECT  f.Question1 as Q1, fr.Question1 as R1,"
            + "f.Question2 as Q2, fr.[Question2] as R2, f.Question3 as Q3, fr.[Question3] as R3, f.Question4 as Q4,"
            + "fr.[Question4] as R4, f.Question5 as Q5, fr.[Question5] as R5, fr.[Remark], u.Name as InstructorName," 
            + " CONVERT(VARCHAR(10),fr.submitedDate,103)as SubmittedDate,CONVERT(VARCHAR(10),f.CreatedDate,103) as FeedbackDate FROM[FeedbackResponce] as fr, Feedback as f, Users as u"
            + " where  f.Id = fr.feedbackId and f.CreatedBy = u.UserId and  fr.CreatedBy = @CreatedBy and fr.[Course]=@course and fr.[Title]=@title" ;
        cmd = new SqlCommand(query, SqlCon);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@CreatedBy", id);
        cmd.Parameters.AddWithValue("@course", course);
        cmd.Parameters.AddWithValue("@title", title);

            DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(dt);
        frmSubmitedFeedback.DataSource = dt;
        frmSubmitedFeedback.DataBind();
        SqlCon.Close();

    }


   
}