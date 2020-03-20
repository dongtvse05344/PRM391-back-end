using Bridge.Data.Infrastructure;
using Bridge.Data.Repositories;
using Bridge.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bridge.Service
{
    public interface IGenderService
    {
        IQueryable<Gender> GetGenders();
        Gender GetGender(long id);
        void SaveChanges();
    }
    public class GenderService : IGenderService
    {
        private readonly IGenderRepository _repository;
        private readonly IUnitOfWork _unitOfWork;

        public GenderService(IGenderRepository repository, IUnitOfWork unitOfWork)
        {
            _repository = repository;
            _unitOfWork = unitOfWork;
        }

        public IQueryable<Gender> GetGenders()
        {
            return _repository.GetAll();
        }

        public Gender GetGender(long id)
        {
            return _repository.GetById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }
    }
}
