using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tender_AddTender : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static string msg = "";
    protected static string id, id1;
   // public string _name = String.Empty;
   // public string _area = String.Empty;
   // public string length = String.Empty;
   // public string height = String.Empty;
   // public string _price = String.Empty;
   // public string _addr = String.Empty;
   // public string _Closing = String.Empty;
   // public string Discription = String.Empty;
   //public string reference = "";

    SqlDataAdapter da;
    DataTable dt;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            fillDriverDropdown();
            //if (Session["s_id"] == null)
            //{
            //    Response.Redirect("/Seller_Log.aspx");
            //}        
            conn = new SqlConnection(cs);
            if (Request.QueryString["msg"] == "edit")
            {
                msg = Request.QueryString["msg"].ToString();
                id = Request.QueryString["id"].ToString();




                if (msg == "edit")
                {
                    using (SqlCommand cmd = new SqlCommand("select * from [Tender_master] where Tid=@id", conn))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adp.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                name.Text = dt.Rows[0]["tender_name"].ToString();
                                Location.Text = dt.Rows[0]["Tlocation"].ToString();
                                TOtt.SelectedIndex = Convert.ToInt32(dt.Rows[0]["Totid"].ToString());
                                //tor.SelectedIndex = Convert.ToInt32(dt.Rows[0]["RID"].ToString());
                                //Length.Text = dt.Rows[0]["Lenghtt"].ToString();
                                //lane.SelectedIndex = Convert.ToInt32(dt.Rows[0]["lane"].ToString());
                                Ref.Text = dt.Rows[0]["Refno"].ToString();
                               // Height.Text = dt.Rows[0]["Weidth"].ToString();
                                Price.Text = dt.Rows[0]["Tvalue"].ToString();
                                disc.Text = dt.Rows[0]["Discription"].ToString();


                                string str = dt.Rows[0]["Timage"].ToString();
                                showimge.ImageUrl = ("img/" + str);
                            }
                        }
                    }

                    FileUpload1.Enabled = false;

                }
            }





        }
        }
    protected void imgCal_Click1(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
    }

    protected void cal_SelectionChanged1(object sender, EventArgs e)
    {
        txtDate.Text = Calendar1.SelectedDate.ToShortDateString(); 
        Calendar1.Visible = false;
    }

   
            

        
    

    private void fillDriverDropdown()
    {
        try
        {
            conn = new SqlConnection(cs);
            cmd = new SqlCommand("select * from TYPE_of_Tender", conn);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                TOtt.DataValueField = "TotID";
                TOtt.DataTextField = "tender_type";
                TOtt.DataSource = dt;
                TOtt.DataBind();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

        try
        {
            conn = new SqlConnection(cs);
            cmd = new SqlCommand("select * from TYPE_of_Road", conn);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
               // tor.DataValueField = "RID";
                //tor.DataTextField = "Road_type";
                //tor.DataSource = dt;
                //tor.DataBind();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DateTime dt1 = Convert.ToDateTime(txtDate.Text);

        if (dt1 <= DateTime.Now)
        {


            Response.Write("<script>alert('please select a valid date')</script>");

        }
        else
        {

          




            conn = new SqlConnection(cs);

            if (msg == "edit")
            {
                string str = fileuplogo.FileName;
                fileuplogo.PostedFile.SaveAs(Server.MapPath("img/" + str));
                string image = "img/" + str.ToString();
                id1 = Request.QueryString["id"].ToString();

                using (SqlCommand cmd = new SqlCommand("update Tender_master set tender_name=@name, Tlocation=@location , Totid=@tot , Tvalue=@Value , Discription=@discription ,Refno=@ref, TImage=@image where Tid=@id ", conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                   // cmd.Parameters.AddWithValue("@ride", tor.SelectedValue);
                    cmd.Parameters.AddWithValue("@tot", TOtt.SelectedValue);
                    cmd.Parameters.AddWithValue("@ref", Ref.Text);
                    //cmd.Parameters.AddWithValue("@length", Length.Text);
                    //cmd.Parameters.AddWithValue("@weidth", Height.Text);
                    //cmd.Parameters.AddWithValue("@lane", lane.SelectedIndex);
                    cmd.Parameters.AddWithValue("@Value", Price.Text);
                    cmd.Parameters.AddWithValue("@location", Location.Text);
                    cmd.Parameters.AddWithValue("@name", name.Text);
                    cmd.Parameters.AddWithValue("@discription", disc.Text);
                    cmd.Parameters.AddWithValue("@image", str);
                    cmd.Parameters.AddWithValue("@time", txtDate.Text);


                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Manage_tender.aspx");
                }

            }


            int prop_id = 0;
            using (SqlCommand cm = new SqlCommand("select top 1 Tid from [Tender_master] order by Tid desc", conn))
            {
                using (SqlDataAdapter adp = new SqlDataAdapter(cm))
                {
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        prop_id = 1 + Convert.ToInt32(dt.Rows[0]["Tid"].ToString());
                    }
                }
            }

            Blockchain phillyCoin = new Blockchain();
            phillyCoin.AddGenesisBlock();
            B_Count.pid = Convert.ToString(prop_id);
            string genesis_hash = phillyCoin.Chain[0].Hash;//use for registration


            conn = new SqlConnection(cs);


            //Blockchain phillyCoin = new Blockchain();
            //phillyCoin.AddGenesisBlock();
            //B_Count.pid = Convert.ToString(prop_id);
            //string genesis_hash = phillyCoin.Chain[0].Hash;//use for registration
            try
            {
                DateTime dt2 = Convert.ToDateTime(txtDate.Text);
                string str = fileuplogo.FileName;
                fileuplogo.PostedFile.SaveAs(Server.MapPath("img/" + str));
                string image = "img/" + str.ToString();
                string str1 = FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath("file/" + str1));
                string image1 = "file/" + str1.ToString();
                using (SqlCommand cmd = new SqlCommand(" insert into Tender_master (TotID,Refno,Tvalue,Tlocation,Document,tender_name,TclosingDate,Timage,Discription,status)values(@tot,@ref,@value,@location,@document,@name,@date,@image,@discription,0) ", conn))
                {
                   // cmd.Parameters.AddWithValue("@ride", tor.SelectedValue);
                    cmd.Parameters.AddWithValue("@tot", TOtt.SelectedValue);
                    cmd.Parameters.AddWithValue("@ref", Ref.Text);
                    //cmd.Parameters.AddWithValue("@length", Length.Text);
                    //cmd.Parameters.AddWithValue("@weidth", Height.Text);
                    //cmd.Parameters.AddWithValue("@lane", lane.SelectedIndex);
                    cmd.Parameters.AddWithValue("@Value", Price.Text);
                    cmd.Parameters.AddWithValue("@location", Location.Text);
                    cmd.Parameters.AddWithValue("@name", name.Text);
                    cmd.Parameters.AddWithValue("@date", dt1);
                    cmd.Parameters.AddWithValue("@document", str1);
                    cmd.Parameters.AddWithValue("@discription", disc.Text);
                    cmd.Parameters.AddWithValue("@image", str);
                    conn.Open();

                    int i = cmd.ExecuteNonQuery();
                    conn.Close();
                    if (i > 0)
                    {


                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect", "alert('Data Inserted'); window.location='" + Request.ApplicationPath + "/Manage_Tender.aspx';", true);

                    }
                    else
                    {

                        //Response.Write("<script>alter('Please enter correct input')</script>");
                        Response.Write("<script>alert('Error')</script>");
                    }




                }
            }
            catch (Exception E)
            {
                throw E;
            }

            int t_id = 1;
            //---------------------------------new
            using (SqlCommand cmd3 = new SqlCommand("  Select top 1 *  from [Tender_master] order by [TID] desc", conn))
            {
               // cmd3.Parameters.AddWithValue("@id", id);
                using (SqlDataAdapter adp3 = new SqlDataAdapter(cmd3))
                {
                    DataTable dt3 = new DataTable();
                    adp3.Fill(dt3);
                    if (dt3.Rows.Count > 0)
                    {
                        t_id = Convert.ToInt32(dt3.Rows[0]["TID"].ToString());
                    }
                }

            }



            //------------------




             using (
                    SqlCommand cmd =
                        new SqlCommand(
                            "insert into Log_master (Tender_Id,T_hash,T_type,T_date) values(@p_id,@hash,@type,getdate())", conn))
            {
                cmd.Parameters.AddWithValue("@p_id", t_id);
                cmd.Parameters.AddWithValue("@hash", genesis_hash);
                cmd.Parameters.AddWithValue("@type", "Registration");
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            Response.Write("<script>alert('Tender Added Successfully')</script>");
        }

        name.Text = "";
        Location.Text = "";
    
       // Length.Text = "";
    
        Ref.Text = "";
        //Height.Text = "";
        Price.Text = "";
        disc.Text = "";



        }
    }
