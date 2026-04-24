using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ADO
{
    public partial class registrationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode=UnobtrusiveValidationMode.None;   
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string cs = "Data Source=DESKTOP-SRMBPCR;Initial Catalog=registrationdb;Integrated Security=true;TrustServerCertificate=true";
            SqlConnection conn = new SqlConnection(cs);
            conn.Open();
            
            SqlCommand cmd = new SqlCommand("insert into regtable values('" + txtfname.Text + "','" + txtlname.Text + "','" + txtpwd.Text + "','" + txtconfirmpwd.Text + "','" + txtage.Text + "','" + txtmobile.Text + "')",conn);
            cmd.ExecuteNonQuery();
            Response.Write("registration successfully");
            conn.Close();
        }
    }
}