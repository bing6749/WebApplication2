using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class message : System.Web.UI.Page
    {
        protected Repeater rptMessages;
        protected TextBox txtName;
        protected TextBox txtEmail;
        protected TextBox txtPhone;
        protected TextBox txtMessage;
        protected Button btnSubmit;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecentMessages();
            }
        }

        private void LoadRecentMessages()
        {
            string connString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = @"SELECT Name, Email, MessageContent, SubmitTime 
                               FROM MessageBoard 
                               WHERE SubmitTime >= DATEADD(day, -1, GETDATE())
                               ORDER BY SubmitTime DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    try
                    {
                        conn.Open();
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        rptMessages.DataSource = dt;
                        rptMessages.DataBind();
                    }
                    catch (Exception ex)
                    {
                        // 处理错误
                        Response.Write("Error: " + ex.Message);
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = @"INSERT INTO MessageBoard (Name, Email, MessageContent, SubmitTime) 
                               VALUES (@Name, @Email, @MessageContent, GETDATE())";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@MessageContent", txtMessage.Text.Trim());

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        
                        // 清空表单
                        txtName.Text = "";
                        txtEmail.Text = "";
                        txtPhone.Text = "";
                        txtMessage.Text = "";

                        // 重新加载留言列表
                        LoadRecentMessages();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Error: " + ex.Message);
                    }
                }
            }
        }
    }
}