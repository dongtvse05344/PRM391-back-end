using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Bridge.Model;
using Bridge.Service;
using Bridge.Util;
using Google.Cloud.Storage.V1;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace Bridge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FileController : ControllerBase
    {
        private readonly IFileService _fileService;
        private readonly IProductService _productService;
        private readonly ICollectionService _collectionService;
        private readonly ICloudStorage _cloudStorage;

        public FileController(IFileService fileService, IProductService productService,ICollectionService collectionService, ICloudStorage cloudStorage)
        {
            _fileService = fileService;
            _productService = productService;
            _collectionService = collectionService;
            _cloudStorage = cloudStorage;
        }

        [HttpGet("Image")]
        public async Task<ActionResult> GetFileData(String imageUrl)
        {
            try
            {
                var result = await _fileService.GetFileAsync(imageUrl);
                return File(result.Stream, result.ContentType);
            }
            catch(Exception e)
            {
                return BadRequest(e.Message);
            }
           
        }

        [HttpPost("ProductImage")]
        public async Task<ActionResult> UploadProductImage([FromForm]IFormFile image, long id, bool isHighlight)
        {
            var product = _productService.GetProduct(id);
            if (product == null) return BadRequest();

            var filePath = await _fileService.SaveFile(FilePath.Product, image);
            if (product.Images == null) product.Images = new List<ProductImage>();
            product.Images.Add(new ProductImage { ProductId = id, FilePath = filePath, IsHighLight = isHighlight });
            _productService.SaveChanges();
            return Ok();



            #region Huy Code new
            //string fileNameForStorage = _fileService.GenerateFileName(image.FileName);
            //string ImageUrl = await _cloudStorage.UploadFileAsync(image, fileNameForStorage);
            //if (product.Images == null) product.Images = new List<ProductImage>();
            //product.Images.Add(new ProductImage { ProductId = id, FilePath = ImageUrl, IsHighLight = isHighlight });
            //_productService.SaveChanges();
            //return Ok();
            #endregion
        }

        [HttpPost("CollectionImage")]
        public async Task<ActionResult> UploadCollectionImage([FromForm]IFormFile image, long id, bool isHighlight)
        {
            var collection = _collectionService.GetCollection(id);
            if (collection == null || collection.Banner != null) return BadRequest();

            var filePath = await _fileService.SaveFile(FilePath.Collection, image);
            collection.Banner = filePath;
            _productService.SaveChanges();
            return Ok();
        }

    }
}