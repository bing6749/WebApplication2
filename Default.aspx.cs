using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class _Default : Page
    {
        protected ListView lvAnnouncements;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMessages();
            }
        }

        private void LoadMessages()
        {
            string connString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            List<Announcement> announcements = new List<Announcement>();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();
                    string query = @"SELECT TOP 4 MessageID, Name, MessageContent, SubmitTime 
                                   FROM MessageBoard 
                                   ORDER BY SubmitTime DESC";
                    
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                announcements.Add(new Announcement
                                {
                                    Title = reader["MessageContent"].ToString(),
                                    Url = $"~/MessageBoard.aspx?id={reader["MessageID"]}",
                                    SubmitTime = Convert.ToDateTime(reader["SubmitTime"]),
                                    Author = reader["Name"].ToString()
                                });
                            }
                        }
                    }

                    lvAnnouncements.DataSource = announcements;
                    lvAnnouncements.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("数据库连接错误: " + ex.Message);
                }
            }
        }
    }

    public class Announcement
    {
        public string Title { get; set; }
        public string Url { get; set; }
        public DateTime SubmitTime { get; set; }
        public string Author { get; set; }
    }
}