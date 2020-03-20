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
    public class DeliveryStatusController : ControllerBase
    {
        private readonly IDeliveryStatusService _deliveryStatusService;

        public DeliveryStatusController(IDeliveryStatusService deliveryStatusService)
        {
            _deliveryStatusService = deliveryStatusService;
        }

        [HttpGet]
        public ActionResult Gets()
        {
            var result = _deliveryStatusService.GetDeliveryStatuss().Select(s => s.Adapt<DeliveryStatusVM>());
            return Ok(result);
        }
    }
}