using BooksStore.App_Code;
using BooksStore.DeliveriesServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class Statistics : System.Web.UI.Page
    {
        WebService1 wb = new WebService1();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(!IsPostBack)
            {
               
                
            }

        }

      
    }
}