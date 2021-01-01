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
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            DataSet ds1 = bl.getBooksByID(6);
            Label3.Text = ds1.Tables[0].Rows[0]["Books.Name"].ToString();
            Label1.Text = ds1.Tables[0].Rows[0]["Description"].ToString();
            Label2.Text = ds1.Tables[0].Rows[0]["Price"].ToString();
            Label5.Text = ds1.Tables[0].Rows[0]["Auther"].ToString();
            Image1.ImageUrl = "Image/"+ds1.Tables[0].Rows[0]["Image"].ToString();
            Label4.Text = ds1.Tables[0].Rows[0]["Type.Name"].ToString();
        }
    }
}