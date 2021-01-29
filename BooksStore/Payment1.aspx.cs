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
                pd.addPaymentsDetail(TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text);
                Session["PD"] = pd;
                Response.Redirect("Payment2.aspx?price="+Label1.Text);
                //+"&city="+ TextBox1.Text +"&address"+ TextBox2.Text + "&phonenum"+ TextBox3.Text+"&comments"+ TextBox4.Text
            }
        }
    }
}