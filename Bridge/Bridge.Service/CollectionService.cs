using Bridge.Data.Infrastructure;
using Bridge.Data.Repositories;
using Bridge.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bridge.Service
{
    public interface ICollectionService
    {
        IQueryable<Collection> GetCollections();
        Collection GetCollection(long id);
        void CreateCollection(Collection collection);
        void SaveChanges();
    }
    public class CollectionService : ICollectionService
    {
        private readonly ICollectionRepository _repository;
        private readonly IUnitOfWork _unitOfWork;

        public CollectionService(ICollectionRepository repository, IUnitOfWork unitOfWork)
        {
            _repository = repository;
            _unitOfWork = unitOfWork;
        }

        public void CreateCollection(Collection collection)
        {
            _repository.Add(collection);
        }

        public Collection GetCollection(long id)
        {
            return _repository.GetById(id);
        }

        public IQueryable<Collection> GetCollections()
        {
            return _repository.GetAll();
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }
    }
}
