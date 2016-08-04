using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProject.Data.EF;

namespace FinalProject.UI.MVC.Controllers
{
    public class TSTTechNotesController : Controller
    {
        private TSTEntities db = new TSTEntities();

        // GET: TSTTechNotes
        public ActionResult Index()
        {
            var tSTTechNotes = db.TSTTechNotes.Include(t => t.TSTEmployee).Include(t => t.TSTTicket);
            return View(tSTTechNotes.ToList());
        }

        // GET: TSTTechNotes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTTechNote tSTTechNote = db.TSTTechNotes.Find(id);
            if (tSTTechNote == null)
            {
                return HttpNotFound();
            }
            return View(tSTTechNote);
        }

        // GET: TSTTechNotes/Create
        public ActionResult Create()
        {
            ViewBag.TechID = new SelectList(db.TSTEmployees, "ID", "Fname");
            ViewBag.TicketID = new SelectList(db.TSTTickets, "ID", "Description");
            return View();
        }

        // POST: TSTTechNotes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,TechID,TicketID,Notes,TimeCreated")] TSTTechNote tSTTechNote)
        {
            if (ModelState.IsValid)
            {
                db.TSTTechNotes.Add(tSTTechNote);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TechID = new SelectList(db.TSTEmployees, "ID", "Fname", tSTTechNote.TechID);
            ViewBag.TicketID = new SelectList(db.TSTTickets, "ID", "Description", tSTTechNote.TicketID);
            return View(tSTTechNote);
        }

        // GET: TSTTechNotes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTTechNote tSTTechNote = db.TSTTechNotes.Find(id);
            if (tSTTechNote == null)
            {
                return HttpNotFound();
            }
            ViewBag.TechID = new SelectList(db.TSTEmployees, "ID", "Fname", tSTTechNote.TechID);
            ViewBag.TicketID = new SelectList(db.TSTTickets, "ID", "Description", tSTTechNote.TicketID);
            return View(tSTTechNote);
        }

        // POST: TSTTechNotes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,TechID,TicketID,Notes,TimeCreated")] TSTTechNote tSTTechNote)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tSTTechNote).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TechID = new SelectList(db.TSTEmployees, "ID", "Fname", tSTTechNote.TechID);
            ViewBag.TicketID = new SelectList(db.TSTTickets, "ID", "Description", tSTTechNote.TicketID);
            return View(tSTTechNote);
        }

        // GET: TSTTechNotes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTTechNote tSTTechNote = db.TSTTechNotes.Find(id);
            if (tSTTechNote == null)
            {
                return HttpNotFound();
            }
            return View(tSTTechNote);
        }

        // POST: TSTTechNotes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TSTTechNote tSTTechNote = db.TSTTechNotes.Find(id);
            db.TSTTechNotes.Remove(tSTTechNote);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
