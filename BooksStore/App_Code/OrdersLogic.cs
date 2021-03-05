﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BooksStore.App_Code
{
    public class OrdersLogic
    {
        DAL dal = new DAL();

        public DataSet showAllOrders1()//מחזירה את כל ההזמנות
        {
            string sql = "SELECT Orders.ID, Orders.UsersID, Orders.Hour, Orders.Date1, Orders.City, Orders.Address, Orders.Phone, More , Users.Name+' '+ Users.LastName AS FullName,  Orders.DelieveryPrice  FROM Orders INNER JOIN Users ON Orders.UsersID = Users.ID";
            DataSet ds = dal.excuteQuery(sql);
            return ds;

        }
        public DataSet getByMonthAndYear(string Month, string Year)// מחזירה הזמנות שבוצעו בשנה ובחודש שהשאילתה מקבלת
        {
            int A = Int32.Parse(Month);
            int B = Int32.Parse(Year);
            string sql = "SELECT Orders.ID, Orders.UsersID, Orders.Hour, Orders.Date1, Orders.City, Orders.Address, Orders.Phone, Orders.More, Users.Name+' '+ Users.LastName AS FullName, Orders.DelieveryPrice FROM Orders INNER JOIN Users ON Orders.UsersID = Users.ID WHERE Month(Orders.Date1) IN (" + A + ") AND Year(Orders.Date1) IN (" + B + ")";
            DataSet ds = dal.excuteQuery(sql);
            return ds;
        }
        public DataSet getUsersOrder( int ID)// מקבלת ID ומחזירה את כל ההזמנות שלו
        {
            string sql = "SELECT Orders.ID, Orders.Hour, Orders.Date1, Orders.Phone, Orders.More, Orders.Address+ ' '+Orders.City AS Address, Sum(BooksOrders.NumBooks) AS S, SUM(BooksOrders.PricePerOne*BooksOrders.NumBooks) AS Total, Orders.DelieveryPrice FROM (Orders INNER JOIN BooksOrders ON Orders.ID=BooksOrders.OrdersID) WHERE Orders.UsersID= " + ID+ " GROUP BY Orders.ID, Orders.Hour, Orders.Date1, Orders.Address,Orders.Address+ ' '+Orders.City, Orders.Phone, Orders.More, Orders.DelieveryPrice";
            return dal.excuteQuery(sql);
        }

        public int addOrder(int UID, string city, string Address, string more, string phone)// שאילתה שיוצרת הזמנה חדשה
        {
            CartLogic cl = new CartLogic();
            BooksLogic bl = new BooksLogic();
            string sql = "INSERT INTO Orders (UsersID, [Hour], Date1, City, Address, More, Phone) VALUES (" + UID + ", #" + DateTime.Now + "#, #" + DateTime.Today + "# , '" + city + "', '" + Address + "', '"+ more+"', '"+ phone+"')";
            dal.excuteQuery(sql);
            int orderid = this.getID(UID);
            DataSet ds = cl.getCart(UID);
            int n = ds.Tables[0].Rows.Count;
            for (int i=0; i<n; i++)
            {
                int bookId = Int32.Parse(ds.Tables[0].Rows[i]["BooksID"].ToString());
                int numbook = Int32.Parse(ds.Tables[0].Rows[i]["NumBooks"].ToString());
                double price = bl.getPrice(bookId);
                sql = "INSERT INTO booksOrders(OrdersID, BooksID, NumBooks, PricePerOne) VALUES (" + orderid+", "+bookId+", "+numbook +", "+price+")";
                dal.excuteQuery(sql);
                bl.updateStock1(bookId, numbook);
                
            }
             return orderid;
        }
        public int getID( int usersID)//שאילתה שמחזירה את האיידי של ההזמנה האחרונה שבוצעה של משתמש זה
        {
            string sql = " SELECT TOP 1 ID FROM Orders WHERE UsersID="+ usersID +" ORDER BY Date1 DESC, Hour DESC";
            DataSet ds= dal.excuteQuery(sql);
            int id=Int32.Parse(ds.Tables[0].Rows[0]["ID"].ToString());
            return id;
        }
        public DataSet getOrder(int ID)//שאילתה שמחזירה את הפרטים של ההזמנה עם האידי שמקבלת
        {
            string sql = "SELECT BooksID, NumBooks, Name, Auther, Price, Image1, PricePerOne*NumBooks AS TOTAL FROM ((Orders INNER JOIN BooksOrders ON Orders.ID=BooksOrders.OrdersID) INNER JOIN Books ON BOOKS.ID= BooksOrders.BooksID) WHERE Orders.ID=" + ID;
            return dal.excuteQuery(sql);
        }
        public DataSet getTotal(int OrderID)//שאילתה שמחזירה את סכום הקנייה של הזמנה מסויימת
        {
            string sql = "SELECT SUM(PricePerOne*NumBooks) AS TOTAL FROM (Orders INNER JOIN BooksOrders ON Orders.ID=BooksOrders.OrdersID) WHERE Orders.ID=" + OrderID;
            return dal.excuteQuery(sql);
        }
        public string getRecommendedByType(int userID)// שאילתה שמחזירה את סוג הספרים שהמשתמש קנה מהם יותר משלושה ספרים
        {
            string sql ="SELECT [Type] From((Orders INNER JOIN BooksOrders ON Orders.ID = BooksOrders.OrdersID) INNER JOIN Books ON BOOKS.ID = BooksOrders.BooksID) WHERE usersID = "+userID+" GROUP BY [Type] having Count([Type])> 3";
            return sql;
        }
        public string getRecommendedByAuther(int userID)// שאילתה שמחזירה את הסופרים שהמשתמש קנה מהם יותר משלושה ספרים
        {
            string sql = "SELECT Auther From((Orders INNER JOIN BooksOrders ON Orders.ID = BooksOrders.OrdersID) INNER JOIN Books ON BOOKS.ID = BooksOrders.BooksID) WHERE usersID = " + userID + " GROUP BY Auther having Count(Auther)> 3";
            return sql;
        }
    }
}