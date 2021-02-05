using System;
using System.Collections.Generic;
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
          /*  if (!IsPostBack)
            {
                
                    int id = Int32.Parse(Session["ID"].ToString());
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
            } */
        }
    }
}