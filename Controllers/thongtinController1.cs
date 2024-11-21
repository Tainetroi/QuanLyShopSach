using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace websitehoa.Controllers
{
    public class thongtinController : Controller
    {
        public IActionResult thongtin()
        {
            return View();
        }
    }
}
