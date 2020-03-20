using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Bridge.Model;
using Bridge.Service;
using Bridge.Util;
using Bridge.ViewModels;
using Mapster;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Bridge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CollectionController : ControllerBase
    {
        private readonly ICollectionService _collectionService;

        public CollectionController(ICollectionService collectionService)
        {
            _collectionService = collectionService;
        }

        [HttpGet]
        public ActionResult GetCollections()
        {
            var result = _collectionService.GetCollections()
                                .Where(_=>_.EndDate.Date >= DateTime.Now.Date)
                                .Select(_ => _.Adapt<CollectionVM>()).ToList();
            foreach (var item in result)
            {
                item.IsCurrent = item.StartDate.Date <= DateTime.Now.Date;
            }
            return Ok(result);
        }

        [HttpPost("Admin")]
        public ActionResult CreateConllections(CollectionCM model)
        {
            var collection = model.Adapt<Collection>();
            _collectionService.CreateCollection(collection);
            _collectionService.SaveChanges();
            return Ok();
        }

        [HttpPost("Admin/Products")]
        public ActionResult CreateConllections(CollectionProductCM model)
        {
            var collection = _collectionService.GetCollection(model.Id);
            if (collection == null) return BadRequest();
            if (collection.CollectionProducts == null) collection.CollectionProducts = new List<CollectionProduct>();
            foreach (var productId in model.ProductIds)
            {
                collection.CollectionProducts.Add(new CollectionProduct
                {
                    CollectionId = collection.Id,
                    ProductId = productId
                }) ;
            }
            _collectionService.SaveChanges();
            return Ok();
        }

        [HttpGet("{id}/Product")]
        public ActionResult GetProducts(long id)
        {
            Collection collection = _collectionService.GetCollection(id);
            if (collection == null) return NotFound();
            var products = collection.CollectionProducts.Select(_ => _.Product)
                .Where(p => p.DateSale <= DateTime.Now && p.Status == (int)ProductStatus.available);
            List<ProductVM> result = new List<ProductVM>();
            foreach (var product in products)
            {
                ProductVM item = product.Adapt<ProductVM>();
                item.Description = "";
                item.BannerPath = product.Images.FirstOrDefault(p => p.IsHighLight).FilePath;
                item.Star = 4.6;
                result.Add(item);
            }
            return Ok(result);
        }
    }
}