using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Bridge.Model
{
    public class ProductColor
    {
        public long ProductId { get; set; }
        public long ColorId { get; set; }
        [ForeignKey("ProductId")]
        public virtual Product Product { get; set; }
        [ForeignKey("ColorId")]
        public virtual Color Color { get; set; }
    }
}
