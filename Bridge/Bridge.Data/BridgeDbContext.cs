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
            //.UseSqlServer(@"Server=localhost;Database=Bridge;user id=sa;password=1234;Trusted_Connection=True;Integrated Security=false;")
            .UseSqlServer(@"Server=34.64.186.174;Database=Bridge;user id=sqlserver;password=1234;Trusted_Connection=True;Integrated Security=false;")
            //.UseSqlServer(@"Server=tcp:dongtv.database.windows.net;Database=Bridge;user id=dongtv;password=zaq@123123;Trusted_Connection=True;Integrated Security=false;")
            .Options)
        {

        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<ProductImage> ProductImages { get; set; }
        public DbSet<Gender> Genders { get; set; }
        public DbSet<Size> Sizes { get; set; }
        public DbSet<Smell> Smell { get; set; }
        public DbSet<ProductSmell> ProductSmells { get; set; }

        public DbSet<Collection> Collections { get; set; }
        public DbSet<CollectionProduct> CollectionProducts { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<OrderStatus> OrderStatuses { get; set; }
        public DbSet<DeliveryStatus> DeliveryStatuses { get; set; }
        public DbSet<UserAddress> UserAddresses { get; set; }

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
            AutoAddData(builder);
        }

        private void AutoAddData(ModelBuilder builder)
        {
            builder.Entity<Category>().HasData(
                new Category
                {
                    Id = 1,
                    Name = "Giảm Mỡ",
                    Logo = "files/images/categories/giam-mo.png"
                }, 
                new Category
                {
                    Id = 2,
                    Name = "Phục hồi",
                    Logo = "files/images/categories/phuc-hoi.png"
                }, 
                new Category
                {
                    Id = 3,
                    Name = "Sinh lý",
                    Logo = "files/images/categories/sinh-ly.png"
                }, 
                new Category
                {
                    Id = 4,
                    Name = "Tăng cân & cơ",
                    Logo = "files/images/categories/tang-can-co.png"
                }, 
                new Category
                {
                    Id = 5,
                    Name = "Tăng cơ",
                    Logo = "files/images/categories/tang-co.png"
                }, 
                new Category
                {
                    Id = 6,
                    Name = "Tăng sức",
                    Logo = "files/images/categories/tang-suc.png"
                }
                );
            builder.Entity<DeliveryStatus>().HasData(
                new DeliveryStatus
                {
                    Id = 1,
                    Name = "Bridge Shop has received the order",
                    Priority = 0
                }, 
                new DeliveryStatus
                {
                    Id = 2,
                    Name = "This products is ready to ship",
                    Priority = 5
                }, 
                new DeliveryStatus
                {
                    Id = 3,
                    Name = "The shipper has taken from the repositories",
                    Priority = 5
                }, 
                new DeliveryStatus
                {
                    Id = 4,
                    Name = "The shipper is on his way to you",
                    Priority = 5
                }, 
                new DeliveryStatus
                {
                    Id = 5,
                    Name = "Delivery successful",
                    Priority = 10
                }, 
                new DeliveryStatus
                {
                    Id = 7,
                    Name = "This order has been cancel by Bridge Shop! Sorry about this case.",
                    Priority = -10
                }, 
                new DeliveryStatus
                {
                    Id = 8,
                    Name = "The shipper is busy now",
                    Priority = -5
                }, 
                new DeliveryStatus
                {
                    Id = 9,
                    Name = "This products are out of stock",
                    Priority = -10
                }, 
                new DeliveryStatus
                {
                    Id = 10,
                    Name = "This order has been cancel by customer",
                    Priority = -10
                }
            );
            builder.Entity<Gender>().HasData(
                new Gender
                {
                    Id = 1,
                    Name = "Male"
                },
                new Gender
                {
                    Id = 2,
                    Name = "FeMale"
                }
                );
            builder.Entity<Size>().HasData(
                new Size
                {
                    Id = 1,
                    Name = "Lbs5",
                    GenderId = 1,
                },
                new Size
                {
                    Id = 2,
                    Name = "Lbs10",
                    GenderId = 1,
                },
                new Size
                {
                    Id = 3,
                    Name = "Lbs3",
                    GenderId = 2,
                },
                new Size
                {
                    Id = 4,
                    Name = "Lbs6.6",
                    GenderId = 2,
                }
                );
            builder.Entity<Smell>().HasData(
                new Smell
                {
                    Id = 1,
                    R = 80,
                    G = 63,
                    B = 70,
                    O = 1,
                    Name = "Chocolate Fudge"
                },
                new Smell
                {
                    Id = 2,
                    R = 80,
                    G = 63,
                    B = 70,
                    O = 1,
                    Name = "Vanilla"
                },
                new Smell
                {
                    Id = 3,
                    R = 80,
                    G = 63,
                    B = 70,
                    O = 1,
                    Name = "Chocolate Peanut Butter"
                },
                new Smell
                {
                    Id = 4,
                    R = 80,
                    G = 63,
                    B = 70,
                    O = 1,
                    Name = "Cookies & Crème"
                },
                new Smell
                {
                    Id = 5,
                    R = 80,
                    G = 63,
                    B = 70,
                    O = 1,
                    Name = "Strawberry Milkshake"
                },
                new Smell
                {
                    Id = 6,
                    R = 80,
                    G = 63,
                    B = 70,
                    O = 1,
                    Name = "Cafe Mocha"
                },
                new Smell
                {
                    Id = 7,
                    R = 80,
                    G = 63,
                    B = 70,
                    O = 1,
                    Name = "Frozen Banana"
                }
                );
        }
        public void Commit()
        {
            base.SaveChanges();
        }

    }
}
