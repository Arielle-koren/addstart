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
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(!IsPostBack)
            {
                DataTable dt = bl.types().Tables[0];
                
                Chart1.DataSource = dt;
                Chart1.Series["Series1"].XValueMember = "Name";
                Chart1.Series["Series1"].YValueMembers = "num";
                Chart1.DataBind();

               

              //  String[] classArrAlloted = { "A1", "B1", "B2", "C1" };
               // int[] countAlloted = { A1Alloted, B1Alloted, B2Alloted, C1Alloted };

              //  Chart1.Series["SeriesAllotedClass"].Points.DataBindXY(classArrAlloted, countAlloted);

                
            }

        }


      
    }
}