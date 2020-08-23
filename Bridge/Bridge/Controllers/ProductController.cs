using Bridge.Model;
using Bridge.Service;
using Bridge.ViewModels;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Bridge.Util;
namespace Bridge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductService _productService;
        private readonly IOrderDetailService _orderDetailService;

        public ProductController(IProductService productService, IOrderDetailService orderDetailService)
        {
            _productService = productService;
            _orderDetailService = orderDetailService;
        }

        [HttpGet("New")]
        public ActionResult GetNewBrand()
        {
            var productNewBard = _productService.GetProducts()
                    .Where(p => p.DateSale <= DateTime.Now && p.Status ==(int)ProductStatus.available)
                    .OrderByDescending(p => p.DateSale).Take(5);
            List<ProductVM> result = new List<ProductVM>();
            foreach(var product in productNewBard)
            {
                ProductVM item = product.Adapt<ProductVM>();
                item.Description = "";
                item.BannerPath = product.Images.FirstOrDefault(p => p.IsHighLight).FilePath;
                float? star = product.OrderDetails.Sum(_ => _.Star);
                if (star != null && star > 0)
                {
                    item.Star = star.Value / product.OrderDetails.Count;
                }
                else
                {
                    item.Star = 5.0;
                }
                result.Add(item);
            }
            return Ok(result);
        }

        [HttpGet()]
        public ActionResult Gets(String name)
        {
            name = name == null ? "" : name;
            var products = _productService.GetProducts()
                    .Where(p => p.DateSale <= DateTime.Now
                                && p.Status == (int)ProductStatus.available
                                && p.Name.ToLower().Contains(name.ToLower())
                                )
                    .OrderByDescending(p => p.DateSale);
            List<ProductVM> result = new List<ProductVM>();
            foreach (var product in products)
            {
                ProductVM item = product.Adapt<ProductVM>();
                item.Description = "";
                item.BannerPath = product.Images.FirstOrDefault(p => p.IsHighLight).FilePath;
                float? star = product.OrderDetails.Sum(_ => _.Star);
                if (star != null && star > 0)
                {
                    item.Star = star.Value / product.OrderDetails.Count;
                }
                else
                {
                    item.Star = 5.0;
                }
                result.Add(item);
            }
            return Ok(result);
        }


        /// <summary>
        /// Admin
        /// </summary>
        [HttpGet("Admin")]
        public ActionResult AdminGets()
        {
            var products = _productService.GetProducts().OrderByDescending(p => p.DateSale);
            List<ProductVM> result = new List<ProductVM>();
            foreach (var product in products)
            {
                ProductVM item = product.Adapt<ProductVM>();
                item.BannerPath = product.Images.FirstOrDefault(p => p.IsHighLight).FilePath;
                float? star = product.OrderDetails.Sum(_ => _.Star);
                if(star != null && star > 0)
                {
                    item.Star = star.Value / product.OrderDetails.Count;
                }
                else
                {
                    item.Star = 5.0;
                }
                result.Add(item);
            }
            return Ok(result);
        }

        [HttpPost("Admin")]
        public ActionResult AdminPost(ProductCM model)
        {
            var product = model.Adapt<Product>();
            product.Status = (int)ProductStatus.available;
            foreach (var smell in model.SmellIds)
            {
                product.Smells.Add(new ProductSmell { 
                    ProductId = product.Id,
                    SmellId = smell
                });
            }
            _productService.CreateProduct(product);
            _productService.SaveChanges();
            return StatusCode(201, new
            {
                Id =  product.Id
            }) ;
        }

        [HttpPut("Admin")]
        public ActionResult AdminPut(ProductUM model)
        {
            var product = _productService.GetProduct(model.Id);
            if (product == null) return NotFound();
            product = model.Adapt(product);
            product.Smells = new List<ProductSmell>();
            product.Smells.Clear();
            foreach (var smell in model.SmellIds)
            {
                product.Smells.Add(new ProductSmell
                {
                    ProductId = product.Id,
                    SmellId = smell
                });
            }
            _productService.SaveChanges();
            return StatusCode(201, new
            {
                Id = product.Id
            });
        }


        [HttpGet("{id}")]
        public ActionResult GetById(long id)
        {
            var product = _productService.GetProduct(id);
            if (product == null) return NotFound();
            ProductVM result = product.Adapt<ProductVM>();
            result.BannerPath = product.Images.FirstOrDefault(p => p.IsHighLight).FilePath;
            float? star = product.OrderDetails.Sum(_ => _.Star);
            if (star != null && star > 0)
            {
                result.Star = star.Value / product.OrderDetails.Count;
            }
            else
            {
                result.Star = 5.0;
            }
            return Ok(result);
        }

        [HttpGet("{id}/Image")]
        public ActionResult GetImages(long id)
        {
            var product = _productService.GetProduct(id);
            if (product == null) return NotFound();
            List<String> result = product.Images
                                          .OrderBy(_ => _.Order)
                                          .Select(_ => _.FilePath)
                                          .ToList();
            return Ok(result);
        }

        [HttpGet("{id}/Size")]
        public ActionResult GetSizes(long id)
        {
            var product = _productService.GetProduct(id);
            if (product == null) return NotFound();
            List<String> result = product.Gender.Sizes
                                          .Select(_ => _.Name)
                                          .ToList();
            return Ok(result);
        }

        [HttpGet("{id}/Smell")]
        public ActionResult GetSmells(long id)
        {
            var product = _productService.GetProduct(id);
            if (product == null) return NotFound();
            List<SmellVM> result = product.Smells
                                          .Select(_ => _.Smell)
                                          .Select(_ => _.Adapt<SmellVM>())
                                          .ToList();
            return Ok(result);
        }

        [HttpGet("{id}/Rate")]
        public ActionResult GetRates(long id)
        {
            var product = _productService.GetProduct(id);
            if (product == null) return NotFound();
            List<ProductRatingVM> result = new List<ProductRatingVM>();
            foreach (var orderDetail in product.OrderDetails)
            {
                if(orderDetail.Star != null)
                {
                    ProductRatingVM item = orderDetail.Adapt<ProductRatingVM>();
                    item.Rate = orderDetail.Star.Value;
                    item.FullName = orderDetail.Order.MyUser.FullName;
                    result.Add(item);
                }
            }
            if(result.Count >0)
            {
                var rate = result.Sum(_ => _.Rate) / result.Count;
                var votes = result.Count;
                result.Add(new ProductRatingVM { Rate = rate, Comment = votes +" votes" }) ; 
            }
            return Ok(result);
        }

        [HttpPut("Rating")]
        public ActionResult UpdateRatings(ProductRatingCM model)
        {
            OrderDetail orderDetail = _orderDetailService.GetOrderDetail(model.OrderDetailId);
            if (orderDetail == null) return NotFound();
            if (orderDetail.Order.CurrentStatus != (int)OrderCurrentStatus.done 
                || orderDetail.Comment != null 
                || model.Rate > 5 
                || model.Rate < 0)
            {
                return BadRequest();
            }
            orderDetail.Star = model.Rate;
            orderDetail.Comment = model.Comment;
            _orderDetailService.SaveChanges();
            return Ok();
        }

    }
}
