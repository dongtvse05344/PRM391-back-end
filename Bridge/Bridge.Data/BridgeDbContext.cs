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
            //.UseSqlServer(@"Server=45.119.83.107;Database=Bridge;user id=sa;password=sa@123456;Trusted_Connection=True;Integrated Security=false;")
            .UseSqlServer(@"Server=tcp:dongtv.database.windows.net;Database=Bridge;user id=dongtv;password=zaq@123123;Trusted_Connection=True;Integrated Security=false;")
            .Options)
        {

        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<ProductImage> ProductImages { get; set; }
        public DbSet<Gender> Genders { get; set; }
        public DbSet<Size> Sizes { get; set; }
        public DbSet<Smell> Smells { get; set; }
        public DbSet<ProductSmell> ProductSmells { get; set; }

        public DbSet<Collection> Collections { get; set; }
        public DbSet<CollectionProduct> CollectionProducts { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<OrderStatus> OrderStatuses { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<ProductSmell>(build =>
            {
                build.HasKey(t => new { t.SmellId, t.ProductId });
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
