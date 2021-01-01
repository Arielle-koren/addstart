using BooksStore.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class Home : System.Web.UI.Page
    {
        BooksLogic bl = new BooksLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater1.DataSource = bl.getAllBooks();
            Repeater1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String s = TextBox1.Text.Replace("'", "''");
            Repeater1.DataSource = bl.getBooksBySearch(s);
            Repeater1.DataBind();
        }
    }
}