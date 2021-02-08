using BooksStore.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace BooksStore
{
    public partial class payment1 : System.Web.UI.Page
    {
        paymentsDetail pd = new paymentsDetail();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["data"]))
            {
                Label1.Text = Request.QueryString["data"];
            }
            else
                Label2.Text = "מצטערים, משהו התפקשש :-(  ....  חזור בבקשה לעגלת הקניות";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["data"]))
            {
                String t1 = TextBox1.Text.Replace("'", "''");
                String t2 = TextBox1.Text.Replace("'", "''");
                String t4 = TextBox1.Text.Replace("'", "''");
                pd.addPaymentsDetail(t1, t2, TextBox3.Text, t4);
                Session["PD"] = pd;
                Response.Redirect("Payment2.aspx?price="+Label1.Text);
            }
        }
    }
}