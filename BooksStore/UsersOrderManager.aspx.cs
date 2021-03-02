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
        UsersLogic us = new UsersLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"].ToString() != "yes")
                Response.Redirect("Home.aspx");
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["data"]))
                {
                    int id = Int32.Parse(Request.QueryString["data"]);
                    Label1.Text = "ההזמנות של " +us.getName1(id).Tables[0].Rows[0]["Name"].ToString();
                    DataSet ds = ol.getUsersOrder(id);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView1.DataSource = ol.getUsersOrder(id);
                        GridView1.DataBind();
                    }
                    else
                        Label2.Text = "אין הזמנות מתאימות";
                }
                else
                    Label2.Text = "אין הזמנות מתאימות";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}