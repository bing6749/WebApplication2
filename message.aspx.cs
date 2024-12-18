using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class message : Page
    {
        // 声明控件
        protected TextBox txtName;
        protected TextBox txtEmail;
        protected TextBox txtPhone;
        protected TextBox txtMessage;

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();
                    string query = @"INSERT INTO MessageBoard (Name, Email, Phone, MessageContent) 
                                   VALUES (@Name, @Email, @Phone, @Message)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                        cmd.Parameters.AddWithValue("@Message", txtMessage.Text);

                        cmd.ExecuteNonQuery();
                    }

                    // 清空表单
                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtPhone.Text = "";
                    txtMessage.Text = "";
                    
                    Response.Write("<script>alert('留言提交成功！');window.location='Default.aspx';</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("数据保存失败: " + ex.Message);
                }
            }
        }
    }
}