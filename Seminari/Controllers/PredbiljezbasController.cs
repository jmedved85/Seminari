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
    public class PredbiljezbasController : Controller
    {
        private readonly BazaSeminariContext _context;

        public PredbiljezbasController(BazaSeminariContext context)
        {
            _context = context;
        }

        [Authorize]

        // GET: Predbiljezbas
        public async Task<IActionResult> Index(string pretraga)
        {
            var rezultat = from r in _context.Predbiljezbas
                           select r;

            if (!string.IsNullOrEmpty(pretraga))
            {
                rezultat = rezultat.Where(p => p.Ime.Contains(pretraga) 
                    || p.Prezime.Contains(pretraga) 
                    || p.IdSeminarNavigation.Naziv.Contains(pretraga));                   
            }

           // var bazaSeminariContext = _context.Predbiljezbas.Include(p => p.IdSeminarNavigation);
           // return View(await bazaSeminariContext.ToListAsync());

            return View(await rezultat.Include(s => s.IdSeminarNavigation).ToListAsync());
        }

        // GET: Predbiljezbas/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var predbiljezba = await _context.Predbiljezbas
                .Include(p => p.IdSeminarNavigation)
                .FirstOrDefaultAsync(m => m.IdPredbiljezba == id);
            if (predbiljezba == null)
            {
                return NotFound();
            }

            return View(predbiljezba);
        }

        // GET: Predbiljezbas/Create
        public IActionResult Create()
        {
            ViewData["IdSeminar"] = new SelectList(_context.Seminars, "IdSeminar", "Naziv");
            return View();
        }

        // POST: Predbiljezbas/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdPredbiljezba,Ime,Prezime,Adresa,Email,Telefon,Datum,IdSeminar,Status")] Predbiljezba predbiljezba)
        {
            if (ModelState.IsValid)
            {
                _context.Add(predbiljezba);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdSeminar"] = new SelectList(_context.Seminars, "IdSeminar", "Naziv", predbiljezba.IdSeminar);
            return View(predbiljezba);
        }


        // ODABERI

        public IActionResult Odaberi(int? id)
        {
            ViewData["IdSeminar"] = new SelectList(_context.Seminars, "IdSeminar", "Naziv", id);
            
            //var odabir = _context.Predbiljezbas.Where(p => p.IdSeminar == id).FirstOrDefault();
            //if (id == null)
            //{
            //    return NotFound();
            //}

            //ViewBag.Odabir = odabir;

            //var seminar = _context.Seminars                
            //  .FirstOrDefault(m => m.IdSeminar == id);

            //if (seminar == null)
            //{
            //    return NotFound();
            //}           


            return View();         
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Odaberi([Bind("IdSeminar, Ime, Prezime, Adresa, Email, Telefon")] Predbiljezba pr)
        {
            if (ModelState.IsValid)
            {
                _context.Add(pr);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            return View(pr);
        }

        // GET: Predbiljezbas/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var predbiljezba = await _context.Predbiljezbas.FindAsync(id);
            if (predbiljezba == null)
            {
                return NotFound();
            }
            ViewData["IdSeminar"] = new SelectList(_context.Seminars, "IdSeminar", "Naziv", predbiljezba.IdSeminar);
            return View(predbiljezba);
        }

        // POST: Predbiljezbas/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdPredbiljezba,Ime,Prezime,Adresa,Email,Telefon,Datum,IdSeminar,Status")] Predbiljezba predbiljezba)
        {
            if (id != predbiljezba.IdPredbiljezba)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(predbiljezba);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PredbiljezbaExists(predbiljezba.IdPredbiljezba))
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
            ViewData["IdSeminar"] = new SelectList(_context.Seminars, "IdSeminar", "Naziv", predbiljezba.IdSeminar);
            return View(predbiljezba);
        }

        // GET: Predbiljezbas/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var predbiljezba = await _context.Predbiljezbas
                .Include(p => p.IdSeminarNavigation)
                .FirstOrDefaultAsync(m => m.IdPredbiljezba == id);
            if (predbiljezba == null)
            {
                return NotFound();
            }

            return View(predbiljezba);
        }

        // POST: Predbiljezbas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var predbiljezba = await _context.Predbiljezbas.FindAsync(id);
            _context.Predbiljezbas.Remove(predbiljezba);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PredbiljezbaExists(int id)
        {
            return _context.Predbiljezbas.Any(e => e.IdPredbiljezba == id);
        }
    }
}
