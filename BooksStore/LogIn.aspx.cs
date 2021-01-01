using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BooksStore.App_Code;

namespace BooksStore
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            UsersLogic us = new UsersLogic();
            if (us.checkExistUser(email.Text, password1.Text))
            {
                Session["name"] = us.getName(email.Text).Tables[0].Rows[0]["Name"].ToString();
                if (us.getIsManager(email.Text))
                {
                    Session["IsAdmin"] = "yes";
                    Response.Redirect("BooksManager.aspx");
                }
                else
                { Response.Redirect("Home.aspx"); }
                 
               
             
            }
            else
                Label1.Text = "לא קיים במערכת";
        }
    }
}