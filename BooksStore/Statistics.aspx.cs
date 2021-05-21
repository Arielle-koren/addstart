﻿using BooksStore.App_Code;
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
            if (Session["IsAdmin"].ToString() != "yes")
                Response.Redirect("Home.aspx");
            if (!IsPostBack)
            {
                
                DataTable dt = bl.types().Tables[0];//טבלת סוגי הזאנרים וכמות מכל זאנר
                
                Chart1.DataSource = dt;
                Chart1.Series["Series1"].XValueMember = "Name";
                Chart1.Series["Series1"].YValueMembers = "num";

                // הפיכת התגיות לפורמט "Name (### %)"
                this.Chart1.Series[0].LegendText = "#VALX (#PERCENT)";
                // התגיות יופיעו לפי סדר גודלן
                this.Chart1.DataManipulator.Sort(PointSortOrder.Descending, Chart2.Series[0]);

                Chart1.DataBind();


                DataTable dt2 = ol.ordersByMonth2().Tables[0];
                DataTable dt4 = new DataTable();// יצירת טבלה חדשה המחיר עם המלא ושמות משמעותיים
                dt4.Columns.Add("M", typeof(string));//עמודת חודשים
                dt4.Columns.Add("in", typeof(string));//עמודת הכנסות
                dt4.Columns.Add("out", typeof(string));//עמודת הוצאות
               

                for (int i=0; i<dt2.Rows.Count ; i++)//הכנסת הנתונים לטבלה החדשה
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