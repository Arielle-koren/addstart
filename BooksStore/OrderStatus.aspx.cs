using BooksStore.DeliveriesServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class OrderStatus : System.Web.UI.Page
    {
        WebService1 ws = new WebService1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"].ToString() != "yes")
                Response.Redirect("Home.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)// מציאת סטטוס הזמנה לפי הקוד שלה
        {
            try
            {
                if (TextBox3.Text != "")
                    Label4.Text = ws.GetStatus(Int32.Parse(TextBox3.Text), 1);
                else
                    Label4.Text = "חובה להזין קוד הזמנה";
            }
            catch (Exception ex)
            {
                Label4.Text = "משהו השתבש, בדוק  אם קוד ההזמנה תקין";
            }
        }
    }
}