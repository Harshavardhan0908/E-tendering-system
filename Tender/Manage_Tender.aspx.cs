using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tender_Manage_Tender : System.Web.UI.Page
{

    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static bool flag;
    protected static DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {

        //if (Session["s_id"] == null)
        //{
        //    Response.Redirect("/Seller_Log.aspx");
        //}
        conn = new SqlConnection(cs);
        dt = new DataTable();
        using (SqlCommand cmd = new SqlCommand(" select a.Tid,a.tender_name,c.tender_type,a.Refno,a.TLocation,a.Tclosingdate from TEnder_master a inner join Type_of_tender c on a.totid = c.TotID", conn))
        {
            
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                sda.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {
                flag = true;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    //protected void btnsubmit_Click(object sender, EventArgs e)
    //{
    //    conn = new SqlConnection(cs);
    //    using (SqlCommand cmd = new SqlCommand("select * from Tender_master where tender_name=@name", conn))
    //    {
            
    //        cmd.Parameters.AddWithValue("@name", txtid.Text);
    //        using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
    //        {
    //            dt = new DataTable();
    //            adp.Fill(dt);
    //            if (dt.Rows.Count > 0)
    //            {

    //                flag = true;

    //            }

    //        }
    //    }
    //}
}