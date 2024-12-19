using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Login : System.Web.UI.Page
    {
        protected TextBox txtUsername;
        protected TextBox txtPassword;
        protected Label lblError;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 如果已经登录，跳转到首页
            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // 验证用户名和密码不能为空
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "用户名和密码不能为空";
                lblError.Visible = true;
                return;
            }

            // 验证用户
            if (ValidateUser(username, password))
            {
                // 登录成功，创建认证票据
                FormsAuthentication.SetAuthCookie(username, false);
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                lblError.Text = "用户名或密码错误";
                lblError.Visible = true;
            }
        }

        private bool ValidateUser(string username, string password)
        {
            string connString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT COUNT(1) FROM Users WHERE Username=@Username AND Password=@Password";
                
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    
                    try
                    {
                        conn.Open();
                        int count = (int)cmd.ExecuteScalar();
                        return count > 0;
                    }
                    catch (Exception)
                    {
                        return false;
                    }
                }
            }
        }
    }
}