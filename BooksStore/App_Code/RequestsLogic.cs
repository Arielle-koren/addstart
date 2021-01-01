using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BooksStore.App_Code
{
    public class RequestsLogic
    {
        DAL dal = new DAL();
        public void addNewRequest(string name, string email, string content)// יצירת שם משתמש
        {
            string sql = "INSERT INTO Requests (Name, Email, Content, Date1, Done) VALUES ('" + name + "', '" + email + "', '" + content + "',#" + DateTime.Today + "# , No)";
            dal.excuteQuery(sql);
        }
        public DataSet getAllRequests()// שאילתה שמחזירה את כל הבקשות
        {
            string sql = "SELECT TOP 8 ID, Name, Email, Date1, Content, Done FROM Requests ORDER BY Date1 DESC";
            return dal.excuteQuery(sql);
        }
        public DataSet getRequests()// שאילתה שמחזירה את הבקשות שלא נענו
        {
            string sql = "SELECT TOP 8 ID, Name, Email, Date1, Content, Done FROM Requests WHERE Done=False ORDER BY Date1 DESC";
            return dal.excuteQuery(sql);
        }
        public void changeToDone(int id)
        {
            string sql = "UPDATE Requests SET Done= True WHERE ID=" + id;
            dal.excuteQuery(sql);
        }
        public void changeToNotDone(int id)
        {
            string sql = "UPDATE Requests SET Done= False WHERE ID=" + id;
            dal.excuteQuery(sql);
        }
        public DataSet getDoneRequests()// שאילתה שמחזירה את הבקשות שנענו
        {
            string sql = "SELECT TOP 8 ID, Name, Email, Date1, Content, Done FROM Requests WHERE Done= Yes ORDER BY Date1 DESC";
            return dal.excuteQuery(sql);
        }
        public DataSet getDone(int id)// שאילתה שמחזירה את הבקשות שנענו
        {
            string sql = "SELECT Done FROM Requests WHERE ID="+id;
            return dal.excuteQuery(sql);
        }
    }

}
