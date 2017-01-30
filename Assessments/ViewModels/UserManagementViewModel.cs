using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assessments.ViewModels.UserManagementViewModels
{
    public class UserListItem
    {
        public int ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public bool IsAdmin { get; set; }
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