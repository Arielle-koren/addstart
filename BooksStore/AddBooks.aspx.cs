using BooksStore.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class AddBooks : System.Web.UI.Page
    {
        BooksLogic bl = new BooksLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
       
            if (Session["IsAdmin"].ToString()!="yes")
                Response.Redirect("Home.aspx");
            if (!IsPostBack)
            {
                type1.DataSource = bl.getType();
                type1.DataBind();

                type1.DataTextField = "Name";
                type1.DataValueField = "ID";

                type1.DataBind();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            if (bl.checkExistBook(name.Text, auther.Text))
            {
                
                string message = "הספר כבר קיים במערכת";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
            }
            else
            {
                //save image name
                string imageName = FileUpload1.PostedFile.FileName;
                //מחזיר את הנתיב של התיקיה בשרת
                string path = Server.MapPath(@"~/Image/");
                //בדיקה שהספר שהמשתמש הזין לא קיים כבר במערכת 
                //שמירה של קובץ התמונה בתיקיה של האתר
                FileUpload1.PostedFile.SaveAs(path + imageName);
                String nameS = name.Text.Replace("'", "''");
                String autherS = auther.Text.Replace("'", "''");
                String descS = description.Text.Replace("'", "''");
                bl.addNewBook(nameS, autherS, Int32.Parse(type1.SelectedValue), Double.Parse(price.Text), descS, stock.Text, imageName);
               
                string message = "הספר נשמר בהצלחה";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
            }
        }

        /*protected void Button1_Click(object sender, EventArgs e)
       {
           BooksLogic bl = new BooksLogic();
           if (bl.checkExistBook(name.Text))
               Label1.Text = "הספר כבר קיים במערכת";
           //else
             //  bl.addNewBook(name.Text, auther.Text, price.Text, Double.Parse(type.Text), description.Text, stock.Text, image.Text);
           // פנייה לשאילתת הכנסה ספר חדש
       } */
    }
}