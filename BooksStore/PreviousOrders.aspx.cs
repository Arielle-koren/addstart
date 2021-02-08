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
    public partial class PreviousOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            OrdersLogic ol = new OrdersLogic();
            if (!IsPostBack)
            {
                
                    int id = Int32.Parse(Session["ID"].ToString());
                    DataSet ds = ol.getUsersOrder(id);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds;
                        GridView1.DataBind();
                    }
                    else
                        Label2.Text = "אין הזמנות מתאימות";
            
            } 
        }
    }
}
