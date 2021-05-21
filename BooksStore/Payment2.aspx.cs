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
using BooksStore.DeliveriesServices;


namespace BooksStore
{
    public partial class Payment : System.Web.UI.Page
    {
        CreditLogic cl = new CreditLogic();
        OrdersLogic ol = new OrdersLogic();
        CartLogic cal = new CartLogic();
        paymentsDetail pd;
        WebService1 ws = new WebService1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["price"]))
            {
                pd = (paymentsDetail)Session["pd"];
                Label1.Text = Request.QueryString["price"];

            }
            else
                Label2.Text = "מצטערים, משהו התפקשש :-(  ....  חזור בבקשה לעגלת הקניות";
        }

        protected void Button1_Click(object sender, EventArgs e)// חזרה לשלב ראשון בהזמנה
        {
            Response.Redirect("Payment1.aspx?data=" + Request.QueryString["price"]);
        }

        protected void Button2_Click(object sender, EventArgs e)// ביצוע הזמנה
        {

            if (!string.IsNullOrEmpty(Request.QueryString["price"]))
            {
                int year1 = Int32.Parse(DropDownList2.SelectedValue);
                int month1=Int32.Parse(DropDownList1.SelectedValue);
                if (year1 < DateTime.Today.Year || (year1 == DateTime.Today.Year && month1 <= DateTime.Today.Month))// בדיקה אם הכרטיס בתוקף
                    Label2.Text = "הכרטיס לא בתוקף";
                else
                {
                    int city = pd.getCity();
                    string address = pd.getAddress();
                    string phoneNum = pd.getPhone();
                    string comment = pd.getMore();
                    //הוספת הזמנה
                    int orderID = ol.addOrder(Int32.Parse(Session["ID"].ToString()), city, address, comment, phoneNum);
                    //הכנסת פרטי כרטיס אשראי לדאטא ביס
                    String t1 = TextBox1.Text.Replace("'", "''");
                    cl.addNewCredit(orderID, t1, TextBox2.Text, TextBox3.Text, month1, year1);
                    //מחיקת ספרים מהעגלה
                    cal.deleteCart(Int32.Parse(Session["ID"].ToString()));
                    //העברה לשירות משלוחים
                    string cityName = ol.getCityName(city);// מעביר לשירות המשלוחים שם עיר ולא אידי מכיוון שאי אפשר להסתמך על זה שהטבלאות שלהם מסונכרנות
                    cityName = cityName.Replace("'", "''");
                    int numBooks = Int32.Parse(ol.getNumBooks(orderID).Tables[0].Rows[0][0].ToString());
                    double deliveryPrice = double.Parse(ws.AddOrder(cityName, address, phoneNum, 1, numBooks, orderID).ToString());
                    //שמירת מחיר המשלוח לפי חברת המשלוחים
                    ol.setDelieveryPrice(orderID, deliveryPrice);
                    Response.Redirect("Payment3.aspx?data=" + orderID);
                }
            }
        }
    }
}