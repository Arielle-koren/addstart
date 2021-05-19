using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Globalization;
using System.Threading;

namespace BooksStore.App_Code
{
    public class OrdersLogic
    {
        DAL dal = new DAL();

        public DataSet showAllOrders1()//מחזירה את כל ההזמנות
        {
            string sql = "SELECT TOP 20 Orders.ID, Orders.UsersID, Orders.Hour, Orders.Date1, Cities.City, Orders.Address, Orders.Phone, More , Users.Name+' '+ Users.LastName AS FullName,  Orders.DelieveryPrice  FROM ((Orders INNER JOIN Users ON Orders.UsersID = Users.ID) INNER JOIN Cities ON Orders.City= Cities.ID) ORDER BY Date1 DESC, Hour DESC";
            DataSet ds = dal.excuteQuery(sql);
            return ds;

        }

        public DataSet getByMonthAndYear(string d1, string d2)// מחזירה הזמנות שבוצעו בין הזמנים  שהשאילתה מקבלת
        {
           
            string sql = String.Format("SELECT Orders.ID, Orders.UsersID, Orders.Hour, Orders.Date1, Cities.City, Orders.Address, Orders.Phone, Orders.More, Users.Name+' '+ Users.LastName AS FullName, Orders.DelieveryPrice FROM ((Orders INNER JOIN Users ON Orders.UsersID = Users.ID) INNER JOIN Cities ON Orders.City= Cities.ID) WHERE ((Orders.Date1 >=#{0}#) AND (Orders.Date1 <=#{1}#))", d1, d2);

            DataSet ds = dal.excuteQuery(sql);
            return ds;
        }

        public DataSet getUsersOrder( int ID)// מקבלת ID ומחזירה את כל ההזמנות שלו
        {
            string sql = "SELECT Orders.ID, Orders.Hour, Orders.Date1, Orders.Phone, Orders.More, Orders.Address+ ' '+Cities.City AS Address, Sum(BooksOrders.NumBooks) AS S, SUM(BooksOrders.PricePerOne*BooksOrders.NumBooks) AS Total, Orders.DelieveryPrice FROM ((Orders INNER JOIN BooksOrders ON Orders.ID=BooksOrders.OrdersID) INNER JOIN Cities ON Orders.City= Cities.ID) WHERE Orders.UsersID= " + ID+ " GROUP BY Orders.ID, Orders.Hour, Orders.Date1, Orders.Address,Orders.Address+ ' '+ Cities.City, Orders.Phone, Orders.More, Orders.DelieveryPrice ORDER BY Orders.Date1 DESC, Orders.Hour DESC";
            return dal.excuteQuery(sql);
        }

        public int addOrder(int UID, int city, string Address, string more, string phone)// שאילתה שיוצרת הזמנה חדשה
        {
            CartLogic cl = new CartLogic();
            BooksLogic bl = new BooksLogic();
            string sql = "INSERT INTO Orders (UsersID, [Hour], Date1, City, Address, More, Phone) VALUES (" + UID + ", '" + DateTime.Now + "', #" + DateTime.Now.ToShortDateString() + "# , " + city + ", '" + Address + "', '"+ more+"', '"+ phone+"')";
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
            string sql = " SELECT TOP 1 ID FROM Orders WHERE UsersID="+ usersID +" ORDER BY ID DESC";
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

        public DataSet getCities()
        {
            string sql = "SELECT ID, City FROM Cities";
            return dal.excuteQuery(sql);

        }

        public string getCityName(int cityID)
        {
            string sql = "SELECT City FROM Cities WHERE ID= "+ cityID;
            return dal.excuteQuery(sql).Tables[0].Rows[0][0].ToString();
        }

        public DataSet getNumBooks(int ID)// מקבלת את מספר הספרים בהזמנה
        {
            string sql = "SELECT SUM(NumBooks) AS TOTAL FROM (Orders INNER JOIN BooksOrders ON Orders.ID=BooksOrders.OrdersID) WHERE Orders.ID=" + ID;
            return dal.excuteQuery(sql);
        }

        public void setDelieveryPrice(int ID, double price)// עדכון המחיר שעלה המשלוח של חברת השליחויות
        {
            string sql = "UPDATE Orders SET DelieveryPrice="+ price+ " WHERE ID="+ID;
            dal.excuteQuery(sql);
        }
        public DataSet ordersByMonth()// מחזיר מספר הזמנות מכל חודש בשנתיים האחרונות
        {
            string sql = "SELECT Count(ID) AS C, Date1 AS M FROM Orders WHERE Year(Date1)>"+DateTime.Now.Year +"-1 GROUP BY Month(Date1), Date1 ORDER BY Date1 DESC";
            return dal.excuteQuery(sql);
        }
        public DataSet ordersByMonth2()// מחזיר מספר הזמנות מכל חודש בשנתיים האחרונות
        {
            string sql = "SELECT SUM(PricePerOne* NumBooks)+10 AS TOTAL, Month(Date1) AS M, SUM(DelieveryPrice) AS Out FROM Orders INNER JOIN BooksOrders ON Orders.ID= BooksOrders.OrdersID WHERE Year(Date1)=" + DateTime.Now.Year + " GROUP BY Month(Date1) ORDER BY Month(Date1)";
            return dal.excuteQuery(sql);
        }

    }
}