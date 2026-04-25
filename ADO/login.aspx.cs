using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

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
            //    string cs = "Data Source=DESKTOP-SRMBPCR;Initial Catalog=Logindb;Integrated Security=true;TrustServerCertificate=true";
            //    SqlConnection conn = new SqlConnection(cs);
            //    conn.Open();

            //    SqlCommand cmd=new SqlCommand("insert into Logins values('"+txtuname.Text+"','"+txtpwd.Text+"')", conn);
            //    cmd.ExecuteNonQuery();
            //    Response.Write("Login details Submitted Successfully");
            //    conn.Close();


            SqlConnection con = new SqlConnection("Data Source=.;" +
               "Initial Catalog=LoginDB;" +
               "Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Logins " +
                "values('" + txtuname.Text +
                "','" + txtpwd.Text + "')", con);
            cmd.ExecuteNonQuery();
            Response.Write("Login details submitted successfully");
            con.Close();
            BindGridData();


        }
        private void BindGridData()
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LoginDB;" +
                            "Integrated Security=True");
            SqlDataAdapter da = new SqlDataAdapter("select * from Logins", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            grdData.DataSource = ds;
            grdData.DataBind();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LoginDB;" +
                            "Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("update Logins set Password='" + txtpwd.Text +
                "' where Username='" + txtuname.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindGridData();


        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LoginDB;" +
                          "Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from Logins where Username='" + txtuname.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindGridData();

        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LoginDB;" +
                            "Integrated Security=True");

            //implement search using like predicate
            SqlCommand cmd = new SqlCommand("select * from Logins where Username like '%" + txtsearch.Text + "%'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            grdData.DataSource = ds;
            grdData.DataBind();
        }
    
    }
}