using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BooksStore.App_Code
{
    public class CreditLogic
    {
        DAL dal = new DAL();
        public void addNewCredit(int orderID,string name1, string credit, string cvc, int month, int year)// יצירת שם משתמש
        {
            string sql = "INSERT INTO Credit (OrderID, Name1, Credit, Cvc, ExpMonth, ExpYear) VALUES (" + orderID + ", '" + name1 + "', " + credit + ", "+ cvc+ ", " + month + "," + year + ")";
            dal.excuteQuery(sql);

        }
    }
}