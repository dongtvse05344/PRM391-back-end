using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Bridge.ViewModels
{
    public class CollectionVM
    {
        public long Id { get; set; }
        public String Name { get; set; }
        public DateTime StartDate { get; set; }
        public String Banner { get; set; }
        public bool IsCurrent { get; set; }
    }

    public class CollectionCM
    {
        public String Name { get; set; }
        public DateTime StartDate { get; set; }
    }

    public class CollectionProductCM
    {
        public long Id { get; set; }
        public List<long> ProductIds { get; set; }
    }
}
