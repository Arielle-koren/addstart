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
    public partial class Cart : System.Web.UI.Page
    {
        CartLogic cl = new CartLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null)
                Response.Redirect("Login.aspx");
            if(!IsPostBack)
            {
                Repeater1.DataSource = cl.getCart(Int32.Parse(Session["ID"].ToString()));
                Repeater1.DataBind();
                string total= cl.getTotal(Int32.Parse(Session["ID"].ToString())).Tables[0].Rows[0]["TOTAL"].ToString();
                if (total == "")//במידה והעגלה ריקה המחיר הוא 0. במקרה כזה יחזור סטרינג ריק מהשאילתה . כאשר זה סטרינג ריק ההפיכה לדאבל לא יכולה להתבצע ולכן שמתי 0 במשתנה
                    total = "0";
                Label6.Text = total;
                Label8.Text = (Double.Parse(total)+ Double.Parse(Label7.Text.ToString())).ToString();
                
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string Booksid = (String)((sender as LinkButton).CommandName);
            cl.add1(Int32.Parse(Booksid), Int32.Parse(Session["ID"].ToString()));
            Repeater1.DataSource = cl.getCart(Int32.Parse(Session["ID"].ToString()));
            Repeater1.DataBind();
            string total = cl.getTotal(Int32.Parse(Session["ID"].ToString())).Tables[0].Rows[0]["TOTAL"].ToString();
            if (total == "")//במידה והעגלה ריקה המחיר הוא 0. במקרה כזה יחזור סטרינג ריק מהשאילתה . כאשר זה סטרינג ריק ההפיכה לדאבל לא יכולה להתבצע ולכן שמתי 0 במשתנה
                total = "0";
            Label6.Text = total;
            Label8.Text = (Double.Parse(total) + Double.Parse(Label7.Text)).ToString();
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            string Booksid = (String)((sender as LinkButton).CommandName);
            cl.remove1(Int32.Parse(Booksid), Int32.Parse(Session["ID"].ToString()));
            Repeater1.DataSource = cl.getCart(Int32.Parse(Session["ID"].ToString()));
            Repeater1.DataBind();
            string total = cl.getTotal(Int32.Parse(Session["ID"].ToString())).Tables[0].Rows[0]["TOTAL"].ToString();
            if (total == "")//במידה והעגלה ריקה המחיר הוא 0. במקרה כזה יחזור סטרינג ריק מהשאילתה . כאשר זה סטרינג ריק ההפיכה לדאבל לא יכולה להתבצע ולכן שמתי 0 במשתנה
                total = "0";
            Label6.Text = total;
            Label8.Text = (Double.Parse(total) + Double.Parse(Label7.Text)).ToString();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string Booksid = (String)((sender as LinkButton).CommandName);
            cl.deleteFromCart(Int32.Parse(Booksid), Int32.Parse(Session["ID"].ToString()));
            Repeater1.DataSource = cl.getCart(Int32.Parse(Session["ID"].ToString()));
            Repeater1.DataBind();
            string total = cl.getTotal(Int32.Parse(Session["ID"].ToString())).Tables[0].Rows[0]["TOTAL"].ToString();
            if (total == "")//במידה והעגלה ריקה המחיר הוא 0. במקרה כזה יחזור סטרינג ריק מהשאילתה . כאשר זה סטרינג ריק ההפיכה לדאבל לא יכולה להתבצע ולכן שמתי 0 במשתנה
                total = "0";
            Label6.Text = total;
            Label8.Text = (Double.Parse(total) + Double.Parse(Label7.Text)).ToString();
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            if (Label6.Text != "0")//ניתן לבצע הזמנה רק כאשר העגלה לא ריקה
            {
                // |בדיקה אם כל המוצרים במלאי
                DataSet ds = cl.getCart(Int32.Parse(Session["ID"].ToString()));
                Label10.Text = "";
                bool instock = true;
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if (!cl.inStock(Int32.Parse(ds.Tables[0].Rows[i]["BooksID"].ToString()), Int32.Parse(ds.Tables[0].Rows[i]["NumBooks"].ToString())))// אם לא במלאי
                    {
                        int n = i + 1;
                        Label10.Text = Label10.Text + " מוצר מספר " + n + " חסר במלאי. ";
                        instock = false;
                    }

                }
                if (instock)
                    Response.Redirect("Payment1.aspx?data=" + Label8.Text);
            }
        }
    }
}