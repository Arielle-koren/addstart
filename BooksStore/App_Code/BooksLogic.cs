using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BooksStore.App_Code
{
    public class BooksLogic
    {
        DAL dal = new DAL();

        public DataSet getAllBooks()// שאילתה לדף הבית, מחזירה את הספרים שהכי נמכרים
        {
            string sql = "SELECT TOP 8 ID, Name, Auther, Price, Image1 FROM Books WHERE STOCK>0 ORDER BY NumSold DESC";
            return dal.excuteQuery(sql);
        }
        
        public DataSet getBooksBySearch(string name)// שאילתה ללחצן החיפוש, מקבלת את מה שחיפשו ומחזירה ספרים שבהם השמות שלהם או סופריהם מתחיל במה שחיפשו
        {
            string sql = "SELECT TOP 8 ID, Name, Auther, Price, Image1, Type, Description FROM Books WHERE Name Like '"+name+ "%' OR Auther Like '" + name + "%'";
            return dal.excuteQuery(sql);
        }
        public DataSet getBooksByID(int ID) // שאילתה שמחזירה ספר לפי ה איי די שהוכנס
        {
            string sql = "SELECT Books.ID, Books.Name, Books.Auther, Books.Price, Books.Image1, Books.Description, Type.Name FROM Books INNER JOIN Type ON Books.Type = Type.ID WHERE Books.ID=" + ID;
            return dal.excuteQuery(sql);
        }
       // public DataSet getAllBooksDetail()
      //  {
      //      string sql = "SELECT Books.Name, Books.Auther, Books.Price, Books.Image, Books.Description, Type.Name FROM Books INNER JOIN Type ON Books.Type = Type.ID";
     //       return dal.excuteQuery(sql);  
      //  }
        public DataSet getAllBooksDetail1() // שאילתה שמביאה את כל נתוני הספרים כולל נתונים שחשופים רק למנהל
        {
            string sql = "SELECT Books.Name, Books.Auther, Books.Price, Books.Image1, Books.Stock, Books.NumSold, Type.Name, Books.ID FROM Books INNER JOIN Type ON Books.Type = Type.ID";
            return dal.excuteQuery(sql);  
        }
        public void updateProd(double price, int stock, int ID) // שאילתת עדכון מחיר
        {
            string sql = "UPDATE Books SET Price="+price+", Stock="+stock +" WHERE ID="+ID;
            dal.excuteQuery(sql);
        }
       public void addNewBook(string name, string auther, int type, double price, string description, string stock, string image)// הוספת ספר
       {
           // DataSet ds1= this.getTypeID(type);
        
            string sql = "INSERT INTO Books (Name, Auther, Price, Image1, Type, Description, Stock, NumSold) VALUES " + "('" + name+ "', '" +auther+ "', " +price+ ", '" +image+ "', "+type+ ", '" +description+ "', " +stock+ ", 0)";
           dal.excuteQuery(sql);
        } 
        public DataSet getType() // שאילתה שמחזירה את טבלת type
        {
            string sql = "SELECT ID, Name FROM Type";
            return dal.excuteQuery(sql);

        }
        public bool checkExistBook(string name, string auther)// מחזיר אם קיים ספר כזה במערכת true
        {
            string sql = "SELECT Name, Auther FROM Books WHERE Name= '" + name + "' AND Auther='" +auther + "'";
            DataSet ds = dal.excuteQuery(sql);
            return ds.Tables[0].Rows.Count != 0;
        }
        public void updateStock(int ID) // ספר אינו נחמק אלא אין אפשרות לקנות אותו יותר
        {
            string sql = "UPDATE Books SET Stock=0 WHERE ID=" + ID;
            dal.excuteQuery(sql);
        }
        public void updateStock1(int ID, int numsold) // ספר נמכר
        {
            string sql = "UPDATE Books SET Stock=Stock-"+numsold+" WHERE ID=" + ID;// לא יודעת איך להפחית את המערך הקיים פחות המשתנה
            dal.excuteQuery(sql);
        }
    }
}