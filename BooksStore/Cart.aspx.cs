using BooksStore.App_Code;
using System;
using System.Collections.Generic;
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
            if(!IsPostBack)
            {
                Repeater1.DataSource = cl.getCart(Int32.Parse(Session["ID"].ToString()));
                Repeater1.DataBind();
                Label6.Text = cl.getTotal(32).Tables[0].Rows[0]["TOTAL"].ToString();
                Label8.Text = (Int32.Parse(Label6.Text)+ Int32.Parse(Label7.Text)).ToString();
                Label9.Text = Session["name"].ToString();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string Booksid = (String)((sender as LinkButton).CommandName);
            cl.add1(Int32.Parse(Booksid), 32);
            Repeater1.DataSource = cl.getCart(32);
            Repeater1.DataBind();
            Label6.Text = cl.getTotal(32).Tables[0].Rows[0]["TOTAL"].ToString();
            Label8.Text = (Int32.Parse(Label6.Text) + Int32.Parse(Label7.Text)).ToString();
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            string Booksid = (String)((sender as LinkButton).CommandName);
            cl.remove1(Int32.Parse(Booksid), 32);
            Repeater1.DataSource = cl.getCart(32);
            Repeater1.DataBind();
            Label6.Text = cl.getTotal(32).Tables[0].Rows[0]["TOTAL"].ToString();
            Label8.Text = (Int32.Parse(Label6.Text) + Int32.Parse(Label7.Text)).ToString();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string Booksid = (String)((sender as LinkButton).CommandName);
            cl.deleteFromCart(Int32.Parse(Booksid), 32);
            Repeater1.DataSource = cl.getCart(32);
            Repeater1.DataBind();
            Label6.Text = cl.getTotal(32).Tables[0].Rows[0]["TOTAL"].ToString();
            Label8.Text = (Int32.Parse(Label6.Text) + Int32.Parse(Label7.Text)).ToString();
        }
    }
}