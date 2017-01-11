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
    public class TerminiController : Controller
    {
        private readonly UrnikDbContext _context;

        public TerminiController(UrnikDbContext context)
        {
            _context = context;    
        }

        // GET: Termini
        public async Task<IActionResult> Index()
        {
            var urnikDbContext = _context.Termin.Include(t => t.Predmet);
            return View(await urnikDbContext.ToListAsync());
        }

        // GET: Termini/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var termin = await _context.Termin
                .Include(t => t.Predmet)
                .SingleOrDefaultAsync(m => m.TerminId == id);
            if (termin == null)
            {
                return NotFound();
            }

            return View(termin);
        }

        // GET: Termini/Create
        public IActionResult Create()
        {
            ViewData["PredmetId"] = new SelectList(_context.Predmet, "PredmetId", "Naziv");
            return View();
        }

        // POST: Termini/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("TerminId,PredmetId,Zacetek,Konec,Opis")] Termin termin)
        {
            if (ModelState.IsValid)
            {
                _context.Add(termin);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewData["PredmetId"] = new SelectList(_context.Predmet, "PredmetId", "Naziv", termin.PredmetId);
            return View(termin);
        }

        // GET: Termini/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var termin = await _context.Termin.SingleOrDefaultAsync(m => m.TerminId == id);
            if (termin == null)
            {
                return NotFound();
            }
            ViewData["PredmetId"] = new SelectList(_context.Predmet, "PredmetId", "Naziv", termin.PredmetId);
            return View(termin);
        }

        // POST: Termini/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("TerminId,PredmetId,Zacetek,Konec,Opis")] Termin termin)
        {
            if (id != termin.TerminId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(termin);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TerminExists(termin.TerminId))
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
            ViewData["PredmetId"] = new SelectList(_context.Predmet, "PredmetId", "Naziv", termin.PredmetId);
            return View(termin);
        }

        // GET: Termini/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var termin = await _context.Termin
                .Include(t => t.Predmet)
                .SingleOrDefaultAsync(m => m.TerminId == id);
            if (termin == null)
            {
                return NotFound();
            }

            return View(termin);
        }

        // POST: Termini/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var termin = await _context.Termin.SingleOrDefaultAsync(m => m.TerminId == id);
            _context.Termin.Remove(termin);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        private bool TerminExists(int id)
        {
            return _context.Termin.Any(e => e.TerminId == id);
        }
    }
}
