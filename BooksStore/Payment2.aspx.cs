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
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(Request.QueryString["price"]))
            {
                Label1.Text = Request.QueryString["price"];
                if (this.Page.PreviousPage != null)
                {
                    string city = PreviousPage.FindControl("TextBox1").ToString();
                    string address = PreviousPage.FindControl("TextBox2").ToString();
                    string phoneNum = PreviousPage.FindControl("TextBox3").ToString();
                    string comment = PreviousPage.FindControl("TextBox4").ToString();
                }
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
                if (PreviousPage != null)
                {
                    string city = PreviousPage.FindControl("TextBox1").ToString();
                    string address = PreviousPage.FindControl("TextBox2").ToString();
                    string phoneNum = PreviousPage.FindControl("TextBox3").ToString();
                    string comment = PreviousPage.FindControl("TextBox4").ToString();
                    int orderID =ol.addOrder(Int32.Parse(Session["ID"].ToString()), city, address, comment, phoneNum);
                    cl.addNewCredit(orderID, TextBox1.Text, TextBox2.Text, TextBox3.Text, Int32.Parse(DropDownList1.SelectedValue), Int32.Parse(DropDownList2.SelectedValue));
                    cal.deleteCart(Int32.Parse(Session["ID"].ToString()));
                    Response.Redirect("Payment3.aspx");
                }
            }
        }
    }
}