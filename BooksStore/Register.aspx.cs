using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BooksStore.App_Code;

namespace BooksStore
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            UsersLogic us = new UsersLogic();
            if (us.checkExistEmail(email.Text))
            {
                string message = "זהו משתמש קיים, אנא החלף אימייל";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
            }
            else
            {
                String nameS = firstName.Text.Replace("'", "''");
                String lastnameS = lastName.Text.Replace("'", "''");
                us.addNewUser(nameS, lastnameS, email.Text, birthDate.Text, password.Text);
                // פנייה לשאילתת הכנסה שם משתמש חדש

                string message = "שמחים שנרשמת לאתר!";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
            }
        }
    }
}