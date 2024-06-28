using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dashboard;
using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;

namespace MyProject
{
    public partial class Chart : Page
    {
        public string Labels { get; set; }
        public string Data1 { get; set; }
        public string Data2 { get; set; }
        public string Data3 { get; set; }
        public string ChartType { get; set; }
        public bool ShowLegend { get; set; } = true;

        private System.Timers.Timer _chartUpdateTimer;
        private int _chartUpdateIntervalSeconds = 5;

        private Button myButton;

        int a, b;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (DropDownList1.SelectedValue == "Daily" )
                { 
                    DropDownList4.SelectedValue = "JUN";
                    DropDownList5.SelectedValue = "JUN";
                    DateTime latestDate = GetLatestDateFromDatabase();
                    BindChart(new DateTime(2024, 06, 1), latestDate ,"line");
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "RefreshAlert", "alert('Page refreshed!');", true);
                }
                else if(DropDownList1.SelectedValue == "Monthly")
                {
                    BindChart(new DateTime(2024, 06, 1), new DateTime(2024, 06, 22), "bar");
                    
                }
                //InsertDataIntoDatabase();
                StartChartUpdateTimer();
                
            }
        }

        private void InsertDataIntoDatabase()
        {
            using (SqlConnection connection = new SqlConnection(@"Data Source=SANJANA-PC\SQLEXPRESS;Initial Catalog=MyProject;Integrated Security=True"))
            {
                connection.Open();
                string insertQuery = "INSERT INTO Info (Date, Productions, Temperature, Pressure) VALUES (@CurrentDate, @R1 , @R2, @R3 )";
                SqlCommand command = new SqlCommand(insertQuery, connection);
                Random random1 = new Random();
                //Random random2 = new Random();
                //Random random3 = new Random();
                int r1= random1.Next(30000, 50001);
                int r2= random1.Next(20, 71);
                float r3 = (float)(random1.NextDouble() * 0.7 + 0.2);
                DateTime latestDate = GetLatestDateFromDatabase();
                DateTime r4 = latestDate.AddDays(1);

                if (r4 <= new DateTime(2024, 12, 31))
                {
                    command.Parameters.AddWithValue("@CurrentDate", r4);
                    command.Parameters.AddWithValue("@R1", r1);
                    command.Parameters.AddWithValue("@R2", r2);
                    command.Parameters.AddWithValue("@R3", r3);
                    command.ExecuteNonQuery();
                }
            }
            UpdateChart();
        }
        private DateTime GetLatestDateFromDatabase()
        {
            DateTime latestDate;

            using (SqlConnection connection = new SqlConnection(@"Data Source=SANJANA-PC\SQLEXPRESS;Initial Catalog=MyProject;Integrated Security=True"))
            {
                string query = "SELECT TOP 1 [Date] FROM [Info] ORDER BY [Date] DESC";
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    object result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        latestDate = (DateTime)result;
                    }
                    else
                    {
                        latestDate = new DateTime(2024, 6, 1); // Set a default date if the table is empty
                    }
                }
            }

            return latestDate;
        }

        private void StartChartUpdateTimer()
        {
            _chartUpdateTimer = new System.Timers.Timer(_chartUpdateIntervalSeconds * 1000);
            _chartUpdateTimer.Elapsed += ChartUpdateTimer_Elapsed;
            _chartUpdateTimer.Start();
        }

        private void ChartUpdateTimer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            // Update the chart data
            InsertDataIntoDatabase();

            // Refresh the chart
            UpdateChart();

            //string script = $"document.getElementById('{Button1.ClientID}').click();";
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "TriggerButton1Click", script, true);
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "RefreshPage", "window.location.reload();", true);



            // Check if the latest date is equal to 2024-12-31
            DateTime latestDate = GetLatestDateFromDatabase();
            if (latestDate >= new DateTime(2024, 12, 31))
            {
                // Stop the timer
                _chartUpdateTimer.Stop();
            }
        }


        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateChart();
        }
        
        private void BindChart(DateTime startDate, DateTime endDate, string chartType)
        {
            ChartType = chartType;
            ShowLegend = CheckBox1.Checked;

            if (DropDownList1.SelectedValue == "Daily")
            {
                List<string> chartLabels = new List<string>();
                List<double> chartData1 = new List<double>();
                List<double> chartData2 = new List<double>();
                List<double> chartData3 = new List<double>();

                using (SqlConnection connection = new SqlConnection(@"Data Source=SANJANA-PC\SQLEXPRESS;Initial Catalog=MyProject;Integrated Security=True"))
                {
                    string query = "SELECT [Date], [Temperature], [Productions] , [Pressure] FROM [Info] WHERE [Date] BETWEEN @StartDate AND @EndDate ORDER BY [Date]";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add the parameters using AddWithValue()
                        command.Parameters.AddWithValue("@StartDate", startDate);
                        command.Parameters.AddWithValue("@EndDate", endDate.AddDays(1).AddSeconds(-1));

                        connection.Open();
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        foreach (DataRow row in dataTable.Rows)
                        {
                            chartLabels.Add(((DateTime)row["Date"]).ToString("MM-dd"));
                            chartData1.Add(Convert.ToDouble(row["Productions"]));
                            chartData2.Add(Convert.ToDouble(row["Temperature"]));
                            chartData3.Add(Convert.ToDouble(row["Pressure"]));
                        }
                    }



                    Labels = JsonConvert.SerializeObject(chartLabels);
                    Data1 = JsonConvert.SerializeObject(chartData1);
                    Data2 = JsonConvert.SerializeObject(chartData2);
                    Data3 = JsonConvert.SerializeObject(chartData3);
                }

            }
            else if (DropDownList1.SelectedValue == "Monthly")
            {
                List<string> chartLabels = new List<string>();
                List<double> chartData1 = new List<double>();
                List<double> chartData2 = new List<double>();
                List<double> chartData3 = new List<double>();

                using (SqlConnection connection = new SqlConnection(@"Data Source=SANJANA-PC\SQLEXPRESS;Initial Catalog=MyProject;Integrated Security=True"))
                {
                    string query = "SELECT DATENAME(MONTH, [Date]) AS [Month], AVG([Productions]) AS [AvgProductions],AVG([Temperature]) AS [AvgTemperature] ,AVG([Pressure]) AS [AvgPressure] FROM [MyProject].[dbo].[Info] WHERE [Date] BETWEEN @StartDate AND @EndDate GROUP BY DATENAME(MONTH, [Date]), MONTH([Date]) ORDER BY MONTH([Date])";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add the parameters using AddWithValue()
                        command.Parameters.AddWithValue("@StartDate", startDate);
                        command.Parameters.AddWithValue("@EndDate", endDate.AddDays(1).AddSeconds(-1));

                        connection.Open();
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        foreach (DataRow row in dataTable.Rows)
                        {
                            chartLabels.Add((row["Month"]).ToString());
                            chartData1.Add(Convert.ToDouble(row["AvgProductions"]));
                            chartData2.Add(Convert.ToDouble(row["AvgTemperature"]));
                            chartData3.Add(Convert.ToDouble(row["AvgPressure"]));
                        }
                    }
                }

                Labels = JsonConvert.SerializeObject(chartLabels);
                Data1 = JsonConvert.SerializeObject(chartData1);
                Data2 = JsonConvert.SerializeObject(chartData2);
                Data3 = JsonConvert.SerializeObject(chartData3);
            }
            else
                {
                    List<string> chartLabels = new List<string>();
                    List<double> chartData1 = new List<double>();
                    List<double> chartData2 = new List<double>();
                    List<double> chartData3 = new List<double>();

                    using (SqlConnection connection = new SqlConnection(@"Data Source=SANJANA-PC\SQLEXPRESS;Initial Catalog=MyProject;Integrated Security=True"))
                    {
                        string query = "SELECT [Date], [Temperature], [Productions] , [Pressure] FROM [Info] WHERE [Date] BETWEEN @StartDate AND @EndDate ORDER BY [Date]";
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            // Add the parameters using AddWithValue()
                            command.Parameters.AddWithValue("@StartDate", startDate);
                            command.Parameters.AddWithValue("@EndDate", endDate.AddDays(1).AddSeconds(-1));

                            connection.Open();
                            SqlDataAdapter adapter = new SqlDataAdapter(command);
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);

                            foreach (DataRow row in dataTable.Rows)
                            {
                                chartLabels.Add(((DateTime)row["Date"]).ToString("MM-dd"));
                                chartData1.Add(Convert.ToDouble(row["Productions"]));
                                chartData2.Add(Convert.ToDouble(row["Temperature"]));
                                chartData3.Add(Convert.ToDouble(row["Pressure"]));
                            }
                        }

                        Labels = JsonConvert.SerializeObject(chartLabels);
                        Data1 = JsonConvert.SerializeObject(chartData1);
                        Data2 = JsonConvert.SerializeObject(chartData2);
                        Data3 = JsonConvert.SerializeObject(chartData3);
                    }
                }
            }

            private void UpdateChart()
            {
            
                //ClientScript.RegisterStartupScript(this.GetType(), "UpdateChart", $"updateChart({Labels}, {Data},'{cat}');", true);

            ShowLegend = CheckBox1.Checked;
            ClientScript.RegisterStartupScript(this.GetType(), "updateChart", $"updateChart('{Labels}', '{Data1}', '{Data2}','{Data3}','{ShowLegend}', '{ChartType}');", true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "Daily" )
            {
                //int startDay = int.Parse(DropDownList2.SelectedValue);
                //int endDay = int.Parse(DropDownList3.SelectedValue);
                //DateTime startDate = new DateTime(2024, 06, startDay);
                //DateTime endDate = new DateTime(2024, 06, endDay);
                //BindChart(startDate, endDate);
                Calculate(DropDownList4.SelectedValue, DropDownList5.SelectedValue);
                BindChart(new DateTime(2024, a, 1), new DateTime(2024, b, 30), "line");
            }
            else if(DropDownList1.SelectedValue == "Monthly")
            {
                Calculate(DropDownList2.SelectedValue, DropDownList3.SelectedValue);
                DateTime latestDate = GetLatestDateFromDatabase();
                string q = latestDate.ToString("MM");
                if (DropDownList3.SelectedValue == q)
                {
                    BindChart(new DateTime(2024, a, 1), latestDate, "bar");
                }
                else
                { 
                    BindChart(new DateTime(2024, a, 1), new DateTime(2024, b, 30), "bar"); 
                }
            }
            else
            {
                DateTime latestDate = GetLatestDateFromDatabase();
                DateTime end = latestDate.AddDays(-10);
                Label5.Visible = true;
                Label6.Visible = true;
                Label5.Text = end.ToString("yyyy-MM-dd");
                Label6.Text = latestDate.ToString("yyyy-MM-dd");
                BindChart(end, latestDate, "line");
            }
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateChart();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
          if(DropDownList1.SelectedValue == "Daily" )
            {
                DropDownList2.Visible = false;
                DropDownList3.Visible = false;
                DropDownList4.Visible = true;
                DropDownList5.Visible = true;
                Label5.Visible = false;
                Label6.Visible = false;
            }
          else if(DropDownList1.SelectedValue == "Monthly")
            { 
                DropDownList2.Visible = true;
                DropDownList3.Visible = true;
                DropDownList4.Visible = false;
                DropDownList5.Visible = false;
                Label5.Visible = false;
                Label6.Visible = false;
            }
          else
            {

                DropDownList2.Visible = false;
                DropDownList3.Visible = false;
                DropDownList4.Visible = false;
                DropDownList5.Visible = false;
                DateTime latestDate = GetLatestDateFromDatabase();
                DateTime end = latestDate.AddDays(-10);
                Label5.Visible = true;
                Label6.Visible = true;
                Label5.Text= end.ToString();
                Label6.Text= latestDate.ToString();

            }
        }
        private void Calculate(string x, string y)
        {

            switch (x)
            {
                case "JAN": a = 1; break;
                case "FEB": a = 2; break;
                case "MAR": a = 3; break;
                case "APR": a = 4; break;
                case "MAY": a = 5; break;
                case "JUN": a = 6; break;
                case "JUL": a = 7; break;
                case "AUG": a = 8; break;
                case "SEP": a = 9; break;
                case "OCT": a = 10; break;
                case "NOV": a = 11; break;
                case "DEC": a = 12; break;

                default: a = 1; break; // Handle default case as needed
            }

            switch (y)
            {
                case "JAN": b = 1; break;
                case "FEB": b = 2; break;
                case "MAR": b = 3; break;
                case "APR": b = 4; break;
                case "MAY": b = 5; break;
                case "JUN": b = 6; break;
                case "JUL": b = 7; break;
                case "AUG": b = 8; break;
                case "SEP": b = 9; break;
                case "OCT": b = 10; break;
                case "NOV": b = 11; break;
                case "DEC": b = 12; break;

                default: b = 6; break; // Handle default case as needed
            }
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateChart();
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            UpdateChart();
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateChart();
        }
    }
}
