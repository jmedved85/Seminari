using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Seminari.Models;

namespace Seminari.Controllers
{
    public class PredavacsController : Controller
    {
        private readonly BazaSeminariContext _context;

        public PredavacsController(BazaSeminariContext context)
        {
            _context = context;
        }

        // GET: Predavacs
        public async Task<IActionResult> Index()
        {
            return View(await _context.Predavacs.ToListAsync());
        }

        // GET: Predavacs/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var predavac = await _context.Predavacs
                .FirstOrDefaultAsync(m => m.IdPredavac == id);
            if (predavac == null)
            {
                return NotFound();
            }

            return View(predavac);
        }

        // GET: Predavacs/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Predavacs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdPredavac,Ime,Prezime")] Predavac predavac)
        {
            if (ModelState.IsValid)
            {
                _context.Add(predavac);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(predavac);
        }

        // GET: Predavacs/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var predavac = await _context.Predavacs.FindAsync(id);
            if (predavac == null)
            {
                return NotFound();
            }
            return View(predavac);
        }

        // POST: Predavacs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdPredavac,Ime,Prezime")] Predavac predavac)
        {
            if (id != predavac.IdPredavac)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(predavac);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PredavacExists(predavac.IdPredavac))
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
            return View(predavac);
        }

        // GET: Predavacs/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var predavac = await _context.Predavacs
                .FirstOrDefaultAsync(m => m.IdPredavac == id);
            if (predavac == null)
            {
                return NotFound();
            }

            return View(predavac);
        }

        // POST: Predavacs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var predavac = await _context.Predavacs.FindAsync(id);
            _context.Predavacs.Remove(predavac);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PredavacExists(int id)
        {
            return _context.Predavacs.Any(e => e.IdPredavac == id);
        }
    }
}
