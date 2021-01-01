using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BooksStore.App_Code
{
    public class OrdersLogic
    {
        DAL dal = new DAL();

        public DataSet showAllOrders()
        {
            string sql = "SELECT Orders.ID, Orders.UsersID, Orders.Hour, Orders.Date1, Orders.City, Orders.Address, Users.Name+' '+ Users.LastName AS FullName FROM Orders INNER JOIN Users ON Orders.UsersID = Users.ID";
            DataSet ds = dal.excuteQuery(sql);
            return ds;

        }
        public DataSet getByMonthAndYear(string Month, string Year)
        {
            int A = Int32.Parse(Month);
            int B = Int32.Parse(Year);
            string sql = "SELECT Orders.ID, Orders.UsersID, Orders.Hour, Orders.Date1, Orders.City, Orders.Address, Users.Name+' '+ Users.LastName AS FullName FROM Orders INNER JOIN Users ON Orders.UsersID = Users.ID WHERE Month(Orders.Date1) IN (" + A + ") AND Year(Orders.Date1) IN (" + B + ")";
            DataSet ds = dal.excuteQuery(sql);
            return ds;
        }
        public DataSet getUsersOrder( int ID)// מקבלת ID ומחזירה את כל ההזמנות שלו
        {
            string sql = "SELECT Orders.ID, Orders.Hour, Orders.Date1, Orders.Address+ ' '+Orders.City AS Address, Sum(BooksOrders.NumBooks) AS S, SUM(Books.Price*BooksOrders.NumBooks) AS Total FROM ((Orders INNER JOIN BooksOrders ON Orders.ID=BooksOrders.OrdersID) INNER JOIN Books ON BOOKS.ID= BooksOrders.BooksID) WHERE Orders.UsersID= " + ID+ " GROUP BY Orders.ID, Orders.Hour, Orders.Date1, Orders.Address,Orders.Address+ ' '+Orders.City";
            return dal.excuteQuery(sql);
        }



    }
}