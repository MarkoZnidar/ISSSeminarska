using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ISSZnidar.Web.Data;
using ISSZnidar.Web.Models;

namespace ISSZnidar.Web.Controllers
{
    public class PredmetiController : Controller
    {
        private readonly UrnikDbContext _context;

        public PredmetiController(UrnikDbContext context)
        {
            _context = context;    
        }

        // GET: Predmeti
        public async Task<IActionResult> Index()
        {
            return View(await _context.Predmet.ToListAsync());
        }

        // GET: Predmeti/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var predmet = await _context.Predmet
                .SingleOrDefaultAsync(m => m.PredmetId == id);
            if (predmet == null)
            {
                return NotFound();
            }

            return View(predmet);
        }

        // GET: Predmeti/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Predmeti/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PredmetId,Naziv")] Predmet predmet)
        {
            if (ModelState.IsValid)
            {
                _context.Add(predmet);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(predmet);
        }

        // GET: Predmeti/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var predmet = await _context.Predmet.SingleOrDefaultAsync(m => m.PredmetId == id);
            if (predmet == null)
            {
                return NotFound();
            }
            return View(predmet);
        }

        // POST: Predmeti/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("PredmetId,Naziv")] Predmet predmet)
        {
            if (id != predmet.PredmetId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(predmet);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PredmetExists(predmet.PredmetId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction("Index");
            }
            return View(predmet);
        }

        // GET: Predmeti/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var predmet = await _context.Predmet
                .SingleOrDefaultAsync(m => m.PredmetId == id);
            if (predmet == null)
            {
                return NotFound();
            }

            return View(predmet);
        }

        // POST: Predmeti/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var predmet = await _context.Predmet.SingleOrDefaultAsync(m => m.PredmetId == id);
            _context.Predmet.Remove(predmet);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        private bool PredmetExists(int id)
        {
            return _context.Predmet.Any(e => e.PredmetId == id);
        }
    }
}
