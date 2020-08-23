using Bridge.Data.Infrastructure;
using Bridge.Model;

namespace Bridge.Data.Repositories
{
   

    public interface ISmellRepository : IRepository<Smell>
    {

    }
    public class SmellRepository : RepositoryBase<Smell>, ISmellRepository
    {
        public SmellRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}
