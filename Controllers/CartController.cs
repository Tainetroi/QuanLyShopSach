﻿
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using websitehoa.Helpers;
using websitehoa.Models;
using websitehoa.Services;
using System;
using System.Collections.Generic;
using System.Linq;


namespace websitehoa.Controllers
{
    public class CartController : Controller
    {

        private readonly IVnPayService _vnPayService;

        private readonly AppDbContext _context;

        public CartController(AppDbContext context, IVnPayService vnPayService)
        {
            _context = context;
            _vnPayService = vnPayService;
        }

        [HttpGet]
        public IActionResult Index()
        {
            var cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart");
            if(cart != null)
            {
                ViewBag.cart = cart;
                ViewBag.total = cart.Sum(item => item.Product.Giakhuyenmai * item.Quantity);
                if(ViewBag.total == null)
                {
                    ViewBag.total = 0;
                }

            }

            string username = HttpContext.Session.GetString("username");

            ViewBag.info = _context.AspNetUsers.Where(p => p.UserName == username).ToList();

            return View();
        }
       

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Index([Bind("Hoten,Tendangnhap,Matkhau,Email,Diachi,Dienthoai,Ngaysinh,RoleId,Status,Resetpasswordcode")] KhachHang kh, DonHang dh, ChiTietDonHang ctdh, AspNetUser user, IFormCollection form)
        {
            kh.Makh = Convert.ToInt32(user.Id);
          //  kh.Hoten = user.FullName;
            kh.Tendangnhap = HttpContext.Session.GetString("username");
            //kh.Matkhau = "123";
            kh.Hoten = form["hoten"];
            kh.Email = user.Email;
            kh.Diachi = form["sonha"] + " " + form["xa"] + " " + form["tinh"];
            kh.Dienthoai = form["sodienthoai"];
            kh.Ngaysinh = user.BirthDate;
            kh.RoleId = 2;
            kh.Status = 1;
            kh.Resetpasswordcode = "123";

            _context.KhachHangs.Add(kh);
            _context.SaveChanges();

            dh.Makh = kh.Makh;
            dh.Thanhtoan = "COD";
            dh.Giaohang = "chờ xử lý";
            dh.Ngaydat = DateTime.Now;

            _context.DonHangs.Add(dh);
            _context.SaveChanges();

            var cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart");

            foreach(var item in cart)
            {
                ctdh.Madon = dh.Madon;
                ctdh.Masp = item.Product.Masp;
                ctdh.Soluong = item.Quantity;
                ctdh.Gia = item.Product.Giakhuyenmai;
                ctdh.Tongsoluong = cart.Sum(item => item.Quantity);
                ctdh.Tonggia = cart.Sum(item => item.Product.Giakhuyenmai * item.Quantity);
                ctdh.Status = 0;

                _context.ChiTietDonHangs.Add(ctdh);
                _context.SaveChanges();
            }

            HttpContext.Session.Remove("cart");
            HttpContext.Session.Remove("countCart");

            return RedirectToAction("DatHangThanhCong");
        }

        public IActionResult DatHangThanhCong()
        {
            return View();
        }

        //thanh toan VNPAY
        public IActionResult CreatePaymentUrl(PaymentInformationModel model, KhachHang kh, DonHang dh, ChiTietDonHang ctdh, AspNetUser user, IFormCollection form)
        {
            var url = _vnPayService.CreatePaymentUrl(model, HttpContext);

            kh.Makh = Convert.ToInt32(user.Id);
            kh.Hoten = user.FullName;
            kh.Tendangnhap = HttpContext.Session.GetString("username");
            
            kh.Email = user.Email;
            kh.Diachi = form["sonha"] + " " + form["xa"] + " " + form["tinh"];
            kh.Dienthoai = "123456789";
            kh.Ngaysinh = user.BirthDate;
            kh.RoleId = 2;
            kh.Status = 1;
            kh.Resetpasswordcode = "123";

            _context.KhachHangs.Add(kh);
            _context.SaveChanges();

            dh.Makh = kh.Makh;
            dh.Thanhtoan = "VNPAY";
            dh.Giaohang = "chờ xử lý";
            dh.Ngaydat = DateTime.Now;

            _context.DonHangs.Add(dh);
            _context.SaveChanges();

            var cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart");

            foreach (var item in cart)
            {
                ctdh.Madon = dh.Madon;
                ctdh.Masp = item.Product.Masp;
                ctdh.Soluong = item.Quantity;
                ctdh.Gia = item.Product.Giakhuyenmai;
                ctdh.Tongsoluong = cart.Sum(item => item.Quantity);
                ctdh.Tonggia = cart.Sum(item => item.Product.Giakhuyenmai * item.Quantity);
                ctdh.Status = 0;

                _context.ChiTietDonHangs.Add(ctdh);
                _context.SaveChanges();
            }

            HttpContext.Session.Remove("cart");
            HttpContext.Session.Remove("countCart");

            return Redirect(url);
        }

