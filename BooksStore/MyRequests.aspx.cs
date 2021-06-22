using BooksStore.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class MyRequests : System.Web.UI.Page
    {
        RequestsLogic rl = new RequestsLogic();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"]==null)
                Response.Redirect("LogIn.aspx");
            if (!IsPostBack)
            {
                Repeater1.DataSource = rl.getMyRequest(Session["email"].ToString());
                Repeater1.DataBind();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)//שינוי סטטוס הבקשה
        {
            int id = Int32.Parse((sender as Button).CommandName);
                rl.changeToNotDone(id);



            Repeater1.DataSource = rl.getMyRequest(Session["email"].ToString());
            Repeater1.DataBind();
        }

        
        
    }
}