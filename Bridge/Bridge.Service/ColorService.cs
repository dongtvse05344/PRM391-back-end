using Bridge.Data.Infrastructure;
using Bridge.Data.Repositories;
using Bridge.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bridge.Service
{
    
    public interface IColorService
    {
        IQueryable<Color> GetColors();
        Color GetColor(long id);
        void SaveChanges();
    }
    public class ColorService : IColorService
    {
        private readonly IColorRepository _repository;
        private readonly IUnitOfWork _unitOfWork;

        public ColorService(IColorRepository repository, IUnitOfWork unitOfWork)
        {
            _repository = repository;
            _unitOfWork = unitOfWork;
        }

        public IQueryable<Color> GetColors()
        {
            return _repository.GetAll();
        }

        public Color GetColor(long id)
        {
            return _repository.GetById(id);
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }
    }
}
