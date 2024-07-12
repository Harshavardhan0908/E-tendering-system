using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Buyer_Add_Property : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static string msg = "";
    protected static string id,id1;
    public string _name = String.Empty;
    public string _area = String.Empty;
    public string _price = String.Empty;
    public string _addr = String.Empty;
    public string reference = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["s_id"] == null)
            {
                Response.Redirect("/Seller_Log.aspx");
            }

           
            conn = new SqlConnection(cs);
            if (Request.QueryString["msg"] == "edit")
            {

                msg = Request.QueryString["msg"].ToString();
                id = Request.QueryString["id"].ToString();
                if (msg == "edit")
                {
                    using (SqlCommand cmd = new SqlCommand("select * from property_master where id=@id", conn))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adp.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                _name = dt.Rows[0]["p_name"].ToString();
                                _area = dt.Rows[0]["area"].ToString();
                                bedrooms.SelectedIndex = Convert.ToInt32(dt.Rows[0]["bedrooms"].ToString());
                                garages.SelectedIndex = Convert.ToInt32(dt.Rows[0]["garage"].ToString());
                                _price = dt.Rows[0]["price"].ToString();
                                bathrooms.SelectedIndex = Convert.ToInt32(dt.Rows[0]["bathroom"].ToString());
                                reference = dt.Rows[0]["address"].ToString();
                                string str = dt.Rows[0]["image"].ToString();
                                showimge.ImageUrl = ("img/" + str);
                            }
                        }
                    }

                    FileUpload1.Enabled = false;

                }
            }

            else if (Request.QueryString["msg"] == "view")
            {

                msg = Request.QueryString["msg"].ToString();
                id = Request.QueryString["id"].ToString();
                if (msg == "view")
                {
                    using (SqlCommand cmd = new SqlCommand("select * from property_master where id=@id", conn))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adp.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                _name = dt.Rows[0]["p_name"].ToString();
                                _area = dt.Rows[0]["area"].ToString();
                                bedrooms.SelectedIndex = Convert.ToInt32(dt.Rows[0]["bedrooms"].ToString());
                                garages.SelectedIndex = Convert.ToInt32(dt.Rows[0]["garage"].ToString());
                                _price = dt.Rows[0]["price"].ToString();
                                bathrooms.SelectedIndex = Convert.ToInt32(dt.Rows[0]["bathroom"].ToString());
                                reference = dt.Rows[0]["address"].ToString();
                                string str = dt.Rows[0]["image"].ToString();
                                showimge.ImageUrl = ("img/" + str);
                                string status = dt.Rows[0]["status"].ToString();
                                if(status=="Requested")
                                {
                                    fileuplogo.Enabled = false;
                                    Button1.Text = "Approve";
                                    FileUpload1.Enabled = false;
                                }
                                else
                                {
                                    fileuplogo.Enabled = false;
                                    Button1.Enabled = false;
                                    FileUpload1.Enabled = false;
                                }
                            }
                        }
                    }

                    
                }
            }


        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(cs);
        int bathroom = Convert.ToInt32(bathrooms.Items[bathrooms.SelectedIndex].Text);
        int bedroom = Convert.ToInt32(bedrooms.Items[bedrooms.SelectedIndex].Text);
        int garage = Convert.ToInt32(garages.Items[garages.SelectedIndex].Text);

        

        

        conn = new SqlConnection(cs);
        string msg1 = Request.QueryString["msg"] != null ? Request.QueryString["msg"].ToString() : "";
        if (msg1 == "edit")
        {
            string str = fileuplogo.FileName;
            fileuplogo.PostedFile.SaveAs(Server.MapPath("img/" + str));
            string image = "img/" + str.ToString();
            id1 = Request.QueryString["id"].ToString();
            
            using (SqlCommand cmd = new SqlCommand("update property_master set p_name=@name , area=@area , bedrooms=@bed , garage=@garage , price=@price , bathroom=@bath , address=@address , image=@image where id=@id ", conn))
                
            {
                cmd.Parameters.AddWithValue("@id", id1);
                cmd.Parameters.AddWithValue("@name", Request.Form["name"]);
                cmd.Parameters.AddWithValue("@area", Request.Form["area"]);
                cmd.Parameters.AddWithValue("@bed", bedroom);
                cmd.Parameters.AddWithValue("@garage", garage);
                cmd.Parameters.AddWithValue("@price", Request.Form["price"]);
                cmd.Parameters.AddWithValue("@bath", bathroom);
                cmd.Parameters.AddWithValue("@address", Request.Form["Address"]);
                cmd.Parameters.AddWithValue("@image", str);
                

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("Manage_Property.aspx");
            }

        }


        if (msg1 == "view")
        {
            Blockchain phillyCoin = new Blockchain();          
            string prev_hash = "";
            
            id1 = Request.QueryString["id"].ToString();
            int id2 = 0;

            using (SqlCommand cmd3 = new SqlCommand("Select top 1 id,hash from log_master where Property_Id=@id order by id desc", conn))
            {
                cmd3.Parameters.AddWithValue("@id", id);
                using (SqlDataAdapter adp3 = new SqlDataAdapter(cmd3))
                {
                    DataTable dt3 = new DataTable();
                    adp3.Fill(dt3);
                    {
                        id2 = 1 + Convert.ToInt32(dt3.Rows[0]["id"].ToString());
                        prev_hash = dt3.Rows[0]["hash"].ToString();
                        B_Count.prev_hash = prev_hash;
                    }
                }

            }

            string new_id = Convert.ToString(id2);
            string hash_new = phillyCoin.AddBlock(new Block(DateTime.Now, prev_hash, new_id)); 


            using(SqlCommand cmd1= new SqlCommand("select * from buyer_request_master where p_id=@id",conn))
            {
                cmd1.Parameters.AddWithValue("@id", id1);
                using(SqlDataAdapter adp = new SqlDataAdapter(cmd1))
                {
                    DataTable dt1 = new DataTable();
                    adp.Fill(dt1);
                    if(dt1.Rows.Count>0)
                    {
                        int b_id = Convert.ToInt32(dt1.Rows[0]["b_id"].ToString());
                        using (SqlCommand cmd = new SqlCommand("insert into seller_request_master(s_id,p_id,b_id,date,hash) values(@sid,@pid,@bid,getdate(),@hash) ", conn))
                        {
                            cmd.Parameters.AddWithValue("@pid", id1);
                            cmd.Parameters.AddWithValue("@sid", Session["s_id"]);
                            cmd.Parameters.AddWithValue("@bid", b_id);
                            cmd.Parameters.AddWithValue("@hash", hash_new);
                            conn.Open();

                            cmd.ExecuteNonQuery();
                            conn.Close();
                           
                        }

                        using (SqlCommand cmd2 = new SqlCommand("update property_master set status=@status where id=@id ", conn))
                        {
                            cmd2.Parameters.AddWithValue("@id", id1);
                            cmd2.Parameters.AddWithValue("@status", "Transfering");
                            conn.Open();
                            cmd2.ExecuteNonQuery();
                            conn.Close();

                        }

                        using (
                  SqlCommand cmd5 =
                      new SqlCommand(
                          "insert into log_master(property_id,hash,date,type) values(@pid,@hash,getdate(),@type)",
                          conn))
                        {

                            cmd5.Parameters.AddWithValue("@pid", id);
                            cmd5.Parameters.AddWithValue("@hash", hash_new);
                            cmd5.Parameters.AddWithValue("@type", "Transfering");
                            conn.Open();
                            cmd5.ExecuteNonQuery();
                            conn.Close();

                        }

                        Button1.Enabled = false;
                        Response.Write("<script>alert('Property Approved Successfully.. Sending Documents For Verification..')</script>");
                    }
                }
            }

           

        }


        else
        {
            int prop_id = 0;
            using(SqlCommand cm= new SqlCommand("select top 1 id from property_master order by id desc",conn))
            {
                using(SqlDataAdapter adp = new SqlDataAdapter(cm))
                {
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    if(dt.Rows.Count>0)
                    {
                        prop_id = 1 + Convert.ToInt32(dt.Rows[0]["id"].ToString());
                    }
                }
            }

            Blockchain phillyCoin = new Blockchain();
            phillyCoin.AddGenesisBlock();
            B_Count.pid = Convert.ToString(prop_id);
            string genesis_hash = phillyCoin.Chain[0].Hash;//use for registration

            string str = fileuplogo.FileName;
            fileuplogo.PostedFile.SaveAs(Server.MapPath("img/" + str));
            string image = "img/" + str.ToString();
            string str1 = FileUpload1.FileName;
            FileUpload1.PostedFile.SaveAs(Server.MapPath("file/" + str1));
            string image1 = "file/" + str1.ToString();
            using (SqlCommand cmd = new SqlCommand("insert into property_master (s_id,p_name,area,bedrooms,garage,price,bathroom,address,image,status,doc,genesis_hash) values(@sid,@name,@area,@bed,@garage,@price,@bath,@address,@image,@sale,@file,@genesis_hash) ", conn))
            {
                cmd.Parameters.AddWithValue("@sid", Session["s_id"].ToString());
                cmd.Parameters.AddWithValue("@name", Request.Form["name"]);
                cmd.Parameters.AddWithValue("@area", Request.Form["area"]);
                cmd.Parameters.AddWithValue("@bed", bedroom);
                cmd.Parameters.AddWithValue("@garage", garage);
                cmd.Parameters.AddWithValue("@price", Request.Form["price"]);
                cmd.Parameters.AddWithValue("@bath", bathroom);
                cmd.Parameters.AddWithValue("@address", Request.Form["Address"]);
                cmd.Parameters.AddWithValue("@image", str);
       
                cmd.Parameters.AddWithValue("@file", str1);
                //cmd.Parameters.AddWithValue("@genesis_hash", genesis_hash);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                

            }


            using (
                    SqlCommand cmd =
                        new SqlCommand(
                            "insert into Log_master (Property_Id,hash,date,type) values(@p_id,@hash,getdate(),@type)", conn))
            {
                cmd.Parameters.AddWithValue("@p_id", prop_id);
                cmd.Parameters.AddWithValue("@hash", genesis_hash);
                cmd.Parameters.AddWithValue("@type", "Registration");
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            Response.Write("<script>alert('Property Added Successfully')</script>");
        }



    }
}