        public IActionResult PaymentCallback()
        {
            var response = _vnPayService.PaymentExecute(Request.Query);

            return Json(response);
        }

        [Route("addtocart/{id}")]
        /*   public IActionResult AddToCart(string id, IFormCollection form)
           {
               int productId = Convert.ToInt32(id);

               var produc = _context.SanPhams.Find(productId);

                  int x = Convert.ToInt32(form["soluong"]);


                   if (x < 1 || x > produc.Soluongton)

                  {
                       TempData["slError"] = "Số lượng ko được < 0 và > số lượng tồn";

                  }
                  else
                  { 

               TempData["addSuccess"] = "Thêm vào giỏ hàng thành công!";
                   if (SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart") == null) //chua có sp trong giỏ
                   {
                       List<Item> cart = new List<Item>();  ///tao new list
                       cart.Add(new Item { Product = produc, Quantity = x }); //them sp chưa có vào giỏ.
                       SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cart);

                       //create session coiuntCart
                       //so luong  tồn tại
                       HttpContext.Session.SetString("countCart", cart.Count.ToString());
                   }
                   else //có sp trong giỏ
                   {
                       List<Item> cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart");

                       Item existingItem = cart.FirstOrDefault(i => i.Product.Masp == productId);
                       if (existingItem != null) // Nếu sản phẩm id{?} đã có trong giỏ hàng
                       {
                           existingItem.Quantity += x; // Tăng số lượng sản phẩm lên
                           if (existingItem.Quantity > existingItem.Product.Soluongton) //nếu sp vừa tăng lên > sl tồn thì xét về 1
                           {
                               existingItem.Quantity = 1;
                           }
                       }
                       else
                       {
                           cart.Add(new Item { Product = produc, Quantity = x }); //them sp thuôc id ? chưa có vào giỏ
                           SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cart);
                       }

                       SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cart); //cập nhập session cart

                       //create session coiuntCart
                       HttpContext.Session.SetString("countCart", cart.Count.ToString());
                   }

               }

               return RedirectToAction("Details","SanPham", new { id = id }); */


        public IActionResult AddToCart(string id, IFormCollection form)
        {
            int productId = Convert.ToInt32(id);

            var product = _context.SanPhams.Find(productId);

            int quantity = Convert.ToInt32(form["soluong"]);

            if (quantity < 1 || quantity > product.Soluongton)
            {
                TempData["slError"] = "Số lượng không hợp lệ!";
                return RedirectToAction("Details", "SanPham", new { id = id });
            }

            if (product.Giamgia > 0) // Nếu sản phẩm có giảm giá
            {
                // Kiểm tra xem người dùng đã đăng nhập chưa
                if (!User.Identity.IsAuthenticated)
                {
                    TempData["slError"] = "Vui lòng đăng nhập để thêm sản phẩm có giảm giá vào giỏ hàng!";
                    return RedirectToAction("Details", "SanPham", new { id = id });
                }
            }

            TempData["addSuccess"] = "Thêm vào giỏ hàng thành công!";

            if (SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart") == null)
            {
                List<Item> cart = new List<Item>();
                cart.Add(new Item { Product = product, Quantity = quantity });
                SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cart);
                HttpContext.Session.SetString("countCart", cart.Count.ToString());
            }
            else
            {
                List<Item> cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart");
                Item existingItem = cart.FirstOrDefault(i => i.Product.Masp == productId);

                if (existingItem != null)
                {
                    existingItem.Quantity += quantity;
                    if (existingItem.Quantity > existingItem.Product.Soluongton)
                    {
                        existingItem.Quantity = 1;
                    }
                }
                else
                {
                    cart.Add(new Item { Product = product, Quantity = quantity });
                    SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cart);
                }

                HttpContext.Session.SetString("countCart", cart.Count.ToString());
            }

            return RedirectToAction("Details", "SanPham", new { id = id });
        } 

        [Route("remove/{id}")]
        public IActionResult Remove(int id)
        {
            List<Item> cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart");

            // Find the item with the specified ID in the cart
            Item itemToRemove = cart.FirstOrDefault(item => item.Product.Masp == id);

            if (itemToRemove != null)
            {
                // Remove the item from the cart
                cart.Remove(itemToRemove);

                // Update the cart session
                SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cart);

                //create session coiuntCart
                HttpContext.Session.SetString("countCart", cart.Count.ToString());
            }

            if (cart.Count ==0)
            {
                HttpContext.Session.Remove("cart");
                HttpContext.Session.Remove("countCart");
            }

            return RedirectToAction("Index");
        }

        private int isExist(string id)
        {
            List<Item> cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart");
            for (int i = 0; i < cart.Count; i++)
            {
                if (cart[i].Product.Masp.Equals(id))
                {
                    return i;
                }
            }
            return -1;
        }
       

    }
}
