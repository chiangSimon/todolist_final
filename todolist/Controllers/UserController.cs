using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using todolist.BusinessLogicLayer;
using todolist.Models;

namespace todolist.Controllers
{
    public class UserController : Controller
    {
        private readonly TodolistContext _context;

        public UserController()
        {
            _context = new TodolistContext();
        }

        public IActionResult Login()
        {
            return View();
        }

        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginVM loginVM)
        {
            User? user = _context.Users.FirstOrDefault(x => x.UserEmail == loginVM.UserEmail);
            if (user != null)
            {
                string passwordWithSalt = $"{loginVM.Password}{user.PasswordSalt}";
                byte[] RealPasswordBytes = Encoding.ASCII.GetBytes(passwordWithSalt);
                byte[] RealPasswordHash = SHA256.HashData(RealPasswordBytes);
                if (Enumerable.SequenceEqual(RealPasswordHash, user.PasswordHash))
                {
                    List<Claim> claims = new()
            {
                new Claim(ClaimTypes.Name, $"{user.Username}"),
                new Claim(ClaimTypes.Role, "user"),
            };
                    ClaimsIdentity identity = new(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    ClaimsPrincipal principal = new(identity);
                    await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme,
                        principal, new AuthenticationProperties
                        {
                            ExpiresUtc = DateTime.UtcNow.AddDays(1)
                        });
                    _context.SaveChanges();
                    return Json(new { success = true, message = "登入成功" });
                }
            }
            return Json(new { success = false, message = "登入失敗，帳號或密碼錯誤" });
        }

        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Login", "User");
        }


        [HttpPost]
        public string Register([FromForm] RegisterVM registerVM)
        {
            var allEmail = _context.Users.Select(x => x.UserEmail).ToList();
            var allUserName = _context.Users.Select(x => x.Username).ToList();
            if (allEmail.Contains(registerVM.UserEmail) || allUserName.Contains(registerVM.UserName))
            {
                return "Email帳號或使用者名稱已被使用";
            }
            else
            {
                byte[] saltBytes = new byte[8];
                using (RandomNumberGenerator ran = RandomNumberGenerator.Create())
                {
                    ran.GetBytes(saltBytes);
                }
                byte[] passwordBytes = Encoding.ASCII.GetBytes($"{registerVM.Password}{saltBytes}");
                byte[] HashBytes = SHA256.HashData(passwordBytes);
                User user = new User()
                {
                    Username = registerVM.UserName,
                    UserEmail = registerVM.UserEmail,
                    PasswordHash = HashBytes,
                    PasswordSalt = saltBytes
                };
                _context.Users.Add(user);
                _context.SaveChanges();
                return "註冊成功";
            }

        }



    }


}
