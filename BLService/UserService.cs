using DbProject;
using DeliveryModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLService
{
    public class UserService
    {
        public void SignUp(UserModel userData)
        {
            using (var context = new DeliveryAppEntities())
            {
                var user = new users
                {
                    name = userData.Name,
                    surname = userData.Surname,
                    password = userData.Password,
                    username = userData.Username,
                    email = userData.Email,
                    role_id = 2
                };
                context.users.Add(user);
                context.SaveChanges();
            };
        }
    }
}
