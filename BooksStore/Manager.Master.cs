using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "היי " + Session["name"]+ "         ";


        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["name"] = null;
            Session["email"] = null;
            Response.Redirect("Home.aspx");
        }
    }
}