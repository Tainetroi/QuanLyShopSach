using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using websitehoa.Models;
using websitehoa.Security;
using websitehoa.Services;
using Microsoft.AspNetCore.Identity;

namespace websitehoa
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.ConfigureServices((context, services) =>
                    {
                        // Your ConfigureServices code goes here
                        services.AddControllersWithViews();
                        services.AddDbContext<AppDbContext>(options => options.UseSqlServer
                            (context.Configuration.GetConnectionString("AppDb")));

                        services.AddDbContext<AppIdentityDbContext>(options => options.UseSqlServer(context.Configuration.GetConnectionString("AppDb")));

                        services.AddIdentity<AppIdentityUser, AppIdentityRole>().AddEntityFrameworkStores<AppIdentityDbContext>();

                        services.ConfigureApplicationCookie(options =>
                        {
                            options.LoginPath = "/Security/SignIn";
                            options.AccessDeniedPath = "/Security/AccessDenied";
                        });

                        services.AddSession();
                        services.AddScoped<IVnPayService, VnPayService>();
                    });

                    webBuilder.Configure((context, app) =>
                    {
                        var env = context.HostingEnvironment;
                        if (env.IsDevelopment())
                        {
                            app.UseDeveloperExceptionPage();
                        }

                        app.UseSession();

                        app.UseStaticFiles();

                        app.UseRouting();

                        app.UseAuthentication();

                        app.UseAuthorization();

                        app.UseEndpoints(endpoints =>
                        {
                            endpoints.MapControllerRoute(
                                name: "default",
                                pattern: "{controller=SanPham}/{action=Index}/{id?}");
                        });
                    });
                });
        public static async Task SeedAdminAsync(UserManager<AppIdentityUser> userManager, RoleManager<AppIdentityRole> roleManager)
        {
            // Kiểm tra xem role "admin" đã tồn tại chưa, nếu chưa thì tạo
            var roleExists = await roleManager.RoleExistsAsync("Admin");
            if (!roleExists)
            {
                var role = new AppIdentityRole { Name = "Admin", Description = "Administrator" };
                await roleManager.CreateAsync(role);
            }

            // Kiểm tra xem tài khoản admin đã tồn tại chưa
            var user = await userManager.FindByNameAsync("Admin");
            if (user == null)
            {
                user = new AppIdentityUser
                {
                    UserName = "Admin",
                    Email = "admin@example.com",
                    FullName = "Administrator",
                    BirthDate = DateTime.Now.AddYears(-25)
                };

                // Tạo tài khoản admin với mật khẩu
                var result = await userManager.CreateAsync(user, "Admin@1234"); // Thay đổi mật khẩu nếu cần
                if (result.Succeeded)
                {
                    await userManager.AddToRoleAsync(user, "Admin");
                }
            }
        }
    }
}
