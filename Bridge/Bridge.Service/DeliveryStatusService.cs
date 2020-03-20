using Bridge.Data.Infrastructure;
using Bridge.Data.Repositories;
using Bridge.Model;
using System;
using System.Linq;

namespace Bridge.Service
{
    public interface IDeliveryStatusService
    {
        IQueryable<DeliveryStatus> GetDeliveryStatuss();
        DeliveryStatus GetDeliveryStatus(long id);
        void CreateDeliveryStatus(DeliveryStatus DeliveryStatus);
        void UpdateDeliveryStatus(DeliveryStatus DeliveryStatus);
        void SaveChanges();
    }
    public class DeliveryStatusService : IDeliveryStatusService
    {
        private readonly IDeliveryStatusRepository _repository;
        private readonly IUnitOfWork _unitOfWork;

        public DeliveryStatusService(IDeliveryStatusRepository repository, IUnitOfWork unitOfWork)
        {
            _repository = repository;
            _unitOfWork = unitOfWork;
        }

        public void CreateDeliveryStatus(DeliveryStatus DeliveryStatus)
        {
            _repository.Add(DeliveryStatus);
        }

        public DeliveryStatus GetDeliveryStatus(long id)
        {
            return _repository.GetById(id);
        }

        public IQueryable<DeliveryStatus> GetDeliveryStatuss()
        {
            return _repository.GetAll();
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void UpdateDeliveryStatus(DeliveryStatus DeliveryStatus)
        {
            _repository.Update(DeliveryStatus);
        }
    }
}
