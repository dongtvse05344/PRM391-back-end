using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Bridge.Model;
using Bridge.Service;
using Bridge.Util;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Bridge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FileController : ControllerBase
    {
        private readonly IFileService _fileService;
        private readonly IProductService _productService;

        public FileController(IFileService fileService, IProductService productService)
        {
            _fileService = fileService;
            _productService = productService;
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
        }

    }
}