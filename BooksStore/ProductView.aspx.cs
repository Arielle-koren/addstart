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
    public partial class ProductView : System.Web.UI.Page
    {
        
        BooksLogic bl = new BooksLogic();
        CartLogic cl = new CartLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["data"]))
                {
                    int bookid = Int32.Parse(Request.QueryString["data"]);
                    DataSet ds1 = bl.getBooksByID(bookid);
                    Label3.Text = ds1.Tables[0].Rows[0]["Books.Name"].ToString();
                    Label1.Text = ds1.Tables[0].Rows[0]["Description"].ToString();
                    Label2.Text = ds1.Tables[0].Rows[0]["Price"].ToString();
                    Label5.Text = ds1.Tables[0].Rows[0]["Auther"].ToString();
                    Image1.ImageUrl = "Image/" + ds1.Tables[0].Rows[0]["Image1"].ToString();
                    Label4.Text = ds1.Tables[0].Rows[0]["Type.Name"].ToString();
                }
                else
                    Response.Redirect("Home.aspx");

            }
        }

        protected void Button2_Click(object sender, EventArgs e)//הוספת ספר לעגלה
        {
            if (Session["ID"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
            else if (cl.inStock(Int32.Parse(Request.QueryString["data"]), Int32.Parse(TextBox1.Text)))// בדיקה שהספר במלאי
            {
                cl.addToCart(Int32.Parse(Request.QueryString["data"]), Int32.Parse(Session["ID"].ToString()), Int32.Parse(TextBox1.Text));
                string strLoginPage = "Home.aspx"; // getting page url from web.config;

                string scriptText = "alert('הספר נוסף בהצלחה'); window.location='" + Request.ApplicationPath + strLoginPage + "'";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
               
            }
            else
                Label6.Text = "לצערנו אין את הכמות שהזנת במלאי";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)// מעבר לעמוד שבו מוצגים בפרים מאותו הזאנר
        {
            Response.Redirect("BooksByCategory.aspx?type=" + bl.getTypeID(Label4.Text));
        }
    }
}