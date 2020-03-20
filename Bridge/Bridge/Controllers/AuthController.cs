using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Bridge.Model;
using Bridge.ViewModels;
using Mapster;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;

namespace Bridge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private static String defaultPassword = "zaq@123";
        private readonly UserManager<MyUser> _userManager;

        public AuthController(UserManager<MyUser> userManager)
        {
            _userManager = userManager;
        }


        [HttpPost("Register")]
        public async Task<ActionResult> register(RegisterViewModel model)
        {
            var user = await _userManager.FindByEmailAsync(model.Email);
            if(user !=null)
            {
                return BadRequest("Email has been taken");
            }
            MyUser myUser = model.Adapt<MyUser>();
            myUser.SecurityStamp = _userManager.GenerateNewAuthenticatorKey();
            var result = await _userManager.CreateAsync(myUser, model.Password);
            if (result.Succeeded)
            {
                return Ok();
            }
            else
            {
                return BadRequest(result.Errors);
            }
        }

        [HttpPost("Google")]
        public async Task<ActionResult> GetToken([FromBody]GoogleVM model)
        {
            if (model.UserName != model.Email) return BadRequest();
            var user = await _userManager.FindByNameAsync(model.UserName);
            if (user != null)
            {
                return new OkObjectResult(GenerateToken(user).Result);
            }
            user = await _userManager.FindByEmailAsync(model.Email);
            if (user != null)
            {
                return BadRequest("Email has been taken");
            }
            user = model.Adapt<MyUser>();
            user.SecurityStamp = _userManager.GenerateNewAuthenticatorKey();
            var result = await _userManager.CreateAsync(user, model.Uid);
            if (result.Succeeded)
            {
                if(model.DeviceId != null)
                {
                    user.DeviceId = model.DeviceId;
                    await _userManager.UpdateAsync(user);
                }
                return new OkObjectResult(GenerateToken(user).Result);
            }
            else
            {
                return BadRequest(result.Errors);
            }
        }

        [HttpPost("token")]
        public async Task<ActionResult> GetToken([FromBody]LoginVM model)
        {
            var user = await _userManager.FindByNameAsync(model.Username);
            if (user == null)
            {
                return BadRequest("Invalid Username");
            }
            var result = await _userManager.CheckPasswordAsync(user, model.Password);
            if (!result)
            {
                return BadRequest("Invalid Password");
            }
            if (model.DeviceId != null)
            {
                user.DeviceId = model.DeviceId;
                await _userManager.UpdateAsync(user);
            }
            return new OkObjectResult(GenerateToken(user).Result);
        }

        private async Task<Token> GenerateToken(MyUser user)
        {
            //security key
            string securityKey = "qazedcVFRtgbNHYujmKIolp";
            //symmectric security key
            var symmectricSecurityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(securityKey));

            //signing credentials
            var signingCredentials = new SigningCredentials(symmectricSecurityKey, SecurityAlgorithms.HmacSha256);

            //add Claims
            var claims = new List<Claim>();
            var roles = await _userManager.GetRolesAsync(user);
            foreach (var role in roles)
            {
                claims.Add(new Claim(ClaimTypes.Role, role));
            }

            claims.Add(new Claim(ClaimTypes.Name, user.UserName));
            claims.Add(new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()));
            //create token
            var token = new JwtSecurityToken(
                    issuer: "bflow",
                    audience: user.FullName,
                    expires: DateTime.Now.AddDays(1),
                    signingCredentials: signingCredentials,
                    claims: claims
                );
            //return token
            return new Token
            {
                roles = _userManager.GetRolesAsync(user).Result.ToArray(),
                fullname = user.FullName,
                access_token = new JwtSecurityTokenHandler().WriteToken(token),
                expires_in = (int)TimeSpan.FromDays(1).TotalSeconds
            };
        }

        [Authorize]
        [HttpGet("info")]
        public async Task<ActionResult> GetInfo()
        {
            var user = await _userManager.GetUserAsync(User);
            var result = user.Adapt<UserVM>();
            return Ok(result);
        }
    }
}