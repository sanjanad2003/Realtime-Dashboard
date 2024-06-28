using System;
using System.Data.SqlClient;
using System.Configuration;

namespace YourProjectName
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUsername.Focus();
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Establish the database connection
            SqlConnection connection = new SqlConnection(@"Data Source=SANJANA-PC\SQLEXPRESS;Initial Catalog=MyProject;Integrated Security=True");
            {
                // Create the SQL query to verify the user
                string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username AND Password = @Password";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Username", username);
                command.Parameters.AddWithValue("@Password", password);

                // Open the connection and execute the query
                connection.Open();
                int count = (int)command.ExecuteScalar();

                // Check if the user is valid
                if (count > 0)
                {
                    // Redirect the user to the "welcome.aspx" page
                    Response.Redirect("Chart.aspx");
                }
                else
                {
                    // Display an error message
                    lblMessage.Text = "Invalid username or password.";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
        }
    }
}
