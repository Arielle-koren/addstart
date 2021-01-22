using System;

namespace BooksStore
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["monemevakrim"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Application["monemevakrim"] = (int)(Application["monemevakrim"]);
            Session["name"] =null;
            Session["email"] = null;
            Session["IsAdmin"] = "no";
            Session["ID"] = null;
            Session["PD"] = null;
            Application.UnLock();


        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Session["IsAdmin"] = "no";

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}