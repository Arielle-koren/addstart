using BooksStore.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class orderReciept : System.Web.UI.Page
    {
        OrdersLogic ol = new OrdersLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Repeater1.DataSource = ol.getOrder(5);
                Repeater1.DataBind();
                Label5.Text = ol.getTotal(5).Tables[0].Rows[0]["Total"].ToString();
            }
        }
    }
}