using System;

using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

public partial class ViewAnalysis : System.Web.UI.Page
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

        userdt = new DataTable();
        userdt = Session["User"] as DataTable;
        int id = Convert.ToInt32(userdt.Rows[0]["UserId"]);

        cmd = new SqlCommand("select * from Feedback where Cource=@course and CreatedBy=@CreatedBy and StartDate<=getdate()", SqlCon);
        cmd.Parameters.AddWithValue("@course", ddlCource.SelectedValue);
        cmd.Parameters.AddWithValue("@CreatedBy", id);

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

        Boolean flag = IsFeedbackStarted(ddlTitle.SelectedItem.Value);
        if (flag == false)
        {
            if (SqlCon.State == ConnectionState.Closed) SqlCon.Open();


            userdt = new DataTable();
            userdt = Session["User"] as DataTable;
            int id = Convert.ToInt32(userdt.Rows[0]["UserId"]);

            // get question 
            string QuestionQuery = "select[Question1],[Question2],[Question3],[Question4],[Question5]  FROM[FM_System_db].[dbo].[Feedback] where id = @id and Title =@Title";
            SqlCommand cmdQestion = new SqlCommand(QuestionQuery, SqlCon);
            cmdQestion.Parameters.AddWithValue("@Title", ddlTitle.SelectedItem.Text);
            cmdQestion.Parameters.AddWithValue("@id", ddlTitle.SelectedValue);
            SqlDataAdapter sdaQUestion = new SqlDataAdapter(cmdQestion);
            DataTable dtQUestions = new DataTable();
            sdaQUestion.Fill(dtQUestions);
            if (dtQUestions.Rows.Count == 1)
            {
                lblQ1.Text = "Question1:" + dtQUestions.Rows[0]["Question1"].ToString();
                lblQ2.Text = "Question2:" + dtQUestions.Rows[0]["Question2"].ToString();
                lblQ3.Text = "Question3:" + dtQUestions.Rows[0]["Question3"].ToString();
                lblQ4.Text = "Question4:" + dtQUestions.Rows[0]["Question4"].ToString();
                lblQ5.Text = "Question5:" + dtQUestions.Rows[0]["Question5"].ToString();
            }

            SqlCon.Close();


            cmd = new SqlCommand("spAnaliyis", SqlCon)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@FeedBackId", ddlTitle.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Question", "Question1");

            SqlDataAdapter sdaQ1 = new SqlDataAdapter(cmd);
            DataTable dtQ1 = new DataTable();
            sdaQ1.Fill(dtQ1);

           
            // Question2
            cmd = new SqlCommand("spAnaliyis", SqlCon)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@FeedBackId", ddlTitle.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Question", "Question2");

            SqlDataAdapter sdaQ2 = new SqlDataAdapter(cmd);
            DataTable dtQ2 = new DataTable();
            sdaQ2.Fill(dtQ2);

            SqlCon.Close();

            // Question3
            cmd = new SqlCommand("spAnaliyis", SqlCon)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@FeedBackId", ddlTitle.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Question", "Question3");

            SqlDataAdapter sdaQ3 = new SqlDataAdapter(cmd);
            DataTable dtQ3 = new DataTable();
            sdaQ3.Fill(dtQ3);

            SqlCon.Close();

            // Question4
            cmd = new SqlCommand("spAnaliyis", SqlCon)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@FeedBackId", ddlTitle.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Question", "Question4");

            SqlDataAdapter sdaQ4 = new SqlDataAdapter(cmd);
            DataTable dtQ4 = new DataTable();
            sdaQ4.Fill(dtQ4);

            SqlCon.Close();

            // Question5
            cmd = new SqlCommand("spAnaliyis", SqlCon)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@FeedBackId", ddlTitle.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Question", "Question5");

            SqlDataAdapter sdaQ5 = new SqlDataAdapter(cmd);
            DataTable dtQ5 = new DataTable();
            sdaQ5.Fill(dtQ5);

            SqlCon.Close();

            P1.Visible = true;
            PopulateChart(dtQ1, ChartQ1Bar, ChartQ1Pie, grdQ1);
            PopulateChart(dtQ2, ChartQ2Bar, ChartQ2Pie, grdQ2);
            PopulateChart(dtQ3, ChartQ3Bar, ChartQ3Pie, grdQ3);
            PopulateChart(dtQ4, ChartQ4Bar, ChartQ4Pie, grdQ4);
            PopulateChart(dtQ5, ChartQ5Bar, ChartQ5Pie, grdQ5);


        }
        else
        {
            string s = "No Feedback submitted ";
            lblmsg1.Text = s;
        }


    }

    private bool IsFeedbackStarted(string feedbackid)
    {
        if (SqlCon.State == ConnectionState.Closed) SqlCon.Open();

        cmd = new SqlCommand("select COUNT(*) as feedbackCount FROM [FM_System_db].[dbo].[FeedbackResponce]  where feedbackId=@FeedbackId", SqlCon);
        cmd.CommandType = CommandType.Text;


        cmd.Parameters.AddWithValue("@FeedbackId", Convert.ToInt32(feedbackid));
        

        int c = Convert.ToInt32(cmd.ExecuteScalar());

        SqlCon.Close();

        if (c == 0)
            return true;
        else
            return false;

    }

    protected void PopulateChart(DataTable source,Chart chBar,Chart chPie, GridView grd)
    {
        chBar.DataSource = source;
        chBar.Series[0].ChartType = SeriesChartType.Bar;
        chBar.Legends[0].Enabled = true;
        chBar.Series[0].XValueMember = "Rating";

        chBar.Series[0].YValueMembers = "PercentageOfStudents";
        chBar.DataBind();

        grd.DataSource = source;
        grd.DataBind();

        chPie.DataSource = source;
        chPie.Series[0].ChartType = SeriesChartType.Pie;
        chPie.Legends[0].Enabled = true;
        chPie.Series[0].XValueMember = "Rating";
        chPie.Series[0].YValueMembers = "PercentageOfStudents";
        chPie.DataBind();

        // - code for display lable on chart
        //foreach (Series charts in Chart1.Series)
        //{
        //    foreach (DataPoint point in charts.Points)
        //    {
        //        switch (point.AxisLabel)
        //        {
        //            case "Q1": point.Color = Color.RoyalBlue; break;
        //            case "Q2": point.Color = Color.SaddleBrown; break;
        //            case "Q3": point.Color = Color.SpringGreen; break;
        //        }
        //        point.Label = string.Format("{0:0} - {1}", point.YValues[0], point.AxisLabel);

        //    }
        //}
    }


}