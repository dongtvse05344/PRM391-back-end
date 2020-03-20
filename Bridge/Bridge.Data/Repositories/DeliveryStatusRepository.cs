using Bridge.Data.Infrastructure;
using Bridge.Model;

namespace Bridge.Data.Repositories
{
  
    public interface IDeliveryStatusRepository : IRepository<DeliveryStatus>
    {

    }
    public class DeliveryStatusRepository : RepositoryBase<DeliveryStatus>, IDeliveryStatusRepository
    {
        public DeliveryStatusRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}
