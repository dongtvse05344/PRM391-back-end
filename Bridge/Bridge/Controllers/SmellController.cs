using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Bridge.Service;
using Bridge.ViewModels;
using Mapster;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Bridge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SmellController : ControllerBase
    {
        private readonly ISmellService _smellService;

        public SmellController(ISmellService smellService)
        {
            _smellService = smellService;
        }

        [HttpGet]
        public ActionResult GetAll()
        {
            var smells = _smellService.GetSmells().Select(_ => _.Adapt<SmellVM>()).ToList();
            return Ok(smells);
        }
    }
}