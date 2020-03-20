using Bridge.Data.Infrastructure;
using Bridge.Data.Repositories;
using Bridge.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bridge.Service
{
    public interface IOrderStatusService
    {
        IQueryable<OrderStatus> GetOrderStatuss();
        OrderStatus GetOrderStatus(long id);
        void CreateOrderStatus(OrderStatus OrderStatus);
        void UpdateOrderStatus(OrderStatus OrderStatus);
        void SaveChanges();
    }
    public class OrderStatusService : IOrderStatusService
    {
        private readonly IOrderStatusRepository _repository;
        private readonly IUnitOfWork _unitOfWork;

        public OrderStatusService(IOrderStatusRepository repository, IUnitOfWork unitOfWork)
        {
            _repository = repository;
            _unitOfWork = unitOfWork;
        }

        public void CreateOrderStatus(OrderStatus OrderStatus)
        {
            OrderStatus.DateCreate = DateTime.Now;
            _repository.Add(OrderStatus);
        }

        public OrderStatus GetOrderStatus(long id)
        {
            return _repository.GetById(id);
        }

        public IQueryable<OrderStatus> GetOrderStatuss()
        {
            return _repository.GetAll();
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }

        public void UpdateOrderStatus(OrderStatus OrderStatus)
        {
            _repository.Update(OrderStatus);
        }
    }
}
