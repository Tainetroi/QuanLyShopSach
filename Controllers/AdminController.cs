using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using websitehoa.Models;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace websitehoa.Controllers
{
    [Authorize(Roles = "Manager,Admin")]
    public class AdminController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _hostingEnvironment;

        public async Task<IActionResult> QLKhachHang(string searchString, int pageNumber = 1)
        {
            int pageSize = 10;
            var query = _context.KhachHangs.AsQueryable();

            if (!string.IsNullOrEmpty(searchString))
            {
                query = query.Where(kh => kh.Hoten.Contains(searchString) || kh.Email.Contains(searchString));
            }

            var result = await PaginatedList<KhachHang>.CreateAsync(query.OrderBy(kh => kh.Makh), pageNumber, pageSize);
            return View(result);
        }


        // GET: Chi tiết khách hàng
        public IActionResult ChiTietKhachHang(int id)
        {
            var khachHang = _context.KhachHangs.Include(k => k.Role).FirstOrDefault(k => k.Makh == id);
            if (khachHang == null)
            {
                return NotFound();
            }
            return View(khachHang);
        }

        // GET: Sửa khách hàng
        public IActionResult SuaKhachHang(int id)
        {
            var khachHang = _context.KhachHangs.Find(id);
            if (khachHang == null)
            {
                return NotFound();
            }
            ViewBag.Roles = _context.KhachHangRoles.ToList();
            return View(khachHang);
        }

        // POST: Sửa khách hàng
        [HttpPost]
        public IActionResult SuaKhachHang(KhachHang khachHang)
        {
            if (ModelState.IsValid)
            {
                _context.Update(khachHang);
                _context.SaveChanges();
                return RedirectToAction("QLKhachHang");
            }
            ViewBag.Roles = _context.KhachHangRoles.ToList();
            return View(khachHang);
        }

        // GET: Xóa khách hàng
        public IActionResult XoaKhachHang(int id)
        {
            var khachHang = _context.KhachHangs.Find(id);
            if (khachHang == null)
            {
                return NotFound();
            }
            return View(khachHang);
        }

        // POST: Xác nhận xóa
        [HttpPost, ActionName("XoaKhachHang")]
        public IActionResult XacNhanXoa(int id)
        {
            var khachHang = _context.KhachHangs.Find(id);
            if (khachHang != null)
            {
                _context.KhachHangs.Remove(khachHang);
                _context.SaveChanges();
            }
            return RedirectToAction("QLKhachHang");
        }

        // GET: Thêm khách hàng mới
        public IActionResult ThemKhachHang()
        {
            ViewBag.Roles = _context.KhachHangRoles.ToList();
            return View();
        }

        // POST: Thêm khách hàng mới
        [HttpPost]
        public IActionResult ThemKhachHang(KhachHang khachHang)
        {
            if (ModelState.IsValid)
            {
                _context.KhachHangs.Add(khachHang);
                _context.SaveChanges();
                return RedirectToAction("QLKhachHang");
            }
            ViewBag.Roles = _context.KhachHangRoles.ToList();
            return View(khachHang);
        }


        public AdminController(AppDbContext context, IWebHostEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;
        }

        //Show drop list danh muc
        private void showDropList()
        {
            List<SelectListItem> list = (from c in _context.DanhMucs
                                         select new SelectListItem()
                                         {
                                             Text = c.Tendanhmuc,
                                             Value = c.IdDanhmuc.ToString()
                                         }).Distinct().ToList();
            ViewBag.ShowDropList = list;
        }

        // GET: Admin

        public async Task<IActionResult> Index(int? pageNumber, string search)
        {

            //Dashboard
            ViewBag.TongDoanhThu = ThongKeDoanhThu();
            ViewBag.ThongKeSL = ThongKeSL();
            ViewBag.ThongKeDonHang = ThongKeDonHang();
            ViewBag.ThongKeKH = ThongKeKhachHang();

            const int pageSize = 15;
            var appDbContext = _context.SanPhams.Include(s => s.IdDanhmucNavigation).Include(s => s.IdthuvienNavigation);

            if (search != null)
            {
                var lstSP = _context.SanPhams.Where(n => n.Tensp.Contains(search));
                ViewBag.Search = search;
                var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(lstSP, pageNumber ?? 1, pageSize);
                return View(paginatedProducts);
            }
            else
            {
                var lstSP = (from s in _context.SanPhams select s).OrderBy(m => m.Masp);
                var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(lstSP, pageNumber ?? 1, pageSize);
                return View(paginatedProducts);
            }
        }

        public decimal ThongKeDoanhThu()
        {
            decimal TongDoanhThu = _context.ChiTietDonHangs
                .Where(m => m.Status == 1)
                .Sum(
                n => n.Soluong * n.Gia
            ).Value;
            return TongDoanhThu;
        }


        public decimal ThongKeSL()
        {
            decimal TongDoanhThu = _context.ChiTietDonHangs
                .Where(m => m.Status == 1)
                .Sum(
                n => (n.Soluong)
            ).Value;
            return TongDoanhThu;
        }

        public double ThongKeDonHang()
        {
            double slddh = _context.DonHangs.Count();
            return slddh;
        }
        public double ThongKeKhachHang()
        {
            double slkh = _context.KhachHangs.Count();
            return slkh;
        }

        [Authorize(Roles = "Admin")]
        // GET: Admin/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sanPham = await _context.SanPhams
                .Include(s => s.IdDanhmucNavigation)
                .Include(s => s.IdthuvienNavigation)
                .FirstOrDefaultAsync(m => m.Masp == id);
            if (sanPham == null)
            {
                return NotFound();
            }

            return View(sanPham);
        }

        // GET: Admin/Create
        public IActionResult Create()
        {
            showDropList();
            return View();
        }

        // POST: Admin/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Masp,Idthuvien,IdDanhmuc,Tensp,Hinh,Giaban,Ngaycapnhat,Soluongton,Mota,Giamgia,Giakhuyenmai")] SanPham sanPham, List<IFormFile> files)
        {
            if (ModelState.IsValid)
            {
                if (files != null && files.Count > 0)
                {
                    // code for handling uploaded image file(s)
                    var filePaths = new List<string>();
                    string tempname = "";
                    foreach (var formFile in files)
                    {
                        if (formFile.Length > 0)
                        {
                            var fileName = Path.GetFileName(formFile.FileName);
                            var filePath = Path.Combine(_hostingEnvironment.WebRootPath, "Content/uploads", fileName);
                            using (var stream = new FileStream(filePath, FileMode.Create))
                            {
                                await formFile.CopyToAsync(stream);
                            }
                            tempname = fileName;
                            filePaths.Add(fileName);
                        }
                    }
                    sanPham.Hinh = "/Content/uploads/" + tempname;


                }

                var x = sanPham.Giaban;
                var y = sanPham.Giamgia;

                var z = (x * y) / 100;

                var price = x - z;

                sanPham.Giakhuyenmai = price;

                _context.Add(sanPham);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            showDropList();
            return View(sanPham);
        }

        // GET: Admin/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sanPham = await _context.SanPhams.FindAsync(id);
            if (sanPham == null)
            {
                return NotFound();
            }

            showDropList();

            return View(sanPham);
        }

        // POST: Admin/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Masp,IdDanhmuc,Idthuvien,Tensp,Hinh,Giaban,Ngaycapnhat,Soluongton,Mota,Giamgia,Giakhuyenmai")] SanPham sanPham, List<IFormFile> files, IFormCollection form)
        {
            if (id != sanPham.Masp)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (files != null && files.Count > 0)
                    {
                        // code for handling uploaded image file(s)
                        var filePaths = new List<string>();
                        string tempname = "";
                        foreach (var formFile in files)
                        {
                            if (formFile.Length > 0)
                            {
                                var fileName = Path.GetFileName(formFile.FileName);
                                var filePath = Path.Combine(_hostingEnvironment.WebRootPath, "Content/uploads", fileName);
                                using (var stream = new FileStream(filePath, FileMode.Create))
                                {
                                    await formFile.CopyToAsync(stream);
                                }
                                tempname = fileName;
                                filePaths.Add(fileName);
                            }
                        }
                        sanPham.Hinh = "/Content/uploads/" + tempname;


                    }

                    var x = sanPham.Giaban;
                    var y = sanPham.Giamgia;

                    var z = (x * y) / 100;

                    var price = x - z;

                    sanPham.Giakhuyenmai = price;


                    _context.Update(sanPham);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SanPhamExists(sanPham.Masp))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdDanhmuc"] = new SelectList(_context.DanhMucs, "IdDanhmuc", "IdDanhmuc", sanPham.IdDanhmuc);
            ViewData["Idthuvien"] = new SelectList(_context.ThuVienAnhs, "Idthuvien", "Idthuvien", sanPham.Idthuvien);
            return View(sanPham);
        }

        // GET: Admin/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sanPham = await _context.SanPhams
                .Include(s => s.IdDanhmucNavigation)
                .Include(s => s.IdthuvienNavigation)
                .FirstOrDefaultAsync(m => m.Masp == id);
            if (sanPham == null)
            {
                return NotFound();
            }

            return View(sanPham);
        }

        // POST: Admin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var sanPham = await _context.SanPhams.FindAsync(id);
            _context.SanPhams.Remove(sanPham);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool SanPhamExists(int id)
        {
            return _context.SanPhams.Any(e => e.Masp == id);
        }

        //---------------------------------------Quản lý đơn hàng------------------------------------

        public async Task<IActionResult> QLDonHang(int? pageNumber, DateTime? searchDate)
        {
            const int pageSize = 5;

            var donHang = from dh in _context.DonHangs
                          join kh in _context.KhachHangs on dh.Makh equals kh.Makh
                          select dh;
            //var paginatedProducts = await PaginatedList<DonHang>.CreateAsync(donHang, pageNumber ?? 1, pageSize);
            if (searchDate != null)
            {
                var tt = _context.DonHangs.Where(d => d.Ngaygiao == searchDate.Value);
                ViewBag.Search = searchDate;
                var paginatedProducts = await PaginatedList<DonHang>.CreateAsync(tt, pageNumber ?? 1, pageSize);
                return View(paginatedProducts);
            }
            else
            {
                var lstSP = (from s in _context.DonHangs select s).OrderBy(m => m.Madon);
                var paginatedProducts = await PaginatedList<DonHang>.CreateAsync(lstSP, pageNumber ?? 1, pageSize);
                return View(paginatedProducts);
            }

        }

        [HttpGet]
        public IActionResult QLChiTietDonHang(int id)
        {
            var donhang = _context.DonHangs.First(m => m.Madon == id);
            return View(donhang);
        }

        [HttpPost]
        public IActionResult QLChiTietDonHang(int id, IFormCollection collection)
        {
            var danhmuc = _context.DonHangs.First(m => m.Madon == id);
            var E_tendanhmuc = collection["giaohang"];
            var ngaygiao = string.Format("{0:MM/dd/yyyy}", collection["NgayGiao"]);
            danhmuc.Madon = id;
            if (string.IsNullOrEmpty(E_tendanhmuc))
            {
                TempData["Errnull"] = "Du lieu khong duoc de trong!";
            }
            else
            {
                danhmuc.Giaohang = E_tendanhmuc;
                danhmuc.Ngaygiao = DateTime.Parse(ngaygiao);
                _context.Update(danhmuc);

                if (E_tendanhmuc == "giao thành công")
                {
                    var ctdh = _context.ChiTietDonHangs.Where(m => m.Madon == id).ToList();
                    foreach (var item in ctdh)
                    {
                        item.Status = 1;
                        _context.Update(item);
                    }
                }
                else
                {
                    var ctdh = _context.ChiTietDonHangs.Where(m => m.Madon == id).ToList();
                    foreach (var item in ctdh)
                    {
                        item.Status = 0;
                        _context.Update(item);
                    }
                }

                _context.SaveChanges();
                return RedirectToAction("QLDonHang");
            }
            return View(danhmuc);
        }
        public ActionResult CTDetails(int? id)
        {
            DonHang donhang = _context.DonHangs.Find(id);
            var chitiet = _context.ChiTietDonHangs.Include(d => d.MaspNavigation).Where(d => d.MadonNavigation.Madon == id).ToList();
            return View(chitiet);
        }
        public ActionResult ChiTietDonHangAdmin(int id)
        {
            var results = (from t1 in _context.ChiTietDonHangs
                           join t2 in _context.DonHangs
                           on new { t1.Madon } equals
                               new { t2.Madon }
                           where t2.Madon == id
                           select t1).ToList();

            List<KhachHang> khachhang = _context.KhachHangs.ToList();
            List<DonHang> donhang = _context.DonHangs.ToList();
            List<ChiTietDonHang> ctdh = _context.ChiTietDonHangs.ToList();
            List<SanPham> sanpham = _context.SanPhams.ToList();

            var ViewKH2 = from kh in khachhang
                          join dh in donhang on kh.Makh equals dh.Makh
                          where dh.Madon == id && kh.Makh == dh.Makh
                          select new ViewModel
                          {
                              khachhang = kh,
                              donhang = dh
                          };

            var ViewSP = from ct in ctdh
                         join sp in sanpham on ct.Masp equals sp.Masp
                         join dh in donhang on ct.Madon equals dh.Madon
                         where ct.Madon == id && sp.Masp == ct.Masp && ct.Madon == dh.Madon

                         select new ViewModel
                         {
                             sanpham = sp,
                             ctdh = ct,
                             donhang = dh
                         };

            ViewBag.ViewChiTietDH2 = ViewKH2;
            ViewBag.ViewSP = ViewSP;
            return View(results);
        }
    }
}
