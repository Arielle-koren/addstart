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

        protected void Button1_Click(object sender, EventArgs e)//כפתור הרשמה
        {
            Label1.Text = "";
            UsersLogic us = new UsersLogic();
            if (us.checkExistEmail(email.Text))//בדיקה אם המשתמש קיים, כלומר אם האימייל כבר שמור אצל משתמש אחר
            {
                string message = "זהו משתמש קיים, אנא החלף אימייל";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
            }
            else// האימייל לא קיים במסד הנתונים ולכן ניתן להירשם איתו
            {
                String nameS = firstName.Text.Replace("'", "");
                String lastnameS = lastName.Text.Replace("'", "");
                us.addNewUser(nameS, lastnameS, email.Text, birthDate.Text, password.Text);
                // פנייה לשאילתת הכנסה שם משתמש חדש
                
                int id = Int32.Parse(us.getID(email.Text).Tables[0].Rows[0]["ID"].ToString());
                
                Session["ID"] = id;
                Session["name"] = us.getName(email.Text).Tables[0].Rows[0]["Name"].ToString();
                Session["email"] = email.Text;
                Session["IsAdmin"] = "no";
                Response.Redirect("Home.aspx");
            }
        }
    }
}