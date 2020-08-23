using Bridge.Data.Infrastructure;
using Bridge.Model;

namespace Bridge.Data.Repositories
{
  

    public interface IGenderRepository : IRepository<Gender>
    {

    }
    public class GenderRepository : RepositoryBase<Gender>, IGenderRepository
    {
        public GenderRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}
