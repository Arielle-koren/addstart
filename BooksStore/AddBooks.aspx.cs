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
            String nameS = name.Text.Replace("'", "''");
            String autherS = auther.Text.Replace("'", "''");
            if (bl.checkExistBook(nameS, autherS))
            {
                
                string message = "הספר כבר קיים במערכת";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
            }
            else
            {
               try
               {
                    //save image name
                    string imageName = FileUpload1.PostedFile.FileName;
                    imageName = imageName.Replace("'", "''");
                    //מחזיר את הנתיב של התיקיה בשרת
                    string path = Server.MapPath(@"~/Image/");
                    //בדיקה שהספר שהמשתמש הזין לא קיים כבר במערכת 
                    //שמירה של קובץ התמונה בתיקיה של האתר
                    FileUpload1.PostedFile.SaveAs(path + imageName);
                    String descS = description.Text.Replace("'", "''");
                    bl.addNewBook(nameS, autherS, Int32.Parse(type1.SelectedValue), Double.Parse(price.Text), descS, stock.Text, imageName);
                    string message = "הספר נשמר בהצלחה";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
               }
               catch(Exception ex)
                {
                    string message = "ייתכן שהקובץ לא נמצא, נסה שוב בעוד כמה דקות";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
                }
               
            }
        }

       
    }
}