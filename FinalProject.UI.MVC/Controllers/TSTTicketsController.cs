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
    public class TSTTicketsController : Controller
    {
        private TSTEntities db = new TSTEntities();

        // GET: TSTTickets
        public ActionResult Index()
        {
            var tSTTickets = db.TSTTickets.Include(t => t.TSTEmployee).Include(t => t.TSTEmployee1).Include(t => t.TSTTicketPriority).Include(t => t.TSTTicketStatus);
            return View(tSTTickets.ToList());
        }

        // GET: TSTTickets/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTTicket tSTTicket = db.TSTTickets.Find(id);
            if (tSTTicket == null)
            {
                return HttpNotFound();
            }
            return View(tSTTicket);
        }

        // GET: TSTTickets/Create
        public ActionResult Create()
        {
            ViewBag.SubmitedByID = new SelectList(db.TSTEmployees, "ID", "Fname");
            ViewBag.TechID = new SelectList(db.TSTEmployees, "ID", "Fname");
            ViewBag.PriorityID = new SelectList(db.TSTTicketPriorities, "ID", "Name");
            ViewBag.StatusID = new SelectList(db.TSTTicketStatuses, "ID", "Name");
            return View();
        }

        // POST: TSTTickets/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,SubmitedByID,TechID,CreatedDate,ResolutionDate,Description,StatusID,PriorityID,Subject")] TSTTicket tSTTicket)
        {
            if (ModelState.IsValid)
            {
                db.TSTTickets.Add(tSTTicket);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SubmitedByID = new SelectList(db.TSTEmployees, "ID", "Fname", tSTTicket.SubmitedByID);
            ViewBag.TechID = new SelectList(db.TSTEmployees, "ID", "Fname", tSTTicket.TechID);
            ViewBag.PriorityID = new SelectList(db.TSTTicketPriorities, "ID", "Name", tSTTicket.PriorityID);
            ViewBag.StatusID = new SelectList(db.TSTTicketStatuses, "ID", "Name", tSTTicket.StatusID);
            return View(tSTTicket);
        }

        // GET: TSTTickets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTTicket tSTTicket = db.TSTTickets.Find(id);
            if (tSTTicket == null)
            {
                return HttpNotFound();
            }
            ViewBag.SubmitedByID = new SelectList(db.TSTEmployees, "ID", "Fname", tSTTicket.SubmitedByID);
            ViewBag.TechID = new SelectList(db.TSTEmployees, "ID", "Fname", tSTTicket.TechID);
            ViewBag.PriorityID = new SelectList(db.TSTTicketPriorities, "ID", "Name", tSTTicket.PriorityID);
            ViewBag.StatusID = new SelectList(db.TSTTicketStatuses, "ID", "Name", tSTTicket.StatusID);
            return View(tSTTicket);
        }

        // POST: TSTTickets/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,SubmitedByID,TechID,CreatedDate,ResolutionDate,Description,StatusID,PriorityID,Subject")] TSTTicket tSTTicket)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tSTTicket).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SubmitedByID = new SelectList(db.TSTEmployees, "ID", "Fname", tSTTicket.SubmitedByID);
            ViewBag.TechID = new SelectList(db.TSTEmployees, "ID", "Fname", tSTTicket.TechID);
            ViewBag.PriorityID = new SelectList(db.TSTTicketPriorities, "ID", "Name", tSTTicket.PriorityID);
            ViewBag.StatusID = new SelectList(db.TSTTicketStatuses, "ID", "Name", tSTTicket.StatusID);
            return View(tSTTicket);
        }

        // GET: TSTTickets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTTicket tSTTicket = db.TSTTickets.Find(id);
            if (tSTTicket == null)
            {
                return HttpNotFound();
            }
            return View(tSTTicket);
        }

        // POST: TSTTickets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TSTTicket tSTTicket = db.TSTTickets.Find(id);
            db.TSTTickets.Remove(tSTTicket);
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
