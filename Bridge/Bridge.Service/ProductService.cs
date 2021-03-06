﻿using Bridge.Data.Infrastructure;
using Bridge.Data.Repositories;
using Bridge.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Bridge.Service
{
    public interface IProductService
    {
        IQueryable<Product> GetProducts();
        Product GetProduct(long id);
        void CreateProduct(Product product);
        void DeleteProduct(Product product);
        void SaveChanges();
    }
    public class ProductService : IProductService
    {
        private readonly IProductRepository _repository;
        private readonly IUnitOfWork _unitOfWork;

        public ProductService(IProductRepository repository, IUnitOfWork unitOfWork)
        {
            _repository = repository;
            _unitOfWork = unitOfWork;
        }

        public void CreateProduct(Product product)
        {
            _repository.Add(product);
        }

        public void DeleteProduct(Product product)
        {
            _repository.Delete(product);
        }

        public Product GetProduct(long id)
        {
            return _repository.GetById(id);
        }

        public IQueryable<Product> GetProducts()
        {
            return _repository.GetAll();
        }

        public void SaveChanges()
        {
            _unitOfWork.Commit();
        }
    }
}
