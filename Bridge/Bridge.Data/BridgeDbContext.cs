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
            .UseSqlServer(@"Server=45.119.83.107;Database=Bridge;user id=sa;password=sa@123456;Trusted_Connection=True;Integrated Security=false;")
            .Options)
        {
            
        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<ProductImage> ProductImages { get; set; }
        public DbSet<Gender> Genders { get; set; }
        public DbSet<Size> Sizes { get; set; }
        public DbSet<Color> Colors { get; set; }
        public DbSet<ProductColor> ProductColors { get; set; }

        public DbSet<Collection> Collections { get; set; }
        public DbSet<CollectionProduct> CollectionProducts { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<OrderStatus> OrderStatuses { get; set; }
        public DbSet<DeliveryStatus> DeliveryStatuses { get; set; }
        public DbSet<UserAddress> UserAddresses { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<ProductColor>(build =>
            {
                build.HasKey(t => new { t.ColorId, t.ProductId });
            });
            builder.Entity<CollectionProduct>(build =>
            {
                build.HasKey(t => new { t.ProductId, t.CollectionId });
            });
            base.OnModelCreating(builder);
        }

            public void Commit()
        {
            base.SaveChanges();
        }
    }
}
