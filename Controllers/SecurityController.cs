using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using websitehoa.Models;
using websitehoa.Security;
using Microsoft.AspNetCore.Http;

namespace websitehoa.Controllers
{
    public class SecurityController : Controller
    {
        private readonly UserManager<AppIdentityUser> userManager;
        private readonly RoleManager<AppIdentityRole> roleManager;
        private readonly SignInManager<AppIdentityUser> signInManager;

        public SecurityController(UserManager<AppIdentityUser> userManager,
            RoleManager<AppIdentityRole> roleManager,
            SignInManager<AppIdentityUser> signInManager)
        {
            this.userManager = userManager;
            this.roleManager = roleManager;
            this.signInManager = signInManager;
        }

        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Register(Register register)
        {
            if (ModelState.IsValid)
            {
                if (!roleManager.RoleExistsAsync("staff").Result) //staff và chỉnh role bên này
                {
                    var role = new AppIdentityRole();
                    role.Name = "staff"; //staff - Admin - User
                    role.Description = "User can Perform CRUD Employee";
                    var roleResult = roleManager.CreateAsync(role).Result;
                }

                var user = new AppIdentityUser();
                user.UserName = register.UserName;
                user.Email = register.Email;
                user.FullName = register.FullName;
                user.BirthDate = register.BirthDate;

                var result = userManager.CreateAsync(user, register.Password).Result;
                if (result.Succeeded)
                {
                    userManager.AddToRoleAsync(user, "staff").Wait(); //"User" thay bằng staff
                    return RedirectToAction("SignIn", "Security");
                }
                else
                {
                    ModelState.AddModelError("", "Loi Dang Ky");
                }
            }
            return View(register);
        }
        public async Task<IActionResult> CreateAdmin()
        {
            // Kiểm tra xem role "admin" đã tồn tại chưa, nếu chưa tạo role "admin"
            var roleExists = await roleManager.RoleExistsAsync("Admin");
            if (!roleExists)
            {
                var role = new AppIdentityRole { Name = "Admin", Description = "Administrator with full access" };
                await roleManager.CreateAsync(role);
            }

            // Kiểm tra xem tài khoản admin đã tồn tại chưa
            var user = await userManager.FindByNameAsync("Admin");
            if (user == null)
            {
                // Tạo tài khoản admin mới
                user = new AppIdentityUser
                {
                    UserName = "Admin", // Tên đăng nhập của admin
                    Email = "admin@example.com", // Email của admin
                    FullName = "Administrator", // Họ tên của admin
                    BirthDate = DateTime.Now.AddYears(-25) // Ngày sinh của admin
                };

                // Mật khẩu cho tài khoản admin
                var result = await userManager.CreateAsync(user, "Admin@1234"); // Bạn có thể thay đổi mật khẩu này

                // Kiểm tra nếu việc tạo tài khoản thành công
                if (result.Succeeded)
                {
                    // Thêm tài khoản admin vào role "admin"
                    await userManager.AddToRoleAsync(user, "Admin");
                    return Content("Tài khoản admin đã được tạo thành công với mật khẩu 'Admin@1234'!");
                }
                else
                {
                    return Content("Đã xảy ra lỗi khi tạo tài khoản admin.");
                }
            }

            return Content("Tài khoản admin đã tồn tại.");
        }

        [HttpGet]
        public IActionResult SignIn()
        {
            return View();
        }
        //nhiệm vụ controller sẽ nhận thông tin từ người dùng và nếu đúng đưa vào trang salehot
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SignIn(SignIn signIn)
        {
            if (ModelState.IsValid)
            {
                var result = signInManager.PasswordSignInAsync(signIn.UserName, signIn.Password, signIn.RememberMe, false).Result;

                if (result.Succeeded)
                {
                    HttpContext.Session.SetString("username", signIn.UserName);
                    return RedirectToAction("salehot", "SanPham"); //điều kiện đúng sẽ trả về trang salehot
                }

                else
                    TempData["LoginErr"] = "Tên tài khoản hoặc mật khẩu không chính xác!";
            }
            return View(signIn);
        }

        //end
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public IActionResult SignOut()
        {
            signInManager.SignOutAsync().Wait();
            HttpContext.Session.Remove("username");
            return RedirectToAction("SignIn", "Security");

        }

        public IActionResult AccessDenied()
        {
            return View();
        }
    }
}
