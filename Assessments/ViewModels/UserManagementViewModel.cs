using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Assessments.ViewModels.UserManagementViewModels
{
    public class UserListItem
    {
        public int ID { get; set; }
        [Display(Name = "First Name")]
        public string FirstName { get; set; }
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
        public string Email { get; set; }
        public bool IsAdmin { get; set; }
        public bool ActiveUser { get; set; }
    }

    public class UserManagementViewModel
    {
        public UserManagementViewModel()
        {
            Users = new List<UserListItem>();
        }
        public List<UserListItem> Users { get; set; }
        public UserListItem User { get; set; }
    }
}