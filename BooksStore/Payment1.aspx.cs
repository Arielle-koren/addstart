using BooksStore.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class payment1 : System.Web.UI.Page
    {
        paymentsDetail pd = new paymentsDetail;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            pd.addPaymentsDetail(TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text);
            Session["PD"] = pd;
            Response.Redirect("Payment2.aspx");
        }
    }
}