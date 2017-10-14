using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Assessments.ViewModels.UserManagementViewModels;
using Assessments.Services;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Assessments.Controllers
{
    //[Authorize(Roles = "Admin")]
    //[Authorize(Roles = "ActiveUser")]
    public class ManageUsersController : BaseController
    {
        private UsersServices usersServices = new UsersServices();

        // GET: ManageUsers
        public ActionResult Index()
        {
            var ViewModel = new UserManagementViewModel
            {
                Users = usersServices.GetAllUsers()
            };

            return View(ViewModel);
        }

        [HttpPost]
        public void PromoteToAdmin(UserManagementViewModel ViewModel)
        {
            usersServices.PromoteUser(ViewModel.User.ID);
        }

        [HttpPost]
        public void DemoteUser(UserManagementViewModel ViewModel)
        {
            usersServices.DemoteUser(ViewModel.User.ID);
        }

        [HttpPost]
        public void ActivateUser(UserManagementViewModel ViewModel)
        {
            usersServices.ActivateUser(ViewModel.User.ID);
        }

        [HttpPost]
        public void DeactivateUser(UserManagementViewModel ViewModel)
        {
            usersServices.DeactivateUser(ViewModel.User.ID);
        }

        [HttpPost]
        public ActionResult EditUserDetails(UserManagementViewModel ViewModel)
        {
            usersServices.EditUserDetails(ViewModel.User.ID, ViewModel.User.FirstName, ViewModel.User.LastName);
            return RedirectToAction("Index");
        }


    }
}