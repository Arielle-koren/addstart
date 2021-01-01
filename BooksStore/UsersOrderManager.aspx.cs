using BooksStore.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class UsersOrderManager : System.Web.UI.Page
    {
        OrdersLogic ol = new OrdersLogic();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"].ToString() != "yes")
                Response.Redirect("Home.aspx");
            if (!IsPostBack)
            {

                if (!string.IsNullOrEmpty(Request.QueryString["data"]))
                {
                    DataSet ds = ol.getUsersOrder(Int32.Parse(Request.QueryString["data"]));
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView1.DataSource = ol.getUsersOrder(Int32.Parse(Request.QueryString["data"]));
                        GridView1.DataBind();
                    }
                    else
                        Label2.Text = "אין הזמנות מתאימות";
                }
                else
                    Label2.Text = "אין הזמנות מתאימות";
            }
        }
    }
}