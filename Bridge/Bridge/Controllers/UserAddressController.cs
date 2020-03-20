using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Bridge.Model;
using Bridge.Service;
using Bridge.ViewModels;
using Mapster;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace Bridge.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UserAddressController : ControllerBase
    {
        private readonly UserManager<MyUser> _userManager;
        private readonly IUserAddressService _userAddressService;

        public UserAddressController(UserManager<MyUser> userManager, IUserAddressService userAddressService)
        {
            _userManager = userManager;
            _userAddressService = userAddressService;
        }

        [HttpGet]
        public async Task<ActionResult> getUserAddress()
        {
            var user = await _userManager.GetUserAsync(User);
            var result = user.Addresses.Select(_=>_.Adapt< UserAddressVM>()).ToList();
            return Ok(result);
        }
        [HttpPost]
        public async Task<ActionResult> createAddress(UserAddressCM model)
        {
            var user = await _userManager.GetUserAsync(User);
            var address = model.Adapt<UserAddress>();
            address.UserId = user.Id;
            _userAddressService.CreateUserAddress(address);
            _userAddressService.SaveChanges();
            return Ok();
        }
    }
}