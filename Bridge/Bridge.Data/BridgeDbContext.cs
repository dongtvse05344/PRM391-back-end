using Bridge.Model;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bridge.Data
{
    public class BridgeDbContext : IdentityDbContext<MyUser>
    {
        public BridgeDbContext() : base((new DbContextOptionsBuilder())
            .UseLazyLoadingProxies()
            //.UseSqlServer(@"Server=.;Database=Bridge;user id=sa;password=;Trusted_Connection=True;Integrated Security=false;")
            .UseSqlServer(@"Server=tcp:dongtv.database.windows.net;Database=Bridge;user id=dongtv;password=zaq@123123;Trusted_Connection=True;Integrated Security=false;")
            .Options)
        {

        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<SubCategory> SubCategories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<ProductImage> ProductImages { get; set; }
        public DbSet<ProductSmell> ProductSmells { get; set; }

        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<OrderStatus> OrderStatuses { get; set; }
        public DbSet<DeliveryStatus> DeliveryStatuses { get; set; }
        public DbSet<UserAddress> UserAddresses { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }

        public void Commit()
        {
            base.SaveChanges();
        }
    }
}
