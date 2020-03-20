using Bridge.Data.Infrastructure;
using Bridge.Data.Repositories;
using Bridge.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bridge.Service
{
    public interface ICategoryService
    {
        IQueryable<Category> GetCategories();
        Category GetCategory(long id);
        void SaveChanges();
    }
    public class CategoryService : ICategoryService
    {
        private readonly ICategoryRepository _repository;
        private readonly IUnitOfWork _unitOfWork;

        public CategoryService(ICategoryRepository repository, IUnitOfWork unitOfWork)
        {
            _repository = repository;
            _unitOfWork = unitOfWork;
        }

        public IQueryable<Category> GetCategories()
        {
            return _repository.GetAll();
        }

        public Category GetCategory(long id)
        {
            return _repository.GetById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }
    }
}
