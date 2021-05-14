 using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BooksStore.App_Code
{
    public class UsersLogic
    {
        DAL dal = new DAL();

        public bool checkExistEmail(string email) // בודקת האם קיים אימייל כזה, אם כן מחזירה true 
        {
            string sql = string.Format("SELECT Email FROM Users WHERE Email='{0}'" ,email);
            DataSet ds=dal.excuteQuery(sql);
            return ds.Tables[0].Rows.Count != 0;
        }

        public bool checkExistUser(string email, string password1) // בודקת האם קיים אימייל כזה והאם זאת הסיסמא של המשתמש עם אימייל זה- התחברות
        {
            string sql = "SELECT Pass FROM Users WHERE Email='" + email + "'";
            DataSet ds = dal.excuteQuery(sql);
            if (ds.Tables[0].Rows.Count != 0) //  יש אימייל כזה במערכת
                return ds.Tables[0].Rows[0]["Pass"].ToString().Equals(password1);
                   
            else
                return false;
        }
        
        public void addNewUser (string name, string lastName, string email, string date, string password)// יצירת שם משתמש
        {
            string sql = "INSERT INTO Users (Name, LastName, Email, Birthday, Pass, IsManager) VALUES ('"+ name+"', '"+lastName+"', '"+ email+"', #"+date+"#, '"+password+"', False)";
            dal.excuteQuery(sql);
            
        }

        public void addNewManager(string name, string lastName, string email, string date, string password)// הוספת מנהל
        {
            string sql = "INSERT INTO Users (Name, LastName, Email, Birthday, Pass, IsManager) VALUES ('" + name + "', '" + lastName + "', '" + email + "', #" + date + "#, '" + password + "', True)";
            dal.excuteQuery(sql);
        }

        public DataSet getName(string email)//מביאה את השם של המשתמש שזה האימייל שלו
        {
            string sql= "SELECT Name FROM Users WHERE Email='" + email+"'";
            return dal.excuteQuery(sql);
        }

        public DataSet getName1(int id)//מביאה את השם של המשתמש שזה הid שלו
        {
            string sql = "SELECT Name FROM Users WHERE ID=" + id;
            return dal.excuteQuery(sql);
        }

        public DataSet getID(string email)//מביאה את השם של המשתמש שזה האימייל שלו
        {
            string sql = "SELECT ID FROM Users WHERE Email='" + email + "'";
            return dal.excuteQuery(sql);
        }

        public bool getIsManager(string email)//בודקת האם משתמש עם אימייל זה מנהל או לא
        {
            String sql = "SELECT IsManager FROM Users WHERE Email='" + email+"'";
            DataSet ds = dal.excuteQuery(sql);
           return ds.Tables[0].Rows[0]["IsManager"].ToString().Equals("True");
         
        }

        public DataSet getUsers()// מחזירה את כל המשתמשים ונתוניהם
        {
            string sql = "SELECT Users.ID, Users.Name+' '+ Users.LastName AS Name, Users.Email, Users.Birthday, Users.Pass, Count(Orders.ID) AS Total FROM USERS LEFT JOIN Orders ON Orders.UsersID=Users.ID WHERE Users.IsManager= False GROUP BY  Users.ID, Users.Name, Users.LastName, Users.Birthday, Users.Email, Users.Pass";
            return dal.excuteQuery(sql);
        }
        
        
    }
}