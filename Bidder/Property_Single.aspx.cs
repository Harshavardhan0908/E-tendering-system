using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Buyer_Property_Single : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static bool flag;
    protected static DataTable dt,dt1;
    protected static string id, id1;
    public string _name = String.Empty;
    public string _price = String.Empty;
    public string Lenghtt = String.Empty;
    public string Weidth = String.Empty;
    public string _addr = String.Empty;
    public string Refno = String.Empty;
    public string _image = String.Empty;
    public string _area = String.Empty;
    public string _id = String.Empty;
    public string _status = String.Empty;
    public string _lane = String.Empty;
     public string Rtype = String.Empty;
     public string TType = String.Empty;
     public string Discription = String.Empty;


     protected void Page_Load(object sender, EventArgs e)
     {
         if (Session["bid"] == null)
         {
             Response.Redirect("/Buyer_log.aspx");
         }
         conn = new SqlConnection(cs);
         dt = new DataTable();
         dt1 = new DataTable();


         try
         {
             string aab = Request.QueryString["id"].ToString();


             using (SqlCommand cmd5 = new SqlCommand(" select document from Tender_master where Tid = @tid", conn))
             {
                 cmd5.Parameters.AddWithValue("@tid", aab);
                 using (SqlDataAdapter sda5 = new SqlDataAdapter(cmd5))
                 {
                     DataTable dt5 = new DataTable();
                     sda5.Fill(dt5);

                     HyperLink1.NavigateUrl = "Download.aspx?tid=" + aab;
                 }

             }





             using (SqlCommand cmd = new SqlCommand("select * from Bidder_request where bid = @id  and Tid = @tid ", conn))
             {
                 cmd.Parameters.AddWithValue("@id", Session["bid"].ToString());
                 cmd.Parameters.AddWithValue("@tid", aab);
                 using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                 {
                     sda.Fill(dt1);
                     if (dt1 == null)
                     {
                         Button1.Visible = true;
                     }

                     if (dt1.Rows.Count > 0)
                     {
                         Button1.Visible = false;
                     }
                     else
                     {
                         Button1.Visible = true;
                     }

                 }
             }


         }
         catch (Exception E)
         {
             Button1.Visible = true;
             //Response.Write(E.ToString());
         }




         id = Request.QueryString["id"].ToString();
         using (SqlCommand cmd = new SqlCommand("select a.Tid,c.Tender_type,a.refno,a.Tvalue,a.Tlocation,a.Document,a.Tender_name,a.Tclosingdate, a.Timage,a.Discription from Tender_master a inner join Type_of_Tender c on a.TotID = c.Totid  where a.Tid=@id", conn))
         {
             cmd.Parameters.AddWithValue("@id", id);
             using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
             {
                 sda.Fill(dt);
                 _name = dt.Rows[0]["tender_name"].ToString();
                 _price = dt.Rows[0]["Tvalue"].ToString();
                 _area = dt.Rows[0]["Tlocation"].ToString();
                 _image = "/Tender/img/" + dt.Rows[0]["Timage"].ToString();
                 _addr = dt.Rows[0]["Tlocation"].ToString();
                 Refno = dt.Rows[0]["Refno"].ToString();

                // Lenghtt = dt.Rows[0]["Lenghtt"].ToString();
                // Weidth = dt.Rows[0]["Weidth"].ToString();
                 //_garage = dt.Rows[0]["garage"].ToString();
                 //_status = dt.Rows[0]["status"].ToString();
                 //Rtype = dt.Rows[0]["Road_type"].ToString();
                 //_lane = dt.Rows[0]["lane"].ToString();
                 TType = dt.Rows[0]["Tender_type"].ToString();
                 Discription = dt.Rows[0]["Discription"].ToString();

                 _id = id;
             }

         }
        
     }
    protected void Button1_Click(object sender, EventArgs e)
    {

        Blockchain phillyCoin = new Blockchain();
        int id1 = 0;
        string prev_hash = "";
        using (SqlCommand cmd3 = new SqlCommand("Select top 1 id,T_Hash from log_master where Tender_id=@id order by id desc", conn))
        {
            cmd3.Parameters.AddWithValue("@id", id);
            using (SqlDataAdapter adp3 = new SqlDataAdapter(cmd3))
            {
                DataTable dt3 = new DataTable();
                adp3.Fill(dt3);
                {
                    if (dt3.Rows.Count < 1)
                    {
                        id1 = 0;
                        prev_hash = "abc";
                    }
                    else
                    {
                        id1 = 1 + Convert.ToInt32(dt3.Rows[0]["id"].ToString());
                            prev_hash = dt3.Rows[0]["T_hash"].ToString();
                    }
                    
                    B_Count.prev_hash = prev_hash;
                }
            }

        }
        string new_id = Convert.ToString(id1);
        string hash_new = phillyCoin.AddBlock(new Block(DateTime.Now, prev_hash, new_id)); 


          using (
                   SqlCommand cmd5 =
                       new SqlCommand(
                           "insert into log_master(Tender_id,T_hash,T_type,T_date) values(@pid,@hash,@type,getdate())",
                           conn))
        {

            cmd5.Parameters.AddWithValue("@pid", id);
            cmd5.Parameters.AddWithValue("@hash", hash_new);
            cmd5.Parameters.AddWithValue("@type", "Requested");
            conn.Open();
            cmd5.ExecuteNonQuery();
            conn.Close();

        }
      
    



        using (SqlCommand cmd = new SqlCommand("insert into Bidder_request (Bid,TID,Amount,Rdate,Statuss) values(@bid,@Tid,@amount,getdate(),1)", conn))
        {
           
            cmd.Parameters.AddWithValue("@bid", Session["bid"].ToString());
            cmd.Parameters.AddWithValue("@Tid", id);
            cmd.Parameters.AddWithValue("@amount", Amount.Text);
         
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('Property Requested Successfully')</script>");
        }
        Response.Redirect("home.aspx");

      

        //using (
        //           SqlCommand cmd5 =
        //               new SqlCommand(
        //                   "insert into log_master(property_id,hash,date,type) values(@pid,@hash,getdate(),@type)",
        //                   conn))
        //{

        //    cmd5.Parameters.AddWithValue("@pid", id);
        //    cmd5.Parameters.AddWithValue("@hash", hash_new);
        //    cmd5.Parameters.AddWithValue("@type", "Requested");
        //    conn.Open();
        //    cmd5.ExecuteNonQuery();
        //    conn.Close();

        //}
        Response.Write("<script>alert(' Requested Successfully')</script>");

    }
}