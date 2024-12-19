using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Announcement : System.Web.UI.Page
    {
        protected Panel pnlAdminAccess;
        protected Panel pnlNoAccess;
        protected Label lblError;
        protected TextBox txtContent;
        protected Button btnSubmit;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 检查用户是否已登录
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            // 检查用户角色
            CheckUserAccess();
        }

        private void CheckUserAccess()
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
                            pnlAdminAccess.Visible = true;
                            pnlNoAccess.Visible = false;
                        }
                        else
                        {
                            pnlAdminAccess.Visible = false;
                            pnlNoAccess.Visible = true;
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = "发生错误：" + ex.Message;
                        lblError.Visible = true;
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtContent.Text))
            {
                lblError.Text = "公告内容不能为空";
                lblError.Visible = true;
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "INSERT INTO Announcements (Content, CreateTime) VALUES (@Content, GETDATE())";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Content", txtContent.Text.Trim());
                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        // 清空输入框
                        txtContent.Text = "";
                        // 显示成功消息
                        lblError.Text = "公告发布成功！";
                        lblError.Visible = true;
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = "发布失败：" + ex.Message;
                        lblError.Visible = true;
                    }
                }
            }
        }
    }
}