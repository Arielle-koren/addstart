using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BooksStore.App_Code
{
    public class paymentsDetail
    {
        int city;
        string address;
        string phone;
        string more;

        public void addPaymentsDetail(int C, string A, string P, string M)
        {
            this.city = C;
            this.address = A;
            this.phone = P;
            this.more = M;
        }
        public int getCity()//מחזירה את העיר
        {
            return this.city;
        }
        public string getAddress()//מחזירה את הכתובת
        {
            return this.address;
        }
        public string getPhone()//מחזירה את הטלפון
        {
            return this.phone;
        }
        public string getMore()//מחזירה את הפרטים הנוספים
        {
            return this.more;
        }

    }
}