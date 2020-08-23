﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bridge.Model
{
    public class ProductSmell
    {
        public long ProductId { get; set; }
        [ForeignKey("ProductId")]
        public virtual Product Product { get; set; }
        public long SmellId { get; set; }
        [ForeignKey("SmellId")]
        public virtual Smell Smell { get; set; }
    }
}
