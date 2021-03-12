using BooksStore.App_Code;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"].ToString() != "yes")
                Response.Redirect("Home.aspx");
            if (!IsPostBack)
            {
                GridView1.DataSource = ol.showAllOrders1();
                GridView1.DataBind();

            }
          /*  Year.Items.Insert(0, "בחר שנה");
            Year.Items.Insert(1, "2016");
            Year.Items.Insert(2, "2017");
            Year.Items.Insert(3, "2018");
            Year.Items.Insert(4, "2019");
            Year.Items.Insert(5, "2020");
            Year.Items.Insert(6, "2021");
            Month.Items.Insert(0, "בחר חודש");
            Month.Items.Insert(1, "1");
            Month.Items.Insert(2, "2");
            Month.Items.Insert(3, "3");
            Month.Items.Insert(4, "4");
            Month.Items.Insert(5, "5");
            Month.Items.Insert(6, "6");
            Month.Items.Insert(7, "7");
            Month.Items.Insert(8, "8");
            Month.Items.Insert(9, "9");
            Month.Items.Insert(10, "10");
            Month.Items.Insert(11, "11");
            Month.Items.Insert(12, "12");*/


        }

        protected void Button1_Click(object sender, EventArgs e)
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
    }
}