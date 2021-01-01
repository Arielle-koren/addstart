using BooksStore.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            RequestsLogic rl = new RequestsLogic();
            String nameS = name.Text.Replace("'", "''");
            String messageS = message.Text.Replace("'", "''");
            rl.addNewRequest(nameS, email.Text, messageS);
            Label1.Text="בקשתך התקבלה";

        }
    }
}