using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ISSZnidar.Web.Data;
using ISSZnidar.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace ISSZnidar.Web.Controllers
{
    public class HomeController : Controller
    {
        private UrnikDbContext _context;

        public HomeController(UrnikDbContext context)
        {
            _context = context;
        }

        public IActionResult Index(UrnikViewModel model)
        {
            if (model.PredmetId == default(int))
            {
                model.PredmetId = _context.Predmet.FirstOrDefault().PredmetId;
            }

            model.Termini = _context.Termin.Include(p => p.Predmet).Where(t => t.PredmetId == model.PredmetId).OrderBy(o => o.Zacetek).ToList();

            ViewData["PredmetId"] = new SelectList(_context.Predmet, "PredmetId", "Naziv", model.PredmetId);

            return View(model);


        }


        public IActionResult About()
        {
            ViewData["Message"] = "Spletna aplikacija za prikaz in urejanje šolskega urnika";
            return View();
        }


        public IActionResult Contact()
        {
            return View();
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}
