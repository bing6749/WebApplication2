using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication2
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            
            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM YourTable", conn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    
                    while (reader.Read())
                    {
                        // 读取数据
                        // string value = reader["ColumnName"].ToString();
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