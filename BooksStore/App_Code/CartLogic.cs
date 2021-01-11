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
     

        public void addToCart(int booksID, int ID, int num)
        {
            string n= this.booksExists(booksID, ID);
            string sql;
            if (n == null)
            {
                sql = "INSERT INTO BooksCart( BooksID, UsersID, NumBooks) VALUES (" + booksID + ", " + ID + ", " + num + ")";
                dal.excuteQuery(sql);
            }
            else
            {
                sql = "UPDATE BooksCart SET NumBooks=" + (Int32.Parse(n) +num)+ " WHERE UsersID=" + ID+ " AND BooksID= "+ booksID;
                dal.excuteQuery(sql);
            }

        }
        public string booksExists(int booksID, int ID)
        {
            string sql = "SELECT NumBooks FROM BooksCart WHERE BooksID= "+ booksID+" AND UsersID= "+ID;
            int num = dal.excuteQuery(sql).Tables[0].Rows.Count;
            //   [0]["NumBooks"].ToString();
            if (num == 0)
                return null;
            else
                return dal.excuteQuery(sql).Tables[0].Rows[0]["NumBooks"].ToString();
        }
        public String numBooks(int booksID, int ID)
        {
            string sql = "SELECT NumBooks FROM BooksCart WHERE BooksID= " + booksID + " AND UsersID= " + ID;
            return dal.excuteQuery(sql).Tables[0].Rows[0]["NumBooks"].ToString();
        }
        public DataSet getCart(int ID)
        {
            string sql = "SELECT BooksID, NumBooks, Name, Auther, Price, Image1, Price*NumBooks AS TOTAL FROM BooksCart INNER JOIN Books ON Books.ID= BooksCart.BooksID WHERE UsersID="+ ID;
            return dal.excuteQuery(sql);
        }
        public void deleteFromCart(int booksID, int ID)
        {
            string sql = " DELETE FROM BooksCart WHERE UsersID=" + ID + " AND BooksID= " + booksID;
            dal.excuteQuery(sql);
        }
        public DataSet getTotal(int ID)
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
            if (Int32.Parse(this.numBooks(booksID, ID))==0)// אם הוריד את כמות הספרים לאפס הספר צריך להימחק
            {
                this.deleteFromCart(booksID, ID);
            }
        }
    }
}