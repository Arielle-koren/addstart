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
    public partial class Payment : System.Web.UI.Page
    {
        CreditLogic cl = new CreditLogic();
        OrdersLogic ol = new OrdersLogic();
        CartLogic cal = new CartLogic();
        paymentsDetail pd;
        protected void Page_Load(object sender, EventArgs e)
        {
            pd = (paymentsDetail)Session["pd"];
            if (!string.IsNullOrEmpty(Request.QueryString["price"]))
            {
                pd = (paymentsDetail)Session["pd"];
                Label1.Text = Request.QueryString["price"];

            }
            else
                Label2.Text = "מצטערים, משהו התפקשש :-(  ....  חזור בבקשה לעגלת הקניות";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment1.aspx?data=" + Request.QueryString["price"]);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(Request.QueryString["price"]))
            {
                int city = pd.getCity();
                string address = pd.getAddress();
                string phoneNum = pd.getPhone();
                string comment = pd.getMore();
                int orderID =ol.addOrder(Int32.Parse(Session["ID"].ToString()), city, address, comment, phoneNum);
                String t1 = TextBox1.Text.Replace("'", "''");
                cl.addNewCredit(orderID, t1, TextBox2.Text, TextBox3.Text, Int32.Parse(DropDownList1.SelectedValue), Int32.Parse(DropDownList2.SelectedValue));
                cal.deleteCart(Int32.Parse(Session["ID"].ToString()));
                Response.Redirect("Payment3.aspx?data="+orderID);
      
            }
        }
    }
}