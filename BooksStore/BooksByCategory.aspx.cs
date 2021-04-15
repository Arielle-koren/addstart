using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BooksStore.App_Code;

namespace BooksStore
{
    public partial class BooksByCategory : System.Web.UI.Page
    {
        BooksLogic bl = new BooksLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["type"]))
                {
                    Repeater1.DataSource = bl.getBooks(Int32.Parse(Request.QueryString["type"].ToString()));
                    Repeater1.DataBind();
                    label1.Text = bl.getTypeName(Int32.Parse(Request.QueryString["type"].ToString()));
                    Label4.Text = "קטגוריה: ";
                }
                else
                {
                    label1.Text = "משהו השתבש, נסה שוב בעוד כמה דקות";

                }
            }
        }
    }
}