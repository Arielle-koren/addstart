using BooksStore.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class CommentsManager : System.Web.UI.Page
    {
        RequestsLogic rl = new RequestsLogic();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"].ToString() != "yes")
                Response.Redirect("Home.aspx");
            if (!IsPostBack)
            {
                Repeater1.DataSource = rl.getAllRequests();
                Repeater1.DataBind();
            }
        }


        protected void Button1_Click(object sender, EventArgs e)//שינוי סטטוס הבקשה
        {
            int id = Int32.Parse((sender as Button).CommandName);
            if (rl.getDone(id).Tables[0].Rows[0]["Done"].ToString().Equals("True"))//בקשה שכתוב שהיא נענתה והמנהל רוצה לשנות ללא נענתה
                rl.changeToNotDone(id);
            else// בקשה שהמנהל רוצה לשנות לנענתה
                rl.changeToDone(id);


            Repeater1.DataSource = rl.getAllRequests();
            Repeater1.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)//בחירת סוג הבקשות שיופיעו על המסך
        {
            if (DropDownList1.SelectedItem.Value.Equals("1"))
            {
                Repeater1.DataSource = rl.getAllRequests();
                Repeater1.DataBind();
            }
             else if (DropDownList1.SelectedItem.Value.Equals("2"))
            {
                Repeater1.DataSource = rl.getRequests();
                Repeater1.DataBind();
            }
            else
            {
                Repeater1.DataSource = rl.getDoneRequests();
                Repeater1.DataBind();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string email = (String)((sender as LinkButton).CommandName);
            ClientScript.RegisterStartupScript(this.GetType(), "mailto", "parent.location='mailto:" + email + "'", true);
        }
    }
}