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


        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Int32.Parse((sender as Button).CommandName);
            if (rl.getDone(id).Tables[0].Rows[0]["Done"].ToString().Equals("True"))
                rl.changeToNotDone(id);
            else
                rl.changeToDone(id);


            Repeater1.DataSource = rl.getAllRequests();
            Repeater1.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
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

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            
        }
    }
}