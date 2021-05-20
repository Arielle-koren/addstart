using BooksStore.App_Code;
using BooksStore.DeliveriesServices;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class Statistics : System.Web.UI.Page
    {
        WebService1 wb = new WebService1();
        BooksLogic bl = new BooksLogic();
        OrdersLogic ol = new OrdersLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(!IsPostBack)
            {
                DataTable dt = bl.types().Tables[0];
                
                Chart1.DataSource = dt;
                Chart1.Series["Series1"].XValueMember = "Name";
                Chart1.Series["Series1"].YValueMembers = "num";

                // Add a legend to the chart and dock it to the bottom-center
                this.Chart1.Legends.Add("Legend1");
                this.Chart1.Legends[0].Enabled = true;
                this.Chart1.Legends[0].Docking = Docking.Bottom;
                this.Chart1.Legends[0].Alignment = System.Drawing.StringAlignment.Center;

                // Show labels in the legend in the format "Name (### %)"
                this.Chart1.Series[0].LegendText = "#VALX (#PERCENT)";

                // By sorting the data points, they show up in proper ascending order in the legend
                this.Chart1.DataManipulator.Sort(PointSortOrder.Descending, Chart2.Series[0]);

                Chart1.DataBind();


                DataTable dt2 = ol.ordersByMonth2().Tables[0];
                DataTable dt4 = new DataTable();
                dt4.Columns.Add("M", typeof(string));
                dt4.Columns.Add("in", typeof(string));
                dt4.Columns.Add("out", typeof(string));
               

                for (int i=0; i<dt2.Rows.Count ; i++)
                {
                    dt4.Rows.Add(dt2.Rows[i]["M"].ToString(), dt2.Rows[i]["Total"].ToString()+10, dt2.Rows[i]["Out"].ToString());// ה10 שנוסף להכנסות הוא תשלום המשלוח שמשלם הלקוח
                }

                Chart2.DataSource = dt4;
                Chart2.Series["Series1"].XValueMember = "M";
                Chart2.Series["Series1"].YValueMembers = "in";
                Chart2.Series["Series2"].YValueMembers = "out";
                Chart2.DataBind();
                
            }

        }


      
    }
}