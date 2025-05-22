using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using websitehoa.Models;

namespace websitehoa.Controllers
{
    public class SanPhamController : Controller
    {
        private readonly AppDbContext _context;

        public SanPhamController(AppDbContext context)
        {
            _context = context;
        }

        // GET: All SanPham
        public async Task<IActionResult> Index()
        {
            var sanpham = await _context.SanPhams.Take(10).ToListAsync();

            getSPNoiBat();
            getSPhoasen();
           

            getSPcamtu();
           

            getSPHL9();
            getSPHL10();
            getSPHL11();

            getSPHH12();
            getSPHH13();
          /*  getSPHH14(); */

            gethoadon();
            gethoabo();
            getcambinh();
            gethoalang();

            getbohoalon();
            getgiohoa();
            gethoale();
            gethoacuoi();
            gethoahot();

            gethoacamon();
            //trang page rieng 
            gethoahongmau2();
            gethoasen2();
            gethoaly2();
            gethoacamtu2();
            gethoasinhnhat();
            getSPSALE();

            return View(sanpham);
        }

        //cac ham lay ra san pham
        #region
        //lay san pham noi bat
        private void getSPNoiBat()
        {
            var list = (from c in _context.SanPhams select c)
                .Take(10).ToList();
            ViewBag.getSPNoiBat = list;
        }
        //danh muc hoa sen mặc định thành mẫu hoa sen
        private void getSPhoasen()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 3)
                .Take(8).ToList();
            ViewBag.getSPhoasen = list;
        }
        //
        private void getSPChoCho4()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 4)
                .Take(10).ToList();
            ViewBag.getSPChoCho4 = list;
        }
        //
        private void getSPChoCho5()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 5)
                .Take(10).ToList();
            ViewBag.getSPChoCho5 = list;
        }
        //mặc định mẫu hoa cẩm tú
        private void getSPcamtu()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 6)
                .Take(8).ToList();
            ViewBag.getSPcamtu = list;
        }
        //
        private void getSPChoMeo7()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 7)
                .Take(10).ToList();
            ViewBag.getSPChoMeo7 = list;
        }
        //
        private void getSPChoMeo8()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 8)
                .Take(10).ToList();
            ViewBag.getSPChoMeo8 = list;
        }
        //hoa ly đỏ sửa làm mặc định (mẫu hoa ly)
        private void getSPHL9()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 13)
                .Take(8).ToList();
            ViewBag.getSPHL9 = list;
        }
        //hoa ly trắnsg
        private void getSPHL10()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 14)
                .Take(10).ToList();
            ViewBag.getSPHL10 = list;
        }
        //hoa ly vàng
        private void getSPHL11()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 15)
                .Take(10).ToList();
            ViewBag.getSPHL11 = list;
        }
        //Hoa hong do mặc định thành mẫu hoa hồng 
        private void getSPHH12()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 19)
                .Take(8).ToList();
            ViewBag.getSPHH12 = list;
        }

        //Hoa hong hỗn hợp
        private void getSPHH13()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 20)
                .Take(10).ToList();
            ViewBag.getSPHH13 = list;
        }
        //Hoa hong xanh
      /*  private void getSPHH14()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 21)
                .Take(6).ToList();
            ViewBag.getSPHH14 = list;
        }*/
        //------------------------------------------
        //Hoa đơn
        private void gethoadon()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 28)
                .Take(8).ToList();
            ViewBag.gethoadon = list;
        }
        //Hoa bó
        private void gethoabo()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 29)
                .Take(8).ToList();
            ViewBag.gethoabo = list;
        }
       //hoa cắm bình
        private void getcambinh()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 30)
                .Take(8).ToList();
            ViewBag.getcambinh = list;
        }
    //Hoa lẵng
    private void gethoalang()
    {
        var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 31)
            .Take(8).ToList();
        ViewBag.gethoalang = list;
    }
        //hoa lớn
        private void getbohoalon()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 32)
                .Take(8).ToList();
            ViewBag.getbohoalon = list;
        }
        //giỏ hoa
        private void getgiohoa()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 33)
                .Take(8).ToList();
            ViewBag.getgiohoa = list;
        }
        //hoa dịp lễ
        private void gethoale()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 34)
                .Take(8).ToList();
            ViewBag.gethoale = list;
        }
        //hoa cưới
        private void gethoacuoi()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 35)
                .Take(8).ToList();
            ViewBag.gethoacuoi = list;
        }
        //hoa đang hot
        private void gethoahot()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 37)
                .Take(5).ToList();
            ViewBag.gethoahot = list;
        }

        #endregion
        //---------------------------------------------------
       
       
        //----------------------------
        //sách tiểu thuyết
        public async Task<IActionResult> salehot()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            getSPSALE();

            return View(sanpham);
        }
        //
        private void getSPSALE()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 21)
                .Take(50).ToList();
            ViewBag.getSPSALE = list;
        }
        //--------------------------------------------------------
        //hoa cảm ơn
        public async Task<IActionResult> hoacamon()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoacamon();

            return View(sanpham);
        }
        private void gethoacamon()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 39)
                .Take(30).ToList();
            ViewBag.gethoacamon = list;
        }
        //------------------------------------------------------
        //sách kinh tế
        public async Task<IActionResult> hoasinhnhat()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoasinhnhat();

            return View(sanpham);
        }
        private void gethoasinhnhat()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 25)
                .Take(30).ToList();
            ViewBag.gethoasinhnhat = list;
        }
        //------------------------------------------------------
        //hoa sự kiện
        public async Task<IActionResult> hoasukien()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoasukien();

            return View(sanpham);
        }
        private void gethoasukien()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 41)
                .Take(30).ToList();
            ViewBag.gethoasukien = list;
        }
        //------------------------------------------------------
        //hoa tươi
        public async Task<IActionResult> hoatuoi()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoatuoi();

            return View(sanpham);
        }
        private void gethoatuoi()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 42)
                .Take(30).ToList();
            ViewBag.gethoatuoi = list;
        }
        //------------------------------------------------------
        //hoa quà tặng
        public async Task<IActionResult> hoaquatang()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoaquatang();

            return View(sanpham);
        }
        private void gethoaquatang()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 43)
                .Take(30).ToList();
            ViewBag.gethoaquatang = list;
        }
        //------------------------------------------------------
        //hoa tổng hợp
        public async Task<IActionResult> hoatonghop()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoatonghop();

            return View(sanpham);
        }
        private void gethoatonghop()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 44)
                .Take(30).ToList();
            ViewBag.gethoatonghop = list;
        }
        //------------------------------------------------------
        //hoa cài áo
        public async Task<IActionResult> hoacaiao()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoacaiao();

            return View(sanpham);
        }
        private void gethoacaiao()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 45)
                .Take(30).ToList();
            ViewBag.gethoacaiao = list;
        }
        //------------------------------------------------------
        //hoa cô dâu
        public async Task<IActionResult> hoacodau()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoacodau();

            return View(sanpham);
        }
        private void gethoacodau()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 46)
                .Take(30).ToList();
            ViewBag.gethoacodau = list;
        }
        //------------------------------------------------------
        //hoa ngày phụ nữ
        public async Task<IActionResult> hoaphunu()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoaphunu();

            return View(sanpham);
        }
        private void gethoaphunu()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 47)
                .Take(30).ToList();
            ViewBag.gethoaphunu = list;
        }
        //------------------------------------------------------
        //hoa ngày nhà giáo
        public async Task<IActionResult> hoanhagiao()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoanhagiao();

            return View(sanpham);
        }
        private void gethoanhagiao()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 48)
                .Take(30).ToList();
            ViewBag.gethoanhagiao = list;
        }
        //------------------------------------------------------
        //trang hoa hồng
       
        public async Task<IActionResult> hoahongpage()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoahongmau2();
            return View(sanpham);
        }
          private void gethoahongmau2()
          {
              var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 1)

                  .Take(30).ToList();
              ViewBag.gethoahongmau2 = list;

          }
        // kũy năng sống
        public async Task<IActionResult> hoasenpage()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoasen2();
            return View(sanpham);
        }
        private void gethoasen2()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 3)

                .Take(30).ToList();
            ViewBag.gethoasen2 = list;

        }
        //------------------------------------------------------
        //sách theo chủ đề lập trình
        public async Task<IActionResult> hoalypage()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoaly2();
            return View(sanpham);
        }
        private void gethoaly2()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 7)

                .Take(30).ToList();
            ViewBag.gethoaly2 = list;

        }
        //sách thiếu nhi
        public async Task<IActionResult> hoacamtupage()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoacamtu2();
            return View(sanpham);
        }
        private void gethoacamtu2()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 4)

                .Take(30).ToList();
            ViewBag.gethoacamtu2 = list;

        }
        //hoa đơn
        public async Task<IActionResult> hoadonpage()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoadon2();
            return View(sanpham);
        }
        private void gethoadon2()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 28)

                .Take(30).ToList();
            ViewBag.gethoadon2 = list;

        }
        //hoa bó
        public async Task<IActionResult> hoabopage()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoabo2();
            return View(sanpham);
        }
        private void gethoabo2()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 29)

                .Take(30).ToList();
            ViewBag.gethoabo2 = list;

        }
        //hoa cắm bình
        public async Task<IActionResult> hoacambinhpage()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoacambinh2();
            return View(sanpham);
        }
        private void gethoacambinh2()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 30)

                .Take(30).ToList();
            ViewBag.gethoacambinh2 = list;

        }
        //hoa lẵng 
        public async Task<IActionResult> hoalangpage()
        {
            var sanpham = await _context.SanPhams.Take(30).ToListAsync();
            gethoalang2();
            return View(sanpham);
        }
        private void gethoalang2()
        {
            var list = (from c in _context.SanPhams select c).Where(n => n.IdDanhmuc == 31)

                .Take(30).ToList();
            ViewBag.gethoalang2 = list;

        }
        //------------------------------------------------------

        public async Task<IActionResult> Details(int? id)
        {
            List<DonHang> dh = _context.DonHangs.ToList();
            if (id == null)
            {
                return NotFound();
            }
            var sanpham = await _context.SanPhams.FirstOrDefaultAsync(m => m.Masp == id);
            if (sanpham == null)
            {
                return NotFound();
            }
      //    
                //random san pham
                List<SanPham> products = _context.SanPhams.OrderBy(x => Guid.NewGuid()).Take(5).ToList();
                ViewBag.getSPRanDom = products;

            getThuVienAnhList(id);

            return View(sanpham);
        }

        private void getThuVienAnhList(int? id)
        {

            //sp vs thu vien anh
            List<SanPham> sanpham = _context.SanPhams.ToList();
            List<ThuVienAnh> thuvienanh = _context.ThuVienAnhs.ToList();
            var thu = from sp in sanpham
                      join tv in thuvienanh
                              on sp.Idthuvien equals tv.Idthuvien
                      where (sp.Masp == id && sp.Idthuvien == tv.Idthuvien)
                      select new ViewModel
                      {
                          sanpham = sp,
                          thuvienanh = tv
                      };

            ViewBag.getthuvienanh = thu;

        }

        [HttpGet]
        public async Task<IActionResult> Search(string search)
        {
            var searchProduct = from m in _context.SanPhams
                         select m;

            if (!String.IsNullOrEmpty(search))
            {
                searchProduct = searchProduct.Where(s => s.Tensp.Contains(search));
                if (!searchProduct.Any())
                {
                    TempData["nameProduct"] = search;
                    return RedirectToAction("NotFoundProduct", "SanPham");
                }
            }
            else
            {
                return RedirectToAction("NotFoundProduct", "SanPham");
            }

            TempData["nameProduct"] = search;
            return View(await searchProduct.ToListAsync());
        }

        public IActionResult NotFoundProduct()
        {
            return View();
        }

        public async Task<IActionResult> TatCaSanPham(int? pageNumber)
        {
            const int pageSize = 32;

            var products = _context.SanPhams.AsNoTracking();
            var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(products, pageNumber ?? 1, pageSize);

            return View(paginatedProducts);
        }
        //sale
        public async Task<IActionResult> sale(int? pageNumber)
        {
            const int pageSize = 30;

            var products = _context.SanPhams.AsNoTracking();
            var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(products, pageNumber ?? 1, pageSize);

            return View(paginatedProducts);
        }
        //-------------------------------------------------
       
        //------------------------------
        //hoa cảm ơn
        public async Task<IActionResult> pagehoacamon(int? pageNumber)
        {
            const int pageSize = 40;

            var products = _context.SanPhams.AsNoTracking();
            var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(products, pageNumber ?? 1, pageSize);

            return View(paginatedProducts);
        }
        //-----------------------------------------
        //hoa sinh nhật
        public async Task<IActionResult> pagehoasinhnhat(int? pageNumber)
        {
            const int pageSize = 40;

            var products = _context.SanPhams.AsNoTracking();
            var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(products, pageNumber ?? 1, pageSize);

            return View(paginatedProducts);
        }
        //-----------------------------------------
        //hoa sự kiện
        public async Task<IActionResult> pagehoasukien(int? pageNumber)
        {
            const int pageSize = 40;

            var products = _context.SanPhams.AsNoTracking();
            var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(products, pageNumber ?? 1, pageSize);

            return View(paginatedProducts);
        }
        //-----------------------------------------
        //hoa tươi
        public async Task<IActionResult> pagehoatuoi(int? pageNumber)
        {
            const int pageSize = 40;

            var products = _context.SanPhams.AsNoTracking();
            var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(products, pageNumber ?? 1, pageSize);

            return View(paginatedProducts);
        }
        //-----------------------------------------
        //hoa quà tặng
        public async Task<IActionResult> pagehoaquatang(int? pageNumber)
        {
            const int pageSize = 40;

            var products = _context.SanPhams.AsNoTracking();
            var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(products, pageNumber ?? 1, pageSize);

            return View(paginatedProducts);
        }
        //-----------------------------------------
        //hoa tổng hợp
        public async Task<IActionResult> pagehoatonghop(int? pageNumber)
        {
            const int pageSize = 40;

            var products = _context.SanPhams.AsNoTracking();
            var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(products, pageNumber ?? 1, pageSize);

            return View(paginatedProducts);
        }
        //-----------------------------------------
        //hoa cài áo
        public async Task<IActionResult> pagehoacaiao(int? pageNumber)
        {
            const int pageSize = 40;

            var products = _context.SanPhams.AsNoTracking();
            var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(products, pageNumber ?? 1, pageSize);

            return View(paginatedProducts);
        }
        //-----------------------------------------
        //hoa cô dâu
        public async Task<IActionResult> pagehoacodau(int? pageNumber)
        {
            const int pageSize = 40;

            var products = _context.SanPhams.AsNoTracking();
            var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(products, pageNumber ?? 1, pageSize);

            return View(paginatedProducts);
        }
        //-----------------------------------------
        //hoa ngày phụ nữ
        public async Task<IActionResult> pagehoaphunu(int? pageNumber)
        {
            const int pageSize = 40;

            var products = _context.SanPhams.AsNoTracking();
            var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(products, pageNumber ?? 1, pageSize);

            return View(paginatedProducts);
        }
        //-----------------------------------------
        //hoa ngày nhà giáo
        public async Task<IActionResult> pagehoanhagiao(int? pageNumber)
        {
            const int pageSize = 40;

            var products = _context.SanPhams.AsNoTracking();
            var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(products, pageNumber ?? 1, pageSize);

            return View(paginatedProducts);
        }
        //-----------------------------------------
        //page hoa hồng
        public async Task<IActionResult> pagehong(int? pageNumber)
        {
            const int pageSize = 40;

            var products = _context.SanPhams.AsNoTracking();
            var paginatedProducts = await PaginatedList<SanPham>.CreateAsync(products, pageNumber ?? 1, pageSize);

            return View(paginatedProducts);
        }

    }
}
