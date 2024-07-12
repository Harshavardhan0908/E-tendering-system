using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tender_Block_ledger : System.Web.UI.Page
{
    private string cs = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    private SqlConnection conn;
    protected static bool flag;
    protected static DataTable dt;
    string tid, id;
    protected void Page_Load(object sender, EventArgs e)
    {

       tid= Request.QueryString["tid"].ToString();
       id = Request.QueryString["id"].ToString();
        conn = new SqlConnection(cs);
        dt = new DataTable();
        using (SqlCommand cmd = new SqlCommand("select a.tender_name,a.Refno,a.Tlocation,a.Tvalue,b.T_type,b.T_date from tender_master a inner join log_master b on b.tender_id = a.tid where  b.tender_id = @tid and b.id=@iid", conn))
        {
            cmd.Parameters.AddWithValue("@tid", tid);
            cmd.Parameters.AddWithValue("@iid", id);
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
}