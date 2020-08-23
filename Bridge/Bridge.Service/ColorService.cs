using Bridge.Data.Infrastructure;
using Bridge.Data.Repositories;
using Bridge.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bridge.Service
{
    
    public interface ISmellService
    {
        IQueryable<Smell> GetSmells();
        Smell GetSmell(long id);
        void SaveChanges();
    }
    public class SmellService : ISmellService
    {
        private readonly ISmellRepository _repository;
        private readonly IUnitOfWork _unitOfWork;

        public SmellService(ISmellRepository repository, IUnitOfWork unitOfWork)
        {
            _repository = repository;
            _unitOfWork = unitOfWork;
        }

        public IQueryable<Smell> GetSmells()
        {
            return _repository.GetAll();
        }

        public Smell GetSmell(long id)
        {
            return _repository.GetById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }
    }
}
