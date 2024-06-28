using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YourProjectName
{
    public partial class chartgrid : System.Web.UI.Page
    {
        
        private List<string> selectedTableNames = new List<string>();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize checkboxes
                //CheckBox1.Checked = true;
                //selectedTableNames.Add("S1210");
                //Label3.Text = "1210";
                //Label4.Text = "Sanjana";
                //BindGridView();
                //BindChart();
                
            }
        }
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                selectedTableNames.Add("S1210");
                Label3.Text = "1210";
                Label4.Text = "Sanjana";
                //CheckBox1.Checked = false;
                CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                CheckBox4.Checked = false;
                CheckBox5.Checked = false;
                CheckBox6.Checked = false;
            }
            else
            {
                selectedTableNames.Remove("S1210");
                Label3.Text = "";
                Label4.Text = "";
                //CheckBox1.Checked = false;
                CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                CheckBox4.Checked = false;
                CheckBox5.Checked = false;
                CheckBox6.Checked = false;
            }
            BindGridView();
            BindChart();
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox2.Checked)
            {
                selectedTableNames.Add("S1211");
                Label3.Text = "1211";
                Label4.Text = "Subha";
                CheckBox1.Checked = false;
                //CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                CheckBox4.Checked = false;
                CheckBox5.Checked = false;
                CheckBox6.Checked = false;
            }
            else
            {
                selectedTableNames.Remove("S1211");
                Label3.Text = "";
                Label4.Text = "";
                CheckBox1.Checked = false;
                //CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                CheckBox4.Checked = false;
                CheckBox5.Checked = false;
                CheckBox6.Checked = false;
            }
                BindGridView();
                BindChart();
            
            
        }
        protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox3.Checked)
            {
                selectedTableNames.Add("S1212");
                Label3.Text = "1212";
                Label4.Text = "Shreya";
                CheckBox1.Checked = false;
                CheckBox2.Checked = false;
                //CheckBox3.Checked = false;
                CheckBox4.Checked = false;
                CheckBox5.Checked = false;
                CheckBox6.Checked = false;

            }
            else
            {
                selectedTableNames.Remove("S1212");
                Label3.Text = "";
                Label4.Text = "";
                CheckBox1.Checked = false;
                CheckBox2.Checked = false;
                //CheckBox3.Checked = false;
                CheckBox4.Checked = false;
                CheckBox5.Checked = false;
                CheckBox6.Checked = false;
            }
            BindGridView();
            BindChart();
        }
        protected void CheckBox4_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox4.Checked)
            {
                selectedTableNames.Add("S1213");
                Label3.Text = "1213";
                Label4.Text = "Krishna";
                CheckBox1.Checked = false;
                CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                //CheckBox4.Checked = false;
                CheckBox5.Checked = false;
                CheckBox6.Checked = false;
            }
            else
            {
                selectedTableNames.Remove("S1213");
                Label3.Text = "";
                Label4.Text = "";
                CheckBox1.Checked = false;
                CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                //CheckBox4.Checked = false;
                CheckBox5.Checked = false;
                CheckBox6.Checked = false;
            }
            BindGridView();
            BindChart();
        }
        protected void CheckBox5_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox5.Checked)
            {
                selectedTableNames.Add("S1214");
                Label3.Text = "1214";
                Label4.Text = "Saketh";
                CheckBox1.Checked = false;
                CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                CheckBox4.Checked = false;
                //CheckBox5.Checked = false;
                CheckBox6.Checked = false;
            }
            else
            {
                selectedTableNames.Remove("S1214");
                Label3.Text = "";
                Label4.Text = "";
                CheckBox1.Checked = false;
                CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                CheckBox4.Checked = false;
                //CheckBox5.Checked = false;
                CheckBox6.Checked = false;
            }
            BindGridView();
            BindChart();
        }
        protected void CheckBox6_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox6.Checked)
            {
                selectedTableNames.Add("S1215");
                Label3.Text = "1215";
                Label4.Text = "Anirudh";
                CheckBox1.Checked = false;
                CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                CheckBox4.Checked = false;
                CheckBox5.Checked = false;
                //CheckBox6.Checked = false;

            }
            else
            {
                selectedTableNames.Remove("S1215");
                Label3.Text = "";
                Label4.Text = "";
                CheckBox1.Checked = false;
                CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                CheckBox4.Checked = false;
                CheckBox5.Checked = false;
                //CheckBox6.Checked = false;
            }
            BindGridView();
            BindChart();
        }

        private void BindGridView()
        {
            if (selectedTableNames.Count == 0)
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                return;
            }
            using (SqlConnection connection = new SqlConnection(@"Data Source=SANJANA-PC\SQLEXPRESS;Initial Catalog=MyProject;Integrated Security=True"))
            {
                string query = $"SELECT Semester, Math, Science, English FROM {string.Join(", ", selectedTableNames.Select(t => $"[{t}]"))}";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }

        private void BindChart()
        {
            if (selectedTableNames.Count == 0)
            {
                return;
            }

            using (SqlConnection connection = new SqlConnection(@"Data Source=SANJANA-PC\SQLEXPRESS;Initial Catalog=MyProject;Integrated Security=True"))
            {
                string query = $"SELECT Semester, Math, Science, English FROM  {string.Join(", ", selectedTableNames.Select(t => $"[{t}]"))}";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                List<string> labels = new List<string>();
                List<int> data1 = new List<int>();
                List<int> data2 = new List<int>();
                List<int> data3 = new List<int>();

                foreach (DataRow row in dataTable.Rows)
                {
                    labels.Add(row["Semester"].ToString());
                    data1.Add(Convert.ToInt32(row["Math"]));
                    data2.Add(Convert.ToInt32(row["Science"]));
                    data3.Add(Convert.ToInt32(row["English"]));
                }

                string chartData = $"{{labels: {Newtonsoft.Json.JsonConvert.SerializeObject(labels)}, datasets: [{{label: 'Math', data: {Newtonsoft.Json.JsonConvert.SerializeObject(data1)}, backgroundColor: 'rgba(204, 0, 0)'}}, {{label: 'Science', data: {Newtonsoft.Json.JsonConvert.SerializeObject(data2)}, backgroundColor: 'rgba(11,83,148)'}}, {{label: 'English', data: {Newtonsoft.Json.JsonConvert.SerializeObject(data3)}, backgroundColor: 'rgba(241,194,50)'}}]}}";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "chartData", $"var chartData = {chartData};", true);
            }
        }

        
    }
}
