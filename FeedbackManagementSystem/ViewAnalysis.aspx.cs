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
            divRemark.Visible = false;
            divFeed.Visible = false;
            divAnalysis.Visible = false;
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
        divRemark.Visible = false;
        BindGrid();

    }

    protected string GetAverageRating(string id)
    {

        string query = "select feedbackId,(sum(question1) / cast(count(feedbackId) as float) + sum(question2) / cast(count"
            + "(feedbackId) as float) + sum(question3) / cast(count(feedbackId) as float) + sum(question4) / cast(count"
            + "(feedbackId) as float) + sum(question5) / cast(count(feedbackId) as float))/ 5.0 "
            + "FROM[FM_System_db].[dbo].[FeedbackResponce] where feedbackId =@feedbackId GROUP BY feedbackId";


        if (SqlCon.State == ConnectionState.Closed) SqlCon.Open();

        cmd = new SqlCommand(query, SqlCon);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@FeedbackId", Convert.ToInt32(id));


        DataTable dtAvgRating = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(dtAvgRating);
        string msg = "No feedback yet";
        if (dtAvgRating.Rows.Count > 0)
        {
            float c = Convert.ToSingle(dtAvgRating.Rows[0][1].ToString());


            SqlCon.Close();
            
            if (c >= 1 && c <= 2)
                msg = "Rating: " + c.ToString("0.00") + " ( Poor )";
            else if (c > 2 && c <= 3)
                msg = "Rating: " + c.ToString("0.00") + " ( Average )";
            else if (c > 3 && c <= 4)
                msg = "Rating: " + c.ToString("0.00") + " ( Good )";
            else if (c > 4 && c <= 5)
                msg = "Rating: " + c.ToString("0.00") + " ( Excellent )";
        }

        return msg;
    }

    private void BindGrid()
    {
        divFeed.Visible = true;
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

        grdView.DataSource = dt;
        grdView.DataBind();

       

    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        Button btn2 = sender as Button;
        GridViewRow gridrow = btn2.NamingContainer as GridViewRow;
        
        int fid = Convert.ToInt32(grdView.Rows[gridrow.RowIndex].Cells[0].Text);
        lblRemarkTitle.InnerText = grdView.Rows[gridrow.RowIndex].Cells[1].Text;
        //string id= ((Label)grdView.Rows[gridrow.RowIndex].FindControl("lblid")).Text;
        //GridViewRow row = (GridViewRow)grdView.Rows[gridrow.RowIndex];

        BindGrid();
        FillRemark(fid);
    }

    private void FillRemark(int FeedBackId)
    {
        divRemark.Visible = true;
        GridRemark.DataSource = null;
        GridRemark.DataBind();
        if (SqlCon.State == ConnectionState.Closed) SqlCon.Open();

        userdt = new DataTable();
        userdt = Session["User"] as DataTable;
        int id = Convert.ToInt32(userdt.Rows[0]["UserId"]);

        cmd = new SqlCommand("select * from FeedbackResponce where feedbackId=@feedbackId", SqlCon);
        cmd.Parameters.AddWithValue("@feedbackId", FeedBackId);

        sda = new SqlDataAdapter(cmd);
        dt = new DataTable();
        sda.Fill(dt);
        SqlCon.Close();

        GridRemark.DataSource = dt;
        GridRemark.DataBind();
    }

    protected void btnViewFeed_Click(object sender, EventArgs e)
    {
        divAnalysis.Visible = true;
        Button btn2 = sender as Button;
        GridViewRow gridrow = btn2.NamingContainer as GridViewRow;

        int FeedBackId = Convert.ToInt32(grdView.Rows[gridrow.RowIndex].Cells[0].Text);
        if (SqlCon.State == ConnectionState.Closed) SqlCon.Open();

        userdt = new DataTable();
        userdt = Session["User"] as DataTable;
        int id = Convert.ToInt32(userdt.Rows[0]["UserId"]);

        cmd = new SqlCommand("GetFeedbackRespoce", SqlCon)
        {
            CommandType = CommandType.StoredProcedure
        };
        cmd.Parameters.AddWithValue("@FeedBackId", FeedBackId);

        sda = new SqlDataAdapter(cmd);
        dt = new DataTable();
        sda.Fill(dt);
        SqlCon.Close();

        if (dt.Rows.Count > 0)
        {

            DataTable nDt = MakeAnalysisTable(dt);

            if (nDt.Rows.Count > 0)
            {
               // Gridanalysis.DataSource = nDt;
                //Gridanalysis.DataBind();
               // BindChart(nDt);
            }
        }
        //GenerateGraphOfRating();

    }

    private void BindChart(DataTable dt)
    {
        DataTable ChartData = dt;

        //storing total rows count to loop on each Record  
        string[] XPointMember = new string[ChartData.Rows.Count];
        int[] YPointMember = new int[ChartData.Rows.Count];

        for (int count = 0; count < ChartData.Rows.Count; count++)
        {
            //storing Values for X axis  
            XPointMember[count] = ChartData.Rows[count]["Question"].ToString();
            //storing values for Y Axis  
            YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["Average"]);

         }
        //binding chart control  
        Chart1.Series[0].Points.DataBindXY(XPointMember, YPointMember);

        //Setting width of line  
        Chart1.Series[0].BorderWidth = 10;
        //setting Chart type   
        Chart1.Series[0].ChartType = SeriesChartType.Pie;
        foreach (Series charts in Chart1.Series)
        {
            foreach (DataPoint point in charts.Points)
            {
                switch (point.AxisLabel)
                {
                    case "Q1": point.Color = Color.RoyalBlue; break;
                    case "Q2": point.Color = Color.SaddleBrown; break;
                    case "Q3": point.Color = Color.SpringGreen; break;
                }
                point.Label = string.Format("{0:0} - {1}", point.YValues[0], point.AxisLabel);

            }
        }
    }

    private DataTable MakeAnalysisTable(DataTable dt)
    {
        
            DataTable table = new DataTable();
            table.Columns.Add("Question", typeof(string));
            table.Columns.Add("Average", typeof(int));
            table.Columns.Add("Rating", typeof(string));

            for (int i = 1; i <= 5; i++)
            {
                table.Rows.Add(dt.Rows[0]["Question" + i], dt.Rows[0]["Q" + i], GetRating(Convert.ToInt32(dt.Rows[0]["Q" + i])));
            }

            return table;
        

    }

    //private void GenerateGraphOfRating()
    //{

    //    try
    //    {

    //        DateTime moment = DateTime.Now;

    //        chart1.Visible = false;

    //        chart1.ClientSize = new Size(37, 37);
    //        Bitmap bmp = new Bitmap(chart1.ClientSize.Width, chart1.ClientSize.Height);
    //        for (int row = 0; row < dataGridView_RecentOrder.RowCount; row++)
    //        {
    //            chart1.Series.Clear();
    //            chart1.Legends.Clear();
    //            int Hour = int.Parse(moment.Hour.ToString());
    //            int Min = int.Parse(moment.Minute.ToString());
    //            int Sec = int.Parse(moment.Second.ToString());

    //            //Add a new chart-series
    //            string seriesname = "MySeriesName";
    //            chart1.Series.Add(seriesname);
    //            //set the chart-type to "Pie"
    //            chart1.Series[seriesname].ChartType = SeriesChartType.Pie;

    //            //Add some datapoints so the series. in this case you can pass the values to this method

    //            chart1.Series[seriesname].LabelForeColor = Color.White;
    //            chart1.Series[seriesname].BackSecondaryColor = Color.FromArgb(192, 192, 255);

    //            string OrderDateTime = dataGridView_RecentOrder.Rows[row].Cells["Order_PlacingTime"].Value.ToString();

    //            var result = Convert.ToDateTime(OrderDateTime);

    //            int OHour = int.Parse(result.ToString("HH", System.Globalization.CultureInfo.CurrentCulture));
    //            int OMin = int.Parse(result.ToString("mm", System.Globalization.CultureInfo.CurrentCulture));
    //            int OnSec = int.Parse(result.ToString("ss", System.Globalization.CultureInfo.CurrentCulture));

    //            int OrderMinuts = Convert.ToInt32((OHour * 60) + OMin + OnSec * 0.0166667);
    //            int NowTimeInMinuts = Convert.ToInt32((Hour * 60) + Min + (Sec * 0.0166667));
    //            int FinalOrderMinutes = int.Parse(dataGridView_RecentOrder.Rows[row].Cells["Order_CompletionTime"].Value.ToString()) - (NowTimeInMinuts - OrderMinuts);
    //            if (FinalOrderMinutes <= 0)
    //            {
    //                FinalOrderMinutes = 0;
    //            }
    //            int OrderCompletionTime = int.Parse(dataGridView_RecentOrder.Rows[row].Cells["Order_CompletionTime"].Value.ToString());
    //            if (OrderCompletionTime == 0)
    //            {

    //                OrderCompletionTime = 1;
    //            }

    //            int OrderTimingDifference = OrderCompletionTime - FinalOrderMinutes;
    //            //  MessageBox.Show("Order Min: "+ OrderMinuts.ToString() +"\n Now Time in Min: "+NowTimeInMinuts.ToString());
    //            chart1.Series[seriesname].Points.AddXY("", OrderTimingDifference);
    //            chart1.Series[seriesname].Points.AddXY(FinalOrderMinutes.ToString(), FinalOrderMinutes);

    //            chart1.DrawToBitmap(bmp, chart1.ClientRectangle);

    //            // bmp = OvalImage(bmp);

    //            dataGridView_RecentOrder.Rows[row].Cells["Order_RemaningTime"].Value = bmp.Clone();

    //        }
    //    }
    //    catch (Exception ex)
    //    {

    //        MessageBox.Show(ex.ToString());
    //    }

    //}

    private string GetRating(int avg)
    {
        if(avg<= 5)
        {
            return "Poor";
        }
        else if  (avg <= 10)
            {
            return "Average";
        }
            else if (avg <= 15)
            {
            return "Good";
            }
            else if (avg <= 20)
            {
            return "Excellent";
        }
            else
            {
            return "Brriliant";
        }
    }

    protected void PopulateChart(object sender, EventArgs e)
    {
        // Chart1.Visible = ddlCountries.SelectedValue != "";
        //string query = string.Format("SELECT ShipCity, COUNT(OrderId) [Total] FROM Orders WHERE ShipCountry = '{0}' GROUP BY ShipCity", ddlCountries.SelectedValue);


        cmd = new SqlCommand("spAnaliyis", SqlCon)
        {
            CommandType = CommandType.StoredProcedure
        };
        cmd.Parameters.AddWithValue("@FeedBackId", 1);
        cmd.Parameters.AddWithValue("@Question", "Question1");

        sda = new SqlDataAdapter(cmd);
        dt = new DataTable();
        sda.Fill(dt);

       // DataTable dt = GetData(query);
        //Chart2.DataSource = dt;
        //Chart2.Series[0].ChartType = (SeriesChartType)(7);
        //Chart2.Legends[0].Enabled = true;
        //Chart2.Series[0].XValueMember = "NoOfStudents";
        //Chart2.Series[0].YValueMembers = "Rating";
        //Chart2.DataBind();
    }

   

}