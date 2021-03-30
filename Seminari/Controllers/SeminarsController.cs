using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Seminari.Models;

namespace Seminari.Controllers
{
    [Authorize]
    public class SeminarsController : Controller
    {
        private readonly BazaSeminariContext _context;

        public SeminarsController(BazaSeminariContext context)
        {
            _context = context;
        }

        // GET: Seminars
        public async Task<IActionResult> Index(string pretraga)
        {
            var rezultat = from r in _context.Seminars
                           select r;

            if (!string.IsNullOrEmpty(pretraga))
            {
                rezultat = rezultat.Where(p => p.Naziv.Contains(pretraga));
            }

            var dbSeminars = await _context.Seminars.ToListAsync();

            var zbrojPolaznika = (from x in dbSeminars
                                  join y in _context.Predbiljezbas
                                  on x.IdSeminar equals y.IdSeminar
                                  orderby x.IdSeminar
                                  select x.IdSeminar).Count();

            //var bazaSeminariContext = _context.Seminars.Include(s => s.IdPredavacNavigation);
            //return View(await bazaSeminariContext.ToListAsync());

           // return View(zbrojPolaznika);

            return View(await rezultat.Include(s => s.IdPredavacNavigation).ToListAsync());
        }

        // GET: Seminars/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var seminar = await _context.Seminars
                .Include(s => s.IdPredavacNavigation)
                .FirstOrDefaultAsync(m => m.IdSeminar == id);
            if (seminar == null)
            {
                return NotFound();
            }

            return View(seminar);
        }

        // GET: Seminars/Create
        public IActionResult Create()
        {
            ViewData["IdPredavac"] = new SelectList(_context.Predavacs, "IdPredavac", "ImePrezime", "Prezime");
            return View();
        }

        // POST: Seminars/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdSeminar,Naziv,Opis,Datum,Popunjen,IdPredavac")] Seminar seminar)
        {
            if (ModelState.IsValid)
            {
                _context.Add(seminar);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdPredavac"] = new SelectList(_context.Predavacs, "IdPredavac", "ImePrezime", seminar.IdPredavac);
            return View(seminar);
        }

        // GET: Seminars/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var seminar = await _context.Seminars.FindAsync(id);
            if (seminar == null)
            {
                return NotFound();
            }
            ViewData["IdPredavac"] = new SelectList(_context.Predavacs, "IdPredavac", "ImePrezime", seminar.IdPredavac);
            return View(seminar);
        }

        // POST: Seminars/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdSeminar,Naziv,Opis,Datum,Popunjen,IdPredavac")] Seminar seminar)
        {
            if (id != seminar.IdSeminar)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(seminar);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SeminarExists(seminar.IdSeminar))
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
            ViewData["IdPredavac"] = new SelectList(_context.Predavacs, "IdPredavac", "ImePrezime", seminar.IdPredavac);
            return View(seminar);
        }

        // GET: Seminars/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var seminar = await _context.Seminars
                .Include(s => s.IdPredavacNavigation)
                .FirstOrDefaultAsync(m => m.IdSeminar == id);
            if (seminar == null)
            {
                return NotFound();
            }

            return View(seminar);
        }

        // POST: Seminars/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var seminar = await _context.Seminars.FindAsync(id);
            _context.Seminars.Remove(seminar);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool SeminarExists(int id)
        {
            return _context.Seminars.Any(e => e.IdSeminar == id);
        }
    }
}
