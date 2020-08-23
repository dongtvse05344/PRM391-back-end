using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Bridge.Model
{
    public class CollectionProduct
    {
        public long ProductId { get; set; }
        [ForeignKey("ProductId")]
        public virtual Product Product { get; set; }
        public long CollectionId { get; set; }
        [ForeignKey("CollectionId")]
        public virtual Collection Collection { get; set; }
    }
}
