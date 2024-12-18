using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class classDiary : Page
    {
        protected ListView lvDiary;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllMessages();
            }
        }

        private void LoadAllMessages()
        {
            string connString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();
                    string query = @"SELECT MessageID, Name, MessageContent, SubmitTime 
                                   FROM MessageBoard 
                                   ORDER BY SubmitTime DESC";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            lvDiary.DataSource = reader;
                            lvDiary.DataBind();
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