using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class ClassWorks : Page
    {
        protected ListView lvWorks;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadWorks();
            }
        }

        private void LoadWorks()
        {
            string connString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();
                    string query = @"SELECT Title, Author, Description 
                                   FROM StudentWorks 
                                   ORDER BY SubmitTime DESC";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            lvWorks.DataSource = reader;
                            lvWorks.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("数据库连接错误: " + ex.Message);
                }
            }
        }
    }
}