using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BooksStore.App_Code
{
    public class CartLogic
    {
        DAL dal = new DAL();


        public void addToCart(int booksID, int ID, int num)//מוסיפה ספר לעגלה
        {
            string n = this.booksExists(booksID, ID);
            string sql;
            if (n == null)// הספר לא קיים בעגלה מלפני כן
            {
                sql = "INSERT INTO BooksCart( BooksID, UsersID, NumBooks) VALUES (" + booksID + ", " + ID + ", " + num + ")";
                dal.excuteQuery(sql);
            }
            else//הספר כן קיים בעגלה מלפני כן
            {
                sql = "UPDATE BooksCart SET NumBooks=" + (Int32.Parse(n) + num) + " WHERE UsersID=" + ID + " AND BooksID= " + booksID;
                dal.excuteQuery(sql);
            }

        }

        public string booksExists(int booksID, int ID)// בודקת האם הספר נמצא בעגלת קניות של המשתמש ומחזירה את מספר הספרים הקיימים או null אם לא קיימים
        {
            string sql = "SELECT NumBooks FROM BooksCart WHERE BooksID= " + booksID + " AND UsersID= " + ID;
            int num = dal.excuteQuery(sql).Tables[0].Rows.Count;
            //   [0]["NumBooks"].ToString();
            if (num == 0)
                return null;
            else
                return dal.excuteQuery(sql).Tables[0].Rows[0]["NumBooks"].ToString();
        }

        public String numBooks(int booksID, int ID)// מחזירה כמה ספרים שהקוד שלהם bookid נמצאים בעגלת id 
        {
            string sql = "SELECT NumBooks FROM BooksCart WHERE BooksID= " + booksID + " AND UsersID= " + ID;
            return dal.excuteQuery(sql).Tables[0].Rows[0]["NumBooks"].ToString();
        }

        public DataSet getCart(int ID)//מחזירה את כל הספרים בעגלה
        {
            string sql = "SELECT BooksID, NumBooks, Name, Auther, Price, Image1, Price*NumBooks AS TOTAL FROM BooksCart INNER JOIN Books ON Books.ID= BooksCart.BooksID WHERE UsersID=" + ID;
            return dal.excuteQuery(sql);
        }

        public void deleteFromCart(int booksID, int ID)// מוחקת ספר מסוים מהעגלה
        {
            string sql = " DELETE FROM BooksCart WHERE UsersID=" + ID + " AND BooksID= " + booksID;
            dal.excuteQuery(sql);
        }

        public DataSet getTotal(int ID)// מקבלת את סכום מחיריהם הספרים בעגלה
        {
            string sql = "SELECT SUM(Price*NumBooks) AS TOTAL FROM BooksCart INNER JOIN Books ON Books.ID= BooksCart.BooksID WHERE UsersID=" + ID;
            return dal.excuteQuery(sql);
        }

        public void add1(int booksID, int ID)// מעלה את מספר הספרים בעגלה מסוג מסוים של המשתמש באחד
        {
            string sql = "UPDATE BooksCart SET NumBooks= NumBooks+1 WHERE UsersID=" + ID + " AND BooksID= " + booksID;
            dal.excuteQuery(sql);
        }

        public void remove1(int booksID, int ID)// מורידה את מספר הספרים שהוזמנו מסוג מסוים של המשתמש באחד. אם המספר הגיע לאפס מוחקת את הספר מהעגלה
        {
            string sql = "UPDATE BooksCart SET NumBooks= NumBooks-1  WHERE UsersID=" + ID + " AND BooksID= " + booksID;
            dal.excuteQuery(sql);
            if (Int32.Parse(this.numBooks(booksID, ID)) == 0)// אם הוריד את כמות הספרים לאפס הספר צריך להימחק
            {
                this.deleteFromCart(booksID, ID);
            }
        }

        public void deleteCart(int id)//מחיקת כל הספרים בעגלה
        {
            string sql = "DELETE FROM BooksCart WHERE UsersID=" + id;
            dal.excuteQuery(sql);
        }

        public bool inStock(int bookid, int num)//בדיקה האם יש כמות num מהספר המסויים
        {
            string sql = "SELECT Stock FROM Books WHERE ID=" + bookid;
            DataSet ds = dal.excuteQuery(sql);
            if (Int32.Parse(ds.Tables[0].Rows[0]["Stock"].ToString()) > num)
                return true;
            return false;
        }

        public int countCart(int id)// כמות הפריטים בעגלה
        {
            string sql = "SELECT BooksID FROM BooksCart WHERE UsersID=" + id;
            return dal.excuteQuery(sql).Tables[0].Rows.Count;
        }

    }
}