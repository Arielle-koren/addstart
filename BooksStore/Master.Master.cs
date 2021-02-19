using BooksStore.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class Master : System.Web.UI.MasterPage
    {
        CartLogic cl = new CartLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["name"] == null)
            {
                Label1.Text = "שלום אורח";
                Label5.Text = "0";


            }
            else
            {
                Label1.Text = "היי " + Session["name"];
                Label2.Text = "";
                Label3.Text = "";
                Label4.Text = "התנתקות";
                Label5.Text = Int32.Parse(cl.countCart(Int32.Parse(Session["ID"].ToString())).ToString()).ToString();
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["name"] = null;
            Session["email"] = null;
            Session["ID"] = null;
            Label2.Text = "הירשם";
            Label3.Text = "התחבר";
            Label4.Text = "";
            Response.Redirect("Home.aspx");
        }
        
    }
}