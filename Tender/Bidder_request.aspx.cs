using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tender_Bidder_request : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static bool flag;
    protected static DataTable dt;
    string tit;
    string emaill;
    protected void Page_Load(object sender, EventArgs e)
    {
       


         tit = Request.QueryString["id"].ToString();
         if (!IsPostBack)
         {
             fillGridView(tit);
         }



        //conn = new SqlConnection(cs);
        //dt = new DataTable();
        //using (SqlCommand cmd = new SqlCommand("  select a.Rid,b.Bname,c.Tender_name,a.amount,a.Rdate,r.RequestName from Bidder_request a inner join Bidder_master b on b.bid = a.bid inner join Tender_master c on c.tid = a.tid inner join Request_status r on a.Statuss =r.RequestID  where c.tid =  @tid", conn))
        //{
        //    cmd.Parameters.AddWithValue("@tid",tit );
        //    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //    {
        //        sda.Fill(dt);
        //    }
        //    if (dt.Rows.Count > 0)
        //    {
        //        flag = true;
        //    }
        //}
    }

    private void fillGridView(string tit)
    {
        try
        {
            SqlCommand cmd;
            SqlDataAdapter sda;
            conn = new SqlConnection(cs);
            cmd = new SqlCommand(" select c.tid,a.Rid,b.Bname,c.Tender_name,a.amount,a.Rdate,r.RequestName from Bidder_request a inner join Bidder_master b on b.bid = a.bid inner join Tender_master c on c.tid = a.tid inner join Request_status r on a.Statuss =r.RequestID  where c.tid =  @tid", conn);
            cmd.Parameters.AddWithValue("@tid", tit);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
          
            if (dt.Rows.Count > 0)
            {
                gvRequest.DataSource = dt;
                gvRequest.DataBind();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void gvRequest_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string CommandName = e.CommandName.ToString();
        string RequestID = e.CommandArgument.ToString();



        conn = new SqlConnection(cs);
         using (SqlCommand cmd3 = new SqlCommand("  select a.rid,b.bemail from  Bidder_request a inner join Bidder_master b on a.bid = b.bid where a.rid = @rid", conn))
            {
                cmd3.Parameters.AddWithValue("@rid", RequestID);
                using (SqlDataAdapter adp3 = new SqlDataAdapter(cmd3))
                {
                    DataTable dt3 = new DataTable();
                    adp3.Fill(dt3);
                    {

                        emaill = dt3.Rows[0]["bemail"].ToString();
                        //SendMaill(emaill); 

                    }

                 

                }
            }   
         if (CommandName == "Accept")
             UpdateStatus(tit, 2);
                
    }

    private void updatetenderstatus(string tit)
    {

        conn = new SqlConnection(cs);
        if (conn.State != ConnectionState.Open)
            conn.Open();
        SqlCommand cmd1;


        cmd1 = new SqlCommand(" update tender_master set status = 1 where tid = @tid ", conn);
        cmd1.Parameters.AddWithValue("@tid", tit);




        int result = cmd1.ExecuteNonQuery();
        if (result == 1)
        {

        }
    }
         
    private void SendMaill(string emaill)
    {

        try
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("project.mail1231@gmail.com"); 
            SmtpClient smtp = new SmtpClient();
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("project.mail1231@gmail.com", "project12345"); 
            smtp.Host = "smtp.gmail.com";


            mail.To.Add(new MailAddress(emaill));    
            mail.Subject = "New Notification";
            mail.Body = "your bid had been selected ";   
            smtp.Send(mail);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void UpdateStatus(string RequestID, int p)
    {
        updatetenderstatus(tit);
        tit = Request.QueryString["id"].ToString();
        try
        {

            conn = new SqlConnection(cs);
            Blockchain phillyCoin = new Blockchain();
            int id1 = 0;
            string prev_hash = "";
            using (SqlCommand cmd3 = new SqlCommand("Select top 1 id,T_Hash from log_master where Tender_id=@id order by id desc", conn))
            {
                cmd3.Parameters.AddWithValue("@id", tit);
                using (SqlDataAdapter adp3 = new SqlDataAdapter(cmd3))
                {
                    DataTable dt3 = new DataTable();
                    adp3.Fill(dt3);
                    {
                        id1 = 1 + Convert.ToInt32(dt3.Rows[0]["id"].ToString());
                        prev_hash = dt3.Rows[0]["T_hash"].ToString();
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

                cmd5.Parameters.AddWithValue("@pid", tit);
                cmd5.Parameters.AddWithValue("@hash", hash_new);
                cmd5.Parameters.AddWithValue("@type", "completed");
                conn.Open();
                cmd5.ExecuteNonQuery();
                conn.Close();

            }




       

            conn = new SqlConnection(cs);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            SqlCommand cmd1;


            cmd1 = new SqlCommand(" update Bidder_request set Statuss = @iRequestStatusID where Rid = @iRequestID ", conn);
            cmd1.Parameters.AddWithValue("@iRequestID", RequestID);
            cmd1.Parameters.AddWithValue("@iRequestStatusID",p);

        

            int result = cmd1.ExecuteNonQuery();
            if (result == 1)
            {
                fillGridView(RequestID);

                conn.Open();
                cmd1 = new SqlCommand(" update Bidder_request set Statuss = 3 where rid not in (select rid from Bidder_request where rid =@iRequestID ) and tid = @tit ", conn);
                cmd1.Parameters.AddWithValue("@iRequestID", RequestID);
                cmd1.Parameters.AddWithValue("@tit", tit);

                int result2 = cmd1.ExecuteNonQuery();
                conn.Close();
                if (result2 == 1)
                {
                    fillGridView(RequestID);


                    Response.Redirect("Manage_TEnder.aspx");
                }

                Response.Redirect("Manage_TEnder.aspx");
            }

            Response.Redirect("Manage_TEnder.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}