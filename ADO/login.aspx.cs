using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ADO
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode=UnobtrusiveValidationMode.None;
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string cs = "Data Source=DESKTOP-SRMBPCR;Initial Catalog=Logindb;Integrated Security=true;TrustServerCertificate=true";
            SqlConnection conn = new SqlConnection(cs);
            conn.Open();
           
            SqlCommand cmd=new SqlCommand("insert into Logins values('"+txtuname.Text+"','"+txtpwd.Text+"')", conn);
            cmd.ExecuteNonQuery();
            Response.Write("Login details Submitted Successfully");
            conn.Close();
        }
    }
}