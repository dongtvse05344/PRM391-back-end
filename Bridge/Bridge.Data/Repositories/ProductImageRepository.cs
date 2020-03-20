using Bridge.Data.Infrastructure;
using Bridge.Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bridge.Data.Repositories
{
   
    public interface IProductImageRepository : IRepository<ProductImage>
    {

    }
    public class ProductImageRepository : RepositoryBase<ProductImage>, IProductImageRepository
    {
        public ProductImageRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}
