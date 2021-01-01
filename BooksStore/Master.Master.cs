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
                Label1.Text = "שלום לאורח";
            else
            {
                Label1.Text = "היי, " + Session["name"];
                Label2.Text = "";
                Label3.Text = "";
            }
        }
    }
}