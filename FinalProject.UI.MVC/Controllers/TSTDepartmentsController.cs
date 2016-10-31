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
    [Authorize]
    public class TSTDepartmentsController : Controller
    {
        private TSTEntities db = new TSTEntities();

        [Authorize]
        // GET: TSTDepartments active
        public ActionResult Index()
        {
            var tSTDepartments = db.TSTDepartments.Where(x => x.IsActive == true);
            return View(tSTDepartments.ToList());
        }

        // GET: TSTDepartments inactive
        public ActionResult InactiveDepartments()
        {
            var tSTDepartments = db.TSTDepartments.Where(x => x.IsActive == false);

            return View(tSTDepartments.ToList());
        }

        // GET: TSTDepartments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTDepartment tSTDepartment = db.TSTDepartments.Find(id);
            if (tSTDepartment == null)
            {
                return HttpNotFound();
            }
            return View(tSTDepartment);
        }

        // GET: TSTDepartments/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TSTDepartments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Description,IsActive")] TSTDepartment tSTDepartment)
        {
            if (ModelState.IsValid)
            {
                db.TSTDepartments.Add(tSTDepartment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tSTDepartment);
        }

        // GET: TSTDepartments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTDepartment tSTDepartment = db.TSTDepartments.Find(id);
            if (tSTDepartment == null)
            {
                return HttpNotFound();
            }
            return View(tSTDepartment);
        }

        // POST: TSTDepartments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Description,IsActive")] TSTDepartment tSTDepartment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tSTDepartment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tSTDepartment);
        }

        // GET: TSTDepartments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTDepartment tSTDepartment = db.TSTDepartments.Find(id);
            if (tSTDepartment == null)
            {
                return HttpNotFound();
            }
            return View(tSTDepartment);
        }

        // POST: TSTDepartments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TSTDepartment tSTDepartment = db.TSTDepartments.Find(id);
            //db.TSTDepartments.Remove(tSTDepartment);
            //if (tSTDepartment.IsActive == true)
            //{
            //    tSTDepartment.IsActive = false;
            //}
            //else
            //{
            //    tSTDepartment.IsActive = false;
            //}
            tSTDepartment.IsActive = !tSTDepartment.IsActive;
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
