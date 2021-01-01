using BooksStore.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class BooksManager : System.Web.UI.Page
    {
        BooksLogic bl = new BooksLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"].ToString() != "yes")
                Response.Redirect("Home.aspx");
            if (!IsPostBack)
            {
                GridView1.DataSource = bl.getAllBooksDetail1();
                GridView1.DataBind();
            }

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.DataSource = bl.getAllBooksDetail1();
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // לקיחת הנתונים
            double price = Double.Parse(((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text);
            int stock = Int32.Parse(((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[0])).Text);

            //קריאה לפעולת העדכון
            bl.updateProd(price, stock, Int32.Parse(GridView1.Rows[e.RowIndex].Cells[8].Text));
            
           //יציאה ממצב עריכה
            GridView1.EditIndex = -1;
            GridView1.DataSource = bl.getAllBooksDetail1();
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.DataSource = bl.getAllBooksDetail1();
            GridView1.DataBind();

        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //קריאה לפעולת העדכון
            bl.updateStock(Int32.Parse(GridView1.Rows[e.RowIndex].Cells[8].Text));

            //יציאה ממצב עריכה
            GridView1.EditIndex = -1;
            GridView1.DataSource = bl.getAllBooksDetail1();
            GridView1.DataBind();
        }
    }
}