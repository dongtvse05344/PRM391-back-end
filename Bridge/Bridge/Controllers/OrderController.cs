using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Bridge.Model;
using Bridge.Service;
using Bridge.Util;
using Bridge.ViewModels;
using Mapster;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PushSharp.Google;

namespace Bridge.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly UserManager<MyUser> _userManager;
        private readonly IOrderService _orderService;
        private readonly IOrderDetailService _detailService;
        private readonly IProductService _productService;
        private readonly IOrderStatusService _statusService;
        private readonly IDeliveryStatusService _deliveryStatusService;

        public OrderController(IDeliveryStatusService deliveryStatusService, UserManager<MyUser> userManager, IOrderService orderService, IOrderDetailService detailService, IProductService productService, IOrderStatusService statusService)
        {
            _userManager = userManager;
            _orderService = orderService;
            _detailService = detailService;
            _productService = productService;
            _statusService = statusService;
            _deliveryStatusService = deliveryStatusService;
        }

        [HttpGet]
        public async Task<ActionResult> getOrders(bool isDone = false)
        {
            int status1 = (int)OrderCurrentStatus.received;
            int status2 = (int)OrderCurrentStatus.doing;
            if (isDone)
            {
                status1 = (int)OrderCurrentStatus.cancel;
                status2 = (int)OrderCurrentStatus.done;

            }
            var user = await _userManager.GetUserAsync(User);
            var orders = _orderService.GetOrders().Where(_ => _.BuyerId == user.Id 
            && (_.CurrentStatus == status1
                 || _.CurrentStatus == status2)
            );
            List<OrderVM> result = new List<OrderVM>();
            foreach (var order in orders)
            {
                var item = order.Adapt<OrderVM>();
                result.Add(item);
            }
            return Ok(result);
        }

        [HttpGet("Admin")]
        public async Task<ActionResult> GetAll()
        {
            var orders = _orderService.GetOrders()
                .OrderByDescending(_ => _.DateCreated)
                .Select(_=>_.Adapt<OrderVM>());

            
            return Ok(orders);

        }

       

        [HttpGet("{id}")]
        public async Task<ActionResult> getOrder(long id)
        {
            var order = _orderService.GetOrder(id);
            OrderVM result = order.Adapt<OrderVM>();
            foreach (var item in order.OrderDetails)
            {
                var orderDetail = item.Adapt<OrderDetailVM>();
                orderDetail.Image = item.Product.Images.FirstOrDefault(p => p.IsHighLight).FilePath;
                orderDetail.ProductName = item.Product.Name;
                result.OrderDetailVMs.Add(orderDetail);
            }
            foreach (var status in order.OrderStatuses)
            {
                OrderStatusVM data = new OrderStatusVM();
                data.DateCreated = status.DateCreate;
                data.Name = status.Status.Name;
                data.Priority = status.Status.Priority;
                result.StatusVMs.Add(data);
            }
            
            return Ok(result);
        }

        [HttpPost]
        public async Task<ActionResult> createOrder(OrderCM model)
        {
            double totalAmount = 0;
            foreach (var item in model.OrderDetailCMs)
            {
                if (item.Quantity <=  0 || item.Quantity > 5) return BadRequest();
                var product = _productService.GetProduct(item.ProductId);
                if (product == null) return BadRequest();
                totalAmount += product.CurrentPrice * item.Quantity;
            }
            var user = await _userManager.GetUserAsync(User);
            var order = model.Adapt<Order>();
            order.BuyerId = user.Id;
            order.TotalAmount = totalAmount;
            order.CurrentStatus = (int) OrderCurrentStatus.received;
            _orderService.CreateOrder(order);
            foreach (var item in model.OrderDetailCMs)
            {
                var orderDetail = item.Adapt<OrderDetail>();
                orderDetail.OrderId = order.Id;
                _detailService.CreateOrderDetail(orderDetail);
            }
            _orderService.SaveChanges();
            OrderStatus status = new OrderStatus();
            status.OrderId = order.Id;
            status.StatusId = (int)OrderStatusId.start;
            _statusService.CreateOrderStatus(status);
            _statusService.SaveChanges();
            return Ok();
        }

        [HttpPut("UpdateStatus")]
        public async Task<ActionResult> UpdateStatus(OrderStatusCM model)
        {
            var order = _orderService.GetOrder(model.OrderId);
            var deliverStatus = _deliveryStatusService.GetDeliveryStatus(model.StatusId);
            if (order == null || deliverStatus == null) return NotFound();
            OrderStatus status = new OrderStatus();
            status.OrderId = order.Id;
            status.StatusId = model.StatusId;
            _statusService.CreateOrderStatus(status);
            String deviceId = order.MyUser.DeviceId;
            if(deviceId != null)
            {
                await sendNoti(new NotificationCM
                {
                    to = deviceId,
                    notification = new NotificationData
                    {
                        title = deliverStatus.Name,
                        body = DateTime.Now.ToString("dd - MM - yyyy"),
                    },
                    collapse_key = "type_a",
                    data = new NotificationBodyData
                    {
                        message = "Your order on Bridge has been updated",
                    }
                }); 
            }
            
            switch (status.StatusId)
            {
                case (int)OrderStatusId.done:
                    order.CurrentStatus = (int)OrderCurrentStatus.done;
                    break;
                case (int)OrderStatusId.customerCancel:
                case (int)OrderStatusId.outStock:
                case (int)OrderStatusId.shopCancel:
                    order.CurrentStatus = (int)OrderCurrentStatus.cancel;
                    break;
                default:
                    order.CurrentStatus = (int)OrderCurrentStatus.doing;
                    break;
            }
            _orderService.SaveChanges();
            return Ok();
        }
        private async Task sendNoti(NotificationCM notification)
        {
            var fcmKey = "AIzaSyAHc2zsJl_H0nzIxpfo4r_xOA7Vh1fTVOs";
            var uriSender = "https://fcm.googleapis.com/fcm/send";
            var http = new HttpClient();
            http.DefaultRequestHeaders.TryAddWithoutValidation("Authorization", "key=" + fcmKey);
            http.DefaultRequestHeaders.TryAddWithoutValidation("Content-Type", "application/json");
            var content = new StringContent(JsonConvert.SerializeObject(notification), 
                System.Text.Encoding.UTF8, "application/json");
            var response = await http.PostAsync(uriSender, content);
        }

        

        [HttpPut("{id}/Cancel")]
        public async Task<ActionResult> CancelOrder(long id)
        {
            var user = await _userManager.GetUserAsync(User);
            var order = _orderService.GetOrders().Where(p=>p.Id == id && p.BuyerId ==user.Id).FirstOrDefault();
            if (order == null) return NotFound();
            if (order.CurrentStatus != (int)OrderCurrentStatus.received
                && order.CurrentStatus != (int)OrderCurrentStatus.doing)
                return BadRequest();
            OrderStatus status = new OrderStatus();
            status.OrderId = order.Id;
            status.StatusId = (int) OrderStatusId.customerCancel;
            _statusService.CreateOrderStatus(status);
            order.CurrentStatus = (int)OrderCurrentStatus.cancel;
            _orderService.SaveChanges();
            return Ok();
        }
    }
}