﻿using BooksStore.App_Code;
using BooksStore.DeliveriesServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksStore
{
    public partial class Statistics : System.Web.UI.Page
    {
        WebService1 wb = new WebService1();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(!IsPostBack)
            {
               
                
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
            try
            {
                Label1.Text = wb.GetStatus(Int32.Parse(TextBox1.Text));
            }
            catch(Exception ex)
            {
                Label1.Text = "משהו השתבש, בדוק  אם קוד ההזמנה תקין";
            }
        }
    }
}