using Bridge.Data.Infrastructure;
using Bridge.Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bridge.Data.Repositories
{
    
    public interface ICollectionRepository : IRepository<Collection>
    {

    }
    public class CollectionRepository : RepositoryBase<Collection>, ICollectionRepository
    {
        public CollectionRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}
