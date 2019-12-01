using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DbProject
{
    class Program
    {
        static void Main(string[] args)
        {
          
            using (var context = new DeliveryAppEntities())
            {
                var user = (from c in context.users
                            where c.username == "admin" && c.password == "fkn"
                            select c
                            );
                bool ok =  user.Any() ? true : false;
            }
        }
    }
}
