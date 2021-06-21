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
    public partial class BooksManager : System.Web.UI.Page
    {
        BooksLogic bl = new BooksLogic();
        string search;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"].ToString() != "yes")
                Response.Redirect("Home.aspx");
            if (!IsPostBack)
            {
                search = "";
                GridView1.DataSource = bl.getAllBooksDetail1(search);
                GridView1.DataBind();
            }

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            search = TextBox4.Text.Replace("'", "''");
            
            GridView1.EditIndex = e.NewEditIndex;
            
            GridView1.DataSource = bl.getAllBooksDetail1(search);
            

            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            search = TextBox4.Text.Replace("'", "''");
            label1.Text = "";
            try
            {
                // לקיחת הנתונים

                double price = Double.Parse(((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text);
                int stock = Int32.Parse(((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[0])).Text);

                //קריאה לפעולת העדכון
                bl.updateProd(price, stock, Int32.Parse(GridView1.Rows[e.RowIndex].Cells[8].Text));

                //יציאה ממצב עריכה
                GridView1.EditIndex = -1;
            
                GridView1.DataSource = bl.getAllBooksDetail1(search);
            GridView1.DataBind();

            }
            catch (Exception ex)
            {
                label1.Text = "הודעת מערכת: הנתונים לא נשמרו, בדוק אם הנתונים שהזנת תקינים ונסה עוד פעם מאוחר יותר";
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            search = TextBox4.Text.Replace("'", "''");
            GridView1.EditIndex = -1;
            
                GridView1.DataSource = bl.getAllBooksDetail1(search);
            GridView1.DataBind();

        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            label1.Text = "";
          try
          {
                search = TextBox4.Text.Replace("'", "''");
                //קריאה לפעולת העדכון
                bl.updateStock(Int32.Parse(GridView1.Rows[e.RowIndex].Cells[8].Text));

                //יציאה ממצב עריכה
                //GridView1.EditIndex = -1;
            
                GridView1.DataSource = bl.getAllBooksDetail1(search);
            GridView1.DataBind();

                string strLoginPage = "BooksManager.aspx"; // getting page url from web.config;
                string scriptText = "alert('הספר נמחק מהמלאי בהצלחה, לא תהיה אפשרות לרכוש ספר זה עד שיהיה במלאי'); window.location='" + Request.ApplicationPath + strLoginPage + "'";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);

            }
            catch (Exception ex)
            {
                label1.Text = "הודעת מערכת: הנתונים לא נשמרו, נסה עוד פעם מאוחר יותר";
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                search = TextBox4.Text.Replace("'", "''");
           
                GridView1.DataSource = bl.getAllBooksDetail1(search);
            GridView1.DataBind();
            
                label1.Text = "תוצאות לחיפושך: '" + TextBox4.Text + "' ";
                
            
            
        }
    }
}