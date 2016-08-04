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
    public class TSTEmployeesController : Controller
    {
        private TSTEntities db = new TSTEntities();

        // GET: TSTEmployees
        public ActionResult Index()
        {
            var tSTEmployees = db.TSTEmployees.Include(t => t.TSTDepartment).Include(t => t.TSTEmployeeStatus);
            return View(tSTEmployees.ToList());
        }

        // GET: TSTEmployees/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTEmployee tSTEmployee = db.TSTEmployees.Find(id);
            if (tSTEmployee == null)
            {
                return HttpNotFound();
            }
            return View(tSTEmployee);
        }

        // GET: TSTEmployees/Create
        public ActionResult Create()
        {
            ViewBag.DeptID = new SelectList(db.TSTDepartments, "ID", "Name");
            ViewBag.StatusID = new SelectList(db.TSTEmployeeStatuses, "ID", "Name");
            return View();
        }

        // POST: TSTEmployees/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Fname,Lname,DOB,Address1,Address2,City,State,Zip,Email,Phone,HireDate,SeparationDate,JobTitle,IsActive,Image,Note,UserID,DeptID,StatusID")] TSTEmployee tSTEmployee)
        {
            if (ModelState.IsValid)
            {
                db.TSTEmployees.Add(tSTEmployee);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DeptID = new SelectList(db.TSTDepartments, "ID", "Name", tSTEmployee.DeptID);
            ViewBag.StatusID = new SelectList(db.TSTEmployeeStatuses, "ID", "Name", tSTEmployee.StatusID);
            return View(tSTEmployee);
        }

        // GET: TSTEmployees/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTEmployee tSTEmployee = db.TSTEmployees.Find(id);
            if (tSTEmployee == null)
            {
                return HttpNotFound();
            }
            ViewBag.DeptID = new SelectList(db.TSTDepartments, "ID", "Name", tSTEmployee.DeptID);
            ViewBag.StatusID = new SelectList(db.TSTEmployeeStatuses, "ID", "Name", tSTEmployee.StatusID);
            return View(tSTEmployee);
        }

        // POST: TSTEmployees/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Fname,Lname,DOB,Address1,Address2,City,State,Zip,Email,Phone,HireDate,SeparationDate,JobTitle,IsActive,Image,Note,UserID,DeptID,StatusID")] TSTEmployee tSTEmployee)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tSTEmployee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DeptID = new SelectList(db.TSTDepartments, "ID", "Name", tSTEmployee.DeptID);
            ViewBag.StatusID = new SelectList(db.TSTEmployeeStatuses, "ID", "Name", tSTEmployee.StatusID);
            return View(tSTEmployee);
        }

        // GET: TSTEmployees/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTEmployee tSTEmployee = db.TSTEmployees.Find(id);
            if (tSTEmployee == null)
            {
                return HttpNotFound();
            }
            return View(tSTEmployee);
        }

        // POST: TSTEmployees/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TSTEmployee tSTEmployee = db.TSTEmployees.Find(id);
            db.TSTEmployees.Remove(tSTEmployee);
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
