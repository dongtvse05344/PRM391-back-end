using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Bridge.Model
{
    public class Smell
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
        public String Name { get; set; }
        public int R { get; set; }
        public int G { get; set; }
        public int B { get; set; }
        public int O { get; set; }
        public virtual ICollection<ProductSmell> ProductSmells { get; set; }
    }
}
