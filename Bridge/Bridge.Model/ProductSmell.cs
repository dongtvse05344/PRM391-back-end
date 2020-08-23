using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Bridge.Model
{
    public class ProductSmell
    {
        public long ProductId { get; set; }
        public long SmellId { get; set; }
        [ForeignKey("ProductId")]
        public virtual Product Product { get; set; }
        [ForeignKey("SmellId")]
        public virtual Smell Smell { get; set; }
    }
}
