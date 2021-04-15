using BooksStore.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class Home : System.Web.UI.Page
    {
        BooksLogic bl = new BooksLogic();
        CartLogic ul = new CartLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Repeater1.DataSource = bl.getAllBooks();
                Repeater1.DataBind();
                if (Session["ID"] == null)//אין אפשרות להמליץ לו על ספרים במיוחד בשבילו מכיוון שהוא אינו מזוהה ולכן מביאים ספרים שנמכרו הכי הרבה ולכן מומלצים לכולם
                {
                    Repeater2.DataSource = bl.getAllBooks();
                    Repeater2.DataBind();
                }
                else
                {
                    Repeater2.DataSource = bl.getRecommendedBooks(Int32.Parse(Session["ID"].ToString()));//שאילה של ספרים מומלצים
                    Repeater2.DataBind();
                }
                Repeater3.DataSource = bl.getBooks(1);
                Repeater3.DataBind();
                Repeater4.DataSource = bl.getBooks(2);
                Repeater4.DataBind();
                Repeater5.DataSource = bl.getBooks(3);
                Repeater5.DataBind();
                Repeater6.DataSource = bl.getBooks(4);
                Repeater6.DataBind();
                Repeater7.DataSource = bl.getBooks(5);
                Repeater7.DataBind();
            }
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String s = TextBox1.Text.Replace("'", "''");
            DataSet ds = bl.getBooksBySearch(s);
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            if (ds.Tables[0].Rows.Count == 0)
            {
                Label11.Text = "לא נמצאו תוצאות מתאימות";
            }
            else
                Label11.Text = "תוצאות לחיפושך: '"+ TextBox1.Text + "' ";
        }
        
    }
}