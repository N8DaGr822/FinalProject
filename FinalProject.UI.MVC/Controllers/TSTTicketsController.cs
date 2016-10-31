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
    public class TSTTicketsController : Controller
    {
        private TSTEntities db = new TSTEntities();

        #region Get Current Employee






        #endregion

        #region AddTechNote()

        /// <summary>
        /// Notation Information:
        /// This is the method that is going to be called by jQuery/Ajax from the edit view to add the note on the fly AND post it to the notes section BEFORE submitting the form. 
        /// 
        /// AJAX - Asynchronous JavaScript and XML (makes calles without reloading page)
        /// 
        /// </summary>

        public JsonResult AddTechNote(int ticketID, string note)
        {
            // get the ticketID passed in to the method and get the associated record
            TSTTicket ticket = db.TSTTickets.Single(x => x.ID == ticketID);
            // Get the current logged on employee ( who is working the ticket)
            TSTEmployee tech = db.TSTEmployees.Single(x => x.Email == User.Identity.Name); // this code requires all employees are associated to a user ID in Identity
            // This code only works because we associated the TSTEmployee table to the Identity AspNetUser Table


            // make sure the tech is not null
            if (tech != null)
            {
                // create TstNote object and submit 
                TSTTechNote newNote = new TSTTechNote()
                {
                    // Property is assigned a value
                    TicketID = ticketID, // passed thru the method
                    TechID = tech.ID, // derived from employee above
                    TimeCreated = DateTime.Now, // hard coded
                    Notes = note // passed in thru the method
                };
                // add note record to the table
                db.TSTTechNotes.Add(newNote);
                db.SaveChanges();

                //return data to the view to be displayed. This NEVER hits the webserver, so jQuery has NO IDEA what a TSTTechNote. 
                // We send over data that can be parsed by jQuery.
                var data = new
                {
                   // On the Fly Variable = newNote.Property,
                   TechNotes = newNote.Notes,
                   Tech = newNote.TSTEmployee.Fname,
                   Date = string.Format("{0:g}",newNote.TimeCreated)     
                   // never hits webserver so formatting is done here
                };
                // send note information back to the browser for jQuery to parse
                return Json(data, JsonRequestBehavior.AllowGet);
            }
            return null;

        }
        #endregion

        // GET: TSTTickets
        public ActionResult Index()
        {
            var tSTTickets = db.TSTTickets.Include(t => t.TSTEmployee).Include(t => t.TSTEmployee1).Include(t => t.TSTTicketPriority).Include(t => t.TSTTicketStatus);
            if (!User.IsInRole("Admin"))
            {
                tSTTickets = tSTTickets.Where(t => t.StatusID != 8 && t.StatusID != 9);
            }

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
            //ViewBag.SubmitedByID = new SelectList(db.TSTEmployees, "ID", "Fname");
            //ViewBag.TechID = new SelectList(db.TSTEmployees, "ID", "Fname");
            //ViewBag.PriorityID = new SelectList(db.TSTTicketPriorities, "ID", "Name");
            //ViewBag.StatusID = new SelectList(db.TSTTicketStatuses, "ID", "Name");

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
                TSTEmployee e = db.TSTEmployees.FirstOrDefault(x => x.Email == User.Identity.Name);
                tSTTicket.SubmitedByID = e.ID;
                tSTTicket.CreatedDate = DateTime.Now;
                tSTTicket.StatusID = 1;
                tSTTicket.PriorityID = 3;


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
            ViewBag.TechID = new SelectList(db.TSTEmployees.Where(e => e.TSTDepartment.ID == 7), "ID", "Fname", tSTTicket.TechID);
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
            ViewBag.TechID = new SelectList(db.TSTEmployees.Where(e => e.TSTDepartment.ID == 7), "ID", "Fname", tSTTicket.TechID);
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
