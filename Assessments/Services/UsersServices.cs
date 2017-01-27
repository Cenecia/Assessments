using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Assessments.Models;
using Assessments.ViewModels.SetupViewModels;

namespace Assessments.Services
{
    public class UsersServices
    {
        private Entities db = new Entities();

        public void GetAllUsers()
        {

        }

        public void CreateUserDetails(string userid)
        {
            db.UserDetails.Add(new UserDetail { UserId = userid });
            db.SaveChanges();
        }
    }
}