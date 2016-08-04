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
    public class TSTTicketPrioritiesController : Controller
    {
        private TSTEntities db = new TSTEntities();

        // GET: TSTTicketPriorities
        public ActionResult Index()
        {
            return View(db.TSTTicketPriorities.ToList());
        }

        // GET: TSTTicketPriorities/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTTicketPriority tSTTicketPriority = db.TSTTicketPriorities.Find(id);
            if (tSTTicketPriority == null)
            {
                return HttpNotFound();
            }
            return View(tSTTicketPriority);
        }

        // GET: TSTTicketPriorities/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TSTTicketPriorities/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Description")] TSTTicketPriority tSTTicketPriority)
        {
            if (ModelState.IsValid)
            {
                db.TSTTicketPriorities.Add(tSTTicketPriority);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tSTTicketPriority);
        }

        // GET: TSTTicketPriorities/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTTicketPriority tSTTicketPriority = db.TSTTicketPriorities.Find(id);
            if (tSTTicketPriority == null)
            {
                return HttpNotFound();
            }
            return View(tSTTicketPriority);
        }

        // POST: TSTTicketPriorities/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Description")] TSTTicketPriority tSTTicketPriority)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tSTTicketPriority).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tSTTicketPriority);
        }

        // GET: TSTTicketPriorities/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTTicketPriority tSTTicketPriority = db.TSTTicketPriorities.Find(id);
            if (tSTTicketPriority == null)
            {
                return HttpNotFound();
            }
            return View(tSTTicketPriority);
        }

        // POST: TSTTicketPriorities/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TSTTicketPriority tSTTicketPriority = db.TSTTicketPriorities.Find(id);
            db.TSTTicketPriorities.Remove(tSTTicketPriority);
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
