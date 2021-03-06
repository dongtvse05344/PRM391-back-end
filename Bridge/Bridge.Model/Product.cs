﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Bridge.Model
{
    public class Product
    {
        public Product()
        {
            Smells = new List<ProductSmell>();
        }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        public String Name { get; set; }
        public String Description { get; set; }
        public double CurrentPrice { get; set; }
        public double OldPrice { get; set; }
        public bool IsSale { get; set; }
        public long CategoryId { get; set; }
        public int Status { get; set; }
        public long GenderId { get; set; }
        [ForeignKey("GenderId")]
        public virtual Gender Gender { get; set; }
        public DateTime DateSale { get; set; }
        [ForeignKey("CategoryId")]
        public virtual Category Category { get; set; }
        public virtual ICollection<ProductImage> Images { get; set; }
        public virtual ICollection<ProductSmell> Smells { get; set; }
        public virtual ICollection<CollectionProduct> CollectionProducts { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

    }
}
