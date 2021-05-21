using BooksStore.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class AddManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["IsAdmin"].ToString() != "yes")
                Response.Redirect("Home.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            UsersLogic us = new UsersLogic();
            if (us.checkExistEmail(email.Text))
            {
                string message = "זהו מנהל או משתמש קיים, אנא החלף אימייל";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
            }
            else            // פנייה לשאילתת הכנסה שם משתמש חדש
            {
                String nameS = firstName.Text.Replace("'", "");
                String lastnameS = lastName.Text.Replace("'", "");

                us.addNewManager(nameS, lastnameS, email.Text, birthDate.Text, password.Text);
                string message = "המנהל נוסף בהצלחה";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
            }

        }
    }
}