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
    public partial class UserRegistration : System.Web.UI.Page
    {
        string cs = "Data Source=.;Initial Catalog=registrationdb;Integrated Security=true;TrustServerCertificate=true";
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
               
                LoadData();
            }
        } 
            void ClearForm()
            {
                txtfname.Text = "";
                txtlname.Text = "";
                txtpwd.Text = "";
                txtage.Text = "";
                txtmobile.Text = "";
                txtdob.Text = "";
                txthobbies.Text = "";
                txtgender.Text = "";
                txtconfirmpwd.Text = "";

               
            }

        
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    string query = "INSERT INTO regtable VALUES(@fname,@lname,@gender,@dob,@pwd,@age,@hobbies,@mobile)";
                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@fname", txtfname.Text);
                    cmd.Parameters.AddWithValue("@lname", txtlname.Text);
                    cmd.Parameters.AddWithValue("@gender", txtgender.Text);
                    cmd.Parameters.AddWithValue("@dob", txtdob.Text);
                    cmd.Parameters.AddWithValue("@pwd", txtpwd.Text);
                    cmd.Parameters.AddWithValue("@age", txtage.Text);
                    cmd.Parameters.AddWithValue("@hobbies",txthobbies.Text);
                    cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();

                    LoadData();
                    ClearForm();
                }
            }
        
        }
        
        void LoadData()
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "SELECT * FROM regtable";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                griddata.DataSource = dt;
                griddata.DataBind();
            }
        }


        protected void btnupdate_Click(object sender, EventArgs e)
        {
            //using (SqlConnection conn = new SqlConnection(cs))
            //{
            //    string query = "UPDATE regtable SET FirstName=@fname, LastName=@lname, Gender=@gender, DateofBirth=@dob, Password=@pwd, Age=@age, Hobbies=@hobbies WHERE Mobilenumber=@mobile";

            //    SqlCommand cmd = new SqlCommand(query, conn);

            //    cmd.Parameters.AddWithValue("@fname", txtfname.Text);
            //    cmd.Parameters.AddWithValue("@lname", txtlname.Text);
            //    cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
            //    cmd.Parameters.AddWithValue("@dob", GetDOB());
            //    cmd.Parameters.AddWithValue("@pwd", txtpwd.Text);
            //    cmd.Parameters.AddWithValue("@age", txtage.Text);
            //    cmd.Parameters.AddWithValue("@hobbies", GetHobbies());
            //    cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);

            //    conn.Open();
            //    cmd.ExecuteNonQuery();

            //    LoadData();
            //    ClearForm();
            //}
        
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            
            //using (SqlConnection conn = new SqlConnection(cs))
            //{
            //    string query = "DELETE FROM regtable WHERE Mobilenumber=@mobile";
            //    SqlCommand cmd = new SqlCommand(query, conn);

            //    cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);

            //    conn.Open();
            //    cmd.ExecuteNonQuery();

            //    LoadData();
            //    ClearForm();
            //}
        

        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "SELECT * FROM regtable WHERE FirstName LIKE @search OR Mobilenumber LIKE @search";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.SelectCommand.Parameters.AddWithValue("@search", "%" + txtsearch.Text + "%");

                DataTable dt = new DataTable();
                da.Fill(dt);

                griddata.DataSource = dt;
                griddata.DataBind();
            }
        }

       

        protected void griddata_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            griddata.PageIndex=e.NewPageIndex;
            LoadData();
        }

        protected void griddata_RowEditing(object sender, GridViewEditEventArgs e)
        {
            griddata.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void griddata_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            griddata.EditIndex = -1;
            LoadData();
        }

        protected void griddata_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //string cs = "Data Source=.;Initial Catalog=registrationdb;Integrated Security=True";
            SqlConnection conn = new SqlConnection(cs);
            conn.Open();
            GridViewRow grd = griddata.Rows[e.RowIndex];
            string firstname = ((TextBox)grd.FindControl("txtfirstname")).Text;
            string Lastname = ((TextBox)grd.FindControl("txtlastname")).Text;
            string gender = ((TextBox)grd.FindControl("txtgender")).Text;
            string DateofBirth= ((TextBox)grd.FindControl("txtdob")).Text;
            string password = ((TextBox)grd.FindControl("txtpwd")).Text;
            string age = ((TextBox)grd.FindControl("txtage")).Text;
            string hobbies = ((TextBox)grd.FindControl("txthobbies")).Text;
            string mobilenumber = ((TextBox)grd.FindControl("txtmobile")).Text;
            SqlCommand cmd =new SqlCommand("update regtable set firstname=@firstname,"+
                "lastname=@lastname,"+"gender=@gender,"+"DateofBirth=@DateofBirth,"+
                "password=@password,"+"age=@age,"+"Hobbies=@hobbies where mobilenumber=@mobilenumber",conn);
            cmd.Parameters.AddWithValue("@firstname",firstname);
            cmd.Parameters.AddWithValue("@lastname", Lastname);
            cmd.Parameters.AddWithValue("@gender", gender);
            cmd.Parameters.AddWithValue("@DateofBirth", DateofBirth);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@age", age);
            cmd.Parameters.AddWithValue("@hobbies", hobbies);
            cmd.Parameters.AddWithValue("@mobilenumber", mobilenumber);
            cmd.ExecuteNonQuery();
            conn.Close();
            LoadData();
        }

        protected void griddata_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //string cs = "Data Source=.;Initial Catalog=registrationdb;Integrated Security=True";
            SqlConnection conn = new SqlConnection(cs);
            conn.Open();
            GridViewRow grd = griddata.Rows[e.RowIndex];

            string mobilenumber = griddata.DataKeys[e.RowIndex].Value.ToString();
    
            SqlCommand cmd = new SqlCommand("delete from regtable where mobilenumber=@mobilenumber", conn);
            cmd.Parameters.AddWithValue("@mobilenumber", mobilenumber);
            
            cmd.ExecuteNonQuery();
            conn.Close();
            LoadData();
        }
    }

}