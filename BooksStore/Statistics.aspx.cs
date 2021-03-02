using BooksStore.App_Code;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            BooksLogic bl = new BooksLogic();
            
                if (!IsPostBack)
                {
                    Repeater1.DataSource = bl.getBooks(2);
                    Repeater1.DataBind();

                }
           

        }
       
    }
}