using Bridge.Data.Infrastructure;
using Bridge.Model;

namespace Bridge.Data.Repositories
{
   

    public interface IColorRepository : IRepository<Color>
    {

    }
    public class ColorRepository : RepositoryBase<Color>, IColorRepository
    {
        public ColorRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}
