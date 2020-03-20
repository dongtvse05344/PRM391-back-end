using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Bridge.ViewModels
{
    public class RegisterViewModel
    {
        public String Email { get; set; }
        public String Password { get; set; }
        public String UserName { get; set; }
        public String FullName { get; set; }
        public String PhoneNumber { get; set; }
    }

    public class Token
    {
        public string[] roles { get; set; }
        public string fullname { get; set; }
        public string access_token { get; set; }
        public int expires_in { get; set; }
    }

    public class LoginVM
    {
        [Required]
        public string Username { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }
        public String DeviceId { get; set; }
    }

    public class GoogleVM
    {
        public string Uid { get; set; }
        public string UserName { get; set; }
        public String Email { get; set; }
        public String FullName { get; set; }
        public String PhoneNumber { get; set; }
        public String DeviceId { get; set; }

    }

    public class UserVM
    {
        public String FullName { get; set; }
        public String Email { get; set; }
        public String HomeAddress { get; set; }
        public String CompanyAddress { get; set; }
    }
}
