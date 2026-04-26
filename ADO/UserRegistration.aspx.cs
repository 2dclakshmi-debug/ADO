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
                BindDOB();
                LoadData();
            }
        }
            // -------------------- DOB DROPDOWN --------------------
            void BindDOB()
            {
                // Day
                ddlday.Items.Add("--Day--");
                for (int i = 1; i <= 31; i++)
                    ddlday.Items.Add(i.ToString());

                // Month
                ddlmonth.Items.Add("--Month--");
                for (int i = 1; i <= 12; i++)
                    ddlmonth.Items.Add(i.ToString());

                // Year
                ddlyear.Items.Add("--Year--");
                for (int i = 1990; i <= DateTime.Now.Year; i++)
                    ddlyear.Items.Add(i.ToString());
            }
            string GetHobbies()
            {
                var selected = cblhobbies.Items.Cast<System.Web.UI.WebControls.ListItem>()
                                 .Where(i => i.Selected)
                                 .Select(i => i.Text);

                return string.Join(",", selected);
            }

        string GetDOB()
        {
            if (ddlday.SelectedIndex == 0 || ddlmonth.SelectedIndex == 0 || ddlyear.SelectedIndex == 0)
                return null;

            DateTime dob = new DateTime(
                Convert.ToInt32(ddlyear.SelectedValue),
                Convert.ToInt32(ddlmonth.SelectedValue),
                Convert.ToInt32(ddlday.SelectedValue)
            );

            return dob.ToString("yyyy-MM-dd");
        }
            void ClearForm()
            {
                txtfname.Text = "";
                txtlname.Text = "";
                txtpwd.Text = "";
                txtage.Text = "";
                txtmobile.Text = "";

                rblgender.ClearSelection();

                // Reset DOB dropdowns
                ddlday.SelectedIndex = 0;
                ddlmonth.SelectedIndex = 0;
                ddlyear.SelectedIndex = 0;

                // Uncheck hobbies
                foreach (ListItem item in cblhobbies.Items)
                {
                    item.Selected = false;
                }
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
                    cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
                    cmd.Parameters.AddWithValue("@dob", GetDOB());
                    cmd.Parameters.AddWithValue("@pwd", txtpwd.Text);
                    cmd.Parameters.AddWithValue("@age", txtage.Text);
                    cmd.Parameters.AddWithValue("@hobbies", GetHobbies());
                    cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();

                    LoadData();
                    ClearForm();
                }
            }
        
        }
        // -------------------- LOAD GRID --------------------
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
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "UPDATE regtable SET FirstName=@fname, LastName=@lname, Gender=@gender, DateofBirth=@dob, Password=@pwd, Age=@age, Hobbies=@hobbies WHERE Mobilenumber=@mobile";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@fname", txtfname.Text);
                cmd.Parameters.AddWithValue("@lname", txtlname.Text);
                cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
                cmd.Parameters.AddWithValue("@dob", GetDOB());
                cmd.Parameters.AddWithValue("@pwd", txtpwd.Text);
                cmd.Parameters.AddWithValue("@age", txtage.Text);
                cmd.Parameters.AddWithValue("@hobbies", GetHobbies());
                cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);

                conn.Open();
                cmd.ExecuteNonQuery();

                LoadData();
                ClearForm();
            }
        
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "DELETE FROM regtable WHERE Mobilenumber=@mobile";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);

                conn.Open();
                cmd.ExecuteNonQuery();

                LoadData();
                ClearForm();
            }
        

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

        protected void customvhobbies_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = cblhobbies.Items.Cast<System.Web.UI.WebControls.ListItem>().Any(i => i.Selected);
        }
    }

}