using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADO
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode=UnobtrusiveValidationMode.None;
            if(!IsPostBack)
                BindGridData();
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
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=Logindb;" +
                            "Integrated Security=True");
            SqlDataAdapter da = new SqlDataAdapter("select * from Logins", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            grdData.DataSource = ds;
            grdData.DataBind();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            //SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LoginDB;" +
            //                "Integrated Security=True");
            //con.Open();
            //SqlCommand cmd = new SqlCommand("update Logins set Password='" + txtpwd.Text +
            //    "' where Username='" + txtuname.Text + "'", con);
            //cmd.ExecuteNonQuery();
            //con.Close();
            //BindGridData();


        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            //SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=LoginDB;" +
            //              "Integrated Security=True");
            //con.Open();
            //SqlCommand cmd = new SqlCommand("delete from Logins where Username='" + txtuname.Text + "'", con);
            //cmd.ExecuteNonQuery();
            //con.Close();
            //BindGridData();

        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=Logindb;" +
                            "Integrated Security=True");

            //implement search using like predicate
            SqlCommand cmd = new SqlCommand("select * from Logins where username like '%" + txtsearch.Text + "%'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            grdData.DataSource = ds;
            grdData.DataBind();
        }

        protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdData.PageIndex = e.NewPageIndex;
            BindGridData();
        }

        protected void grdData_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdData.EditIndex = e.NewEditIndex;
            BindGridData();
        }

        protected void grdData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdData.EditIndex = -1;
            BindGridData(); 
        }

        protected void grdData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=.;" +
                "Initial Catalog=Logindb;" +
                "Integrated Security=True");
            conn.Open();
            GridViewRow grd = grdData.Rows[e.RowIndex];
            int uid = Convert.ToInt32(grdData.DataKeys[e.RowIndex].Value);
            string username = ((TextBox)grd.FindControl("Txtuname")).Text;
            string password =((TextBox)grd.FindControl("txtpwd")).Text;
            SqlCommand cmd = new SqlCommand("update Logins set username=@username," +
                "password=@password where uid=@uid", conn);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@uid", uid);
            cmd.ExecuteNonQuery();
            conn.Close();
            BindGridData();


        }

        protected void grdData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=.;" +
               "Initial Catalog=Logindb;" +
               "Integrated Security=True");
            GridViewRow grd = grdData.Rows[e.RowIndex];
            int uid = Convert.ToInt32(grdData.DataKeys[e.RowIndex].Value);
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete from Logins where uid=@uid", conn);
            cmd.Parameters.AddWithValue("@uid", uid);
            cmd.ExecuteNonQuery();
            conn.Close();
            BindGridData();


        }
    }
}