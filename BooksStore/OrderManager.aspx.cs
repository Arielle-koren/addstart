using BooksStore.App_Code;
using BooksStore.DeliveriesServices;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class OrderManager : System.Web.UI.Page
    {
        OrdersLogic ol = new OrdersLogic();
        WebService1 ws = new WebService1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"].ToString() != "yes")
                Response.Redirect("Home.aspx");
            if (!IsPostBack)
            {
                GridView1.DataSource = ol.showAllOrders1();
                GridView1.DataBind();
                
                

            }
         


        }

        protected void Button1_Click(object sender, EventArgs e)// מציאת הזמנות בין טווח תאריכים
        {
            if (!(TextBox1.Text.Equals("") || TextBox2.Text.Equals("")))
            {
                DataSet ds = ol.getByMonthAndYear(TextBox1.Text, TextBox2.Text);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Label1.Text = "";

                }
                else
                    Label1.Text = "אין הזמנות מתאריכים אלו";

            }
            else
            {
                Label1.Text = "";
                GridView1.DataSource = ol.showAllOrders1();
                GridView1.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)// מציאת סטטוס הזמנה לפי הקוד שלה
        {
            try
            {
                if (TextBox3.Text != "")
                    Label4.Text = ws.GetStatus(Int32.Parse(TextBox3.Text));
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