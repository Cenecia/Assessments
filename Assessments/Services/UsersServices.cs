using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Assessments.Models;
using Assessments.ViewModels.UserManagementViewModels;
using Assessments.ViewModels.SetupViewModels;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;

namespace Assessments.Services
{


    public class UsersServices
    {
        private Entities db = new Entities();

        public List<UserListItem> GetAllUsers()
        {
            return db.UserDetails.Select(o =>
                new UserListItem
                {
                    ID = o.ID,
                    FirstName = o.FirstName,
                    LastName = o.LastName,
                    Email = o.AspNetUser.Email,
                    IsAdmin = o.AspNetUser.AspNetRoles.Any(x => x.Name == "Admin")
                }
            ).ToList();
        }

        public void CreateUserDetails(string userid)
        {
            db.UserDetails.Add(new UserDetail { UserId = userid });

            db.SaveChanges();
        }

        public string GetUserId(int id)
        {
            return db.UserDetails.Single(o => o.ID == id).UserId;
        }

        public void PromoteUser(int userid)
        {
            var aspnetuserid = db.UserDetails.Single(o => o.ID == userid).AspNetUser.Email;
            setRoles(new List<KeyValuePair<string, string>> { new KeyValuePair<string, string>(aspnetuserid, "Admin") });

        }

        public void DemoteUser(int userid)
        {
            var aspnetuserid = db.UserDetails.Single(o => o.ID == userid).AspNetUser.Email;
            removeRoles(new List<KeyValuePair<string, string>> { new KeyValuePair<string, string>(aspnetuserid, "Admin") });
        }

        private void setRoles(List<KeyValuePair<string, string>> userRoles)
        {
            using (var rm = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext())))
            {
                using (var um = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext())))
                {
                    foreach (var item in userRoles)
                    {
                        if (!rm.RoleExists(item.Value))
                        {
                            var roleResult = rm.Create(new IdentityRole(item.Value));
                            if (!roleResult.Succeeded)
                                throw new ApplicationException("Creating role " + item.Value + "failed with error(s): " + roleResult.Errors);
                        }

                        var user = um.FindByName(item.Key);
                        if (!um.IsInRole(user.Id, item.Value))
                        {
                            var userResult = um.AddToRole(user.Id, item.Value);
                            if (!userResult.Succeeded)
                                throw new ApplicationException("Adding user '" + item.Key + "' to '" + item.Value + "' role failed with error(s): " + userResult.Errors);
                        }
                    }
                }
            }
        }

        private void removeRoles(List<KeyValuePair<string, string>> userRoles)
        {
            using (var rm = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext())))
            {
                using (var um = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext())))
                {
                    foreach (var item in userRoles)
                    {
                        if (!rm.RoleExists(item.Value))
                        {
                            throw new ApplicationException("This role does not exist.");
                        }

                        var user = um.FindByName(item.Key);
                        if (um.IsInRole(user.Id, item.Value))
                        {
                            var userResult = um.RemoveFromRole(user.Id, item.Value);
                            if (!userResult.Succeeded)
                                throw new ApplicationException("Removing user '" + item.Key + "' to '" + item.Value + "' role failed with error(s): " + userResult.Errors);
                        }
                    }
                }
            }
        }
    }
}