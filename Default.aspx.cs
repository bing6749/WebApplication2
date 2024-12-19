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
        protected Panel pnlAdminControls;
        protected Panel pnlNoAccess;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAnnouncements();
                CheckUserAccess();
            }
        }

        private void CheckUserAccess()
        {
            if (User.Identity.IsAuthenticated)
            {
                string connString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "SELECT Role FROM Users WHERE Username = @Username";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", User.Identity.Name);
                        try
                        {
                            conn.Open();
                            object result = cmd.ExecuteScalar();
                            if (result != null && result.ToString() == "admin")
                            {
                                pnlAdminControls.Visible = true;
                            }
                            else
                            {
                                pnlAdminControls.Visible = false;
                            }
                        }
                        catch (Exception)
                        {
                            pnlAdminControls.Visible = false;
                        }
                    }
                }
            }
            else
            {
                pnlAdminControls.Visible = false;
            }
        }

        private void LoadAnnouncements()
        {
            string connString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            List<Announcement> announcements = new List<Announcement>();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();
                    string query = @"SELECT TOP 4 AnnouncementID, Content, CreateTime 
                                   FROM Announcements 
                                   ORDER BY CreateTime DESC";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                announcements.Add(new Announcement
                                {
                                    AnnouncementID = Convert.ToInt32(reader["AnnouncementID"]),
                                    Title = reader["Content"].ToString(),
                                    Url = $"~/Announcement.aspx?id={reader["AnnouncementID"]}",
                                    SubmitTime = Convert.ToDateTime(reader["CreateTime"]),
                                    Author = "班级管理员"
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

        public bool IsAdmin
        {
            get
            {
                if (User.Identity.IsAuthenticated)
                {
                    string connString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(connString))
                    {
                        string query = "SELECT Role FROM Users WHERE Username = @Username";
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@Username", User.Identity.Name);
                            try
                            {
                                conn.Open();
                                object result = cmd.ExecuteScalar();
                                return (result != null && result.ToString() == "admin");
                            }
                            catch
                            {
                                return false;
                            }
                        }
                    }
                }
                return false;
            }
        }

        protected void lvAnnouncements_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete" && IsAdmin)
            {
                int announcementId = Convert.ToInt32(e.CommandArgument);
                string connString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "DELETE FROM Announcements WHERE AnnouncementID = @AnnouncementID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@AnnouncementID", announcementId);
                        try
                        {
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            // 重新加载公告列表
                            LoadAnnouncements();
                        }
                        catch (Exception ex)
                        {
                            Response.Write("删除失败: " + ex.Message);
                        }
                    }
                }
            }
        }
    }

    public partial class Announcement
    {
        public int AnnouncementID { get; set; }
        public string Title { get; set; }
        public string Url { get; set; }
        public DateTime SubmitTime { get; set; }
        public string Author { get; set; }
    }
}