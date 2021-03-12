using BooksStore.App_Code;
using BooksStore.DeliveriesServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class orderReciept : System.Web.UI.Page
    {
        OrdersLogic ol = new OrdersLogic();
        int orderID;
        WebService1 ws = new WebService1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["data"]))
            {
                
                    orderID = Int32.Parse(Request.QueryString["data"]);
                    Label6.Text = orderID.ToString();
                    Repeater1.DataSource = ol.getOrder(orderID);
                    Repeater1.DataBind();
                    Label5.Text = (Double.Parse(ol.getTotal(orderID).Tables[0].Rows[0]["Total"].ToString())+10).ToString();//מחיר ספרים כולל+ 10 שח למשלוח
                    Label8.Text = ws.GetStatus(orderID); 
                
            }
            else
            Label1.Text = "משהו השתבש, מצטערים";
        }
    }
}