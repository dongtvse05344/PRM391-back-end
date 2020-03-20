using Bridge.Data.Infrastructure;
using Bridge.Model;

namespace Bridge.Data.Repositories
{

    public interface IOrderStatusRepository : IRepository<OrderStatus>
    {

    }
    public class OrderStatusRepository : RepositoryBase<OrderStatus>, IOrderStatusRepository
    {
        public OrderStatusRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}
