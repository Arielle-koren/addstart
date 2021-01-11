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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"]==null)
                Label1.Text = "שלום אורח";
            else
            {
                Label1.Text = "היי " + Session["name"];
                Label2.Text = "";
                Label3.Text = "";
                Label4.Text = "התנתקות";
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