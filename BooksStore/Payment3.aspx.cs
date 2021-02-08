using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class Payment3 : System.Web.UI.Page
    {
        int orderID;
        protected void Page_Load(object sender, EventArgs e)
        {
            
                if (!string.IsNullOrEmpty(Request.QueryString["data"]))
                {
                    orderID = Int32.Parse(Request.QueryString["data"]);
                }
          
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderReciept.aspx?data="+orderID);
        }
    }
}