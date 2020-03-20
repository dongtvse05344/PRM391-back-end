using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bridge.Model
{
    public class MyUser : IdentityUser
    {
        public String FullName { get; set; }
        public String HomeAddress { get; set; }
        public String CompanyAddress { get; set; }
        public String DeviceId { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<UserAddress> Addresses { get; set; }
    }
}
