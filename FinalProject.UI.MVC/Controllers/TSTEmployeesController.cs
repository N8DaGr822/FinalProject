using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProject.Data.EF;
// in order to create a user object (from identity) when we creat an Employee object, we need to add reference for Identity, Owin, Models, Identity.EntitiyFramework
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using IdentitySample.Models;


namespace FinalProject.UI.MVC.Controllers
{
    [Authorize]
    public class TSTEmployeesController : Controller
    {
        private TSTEntities db = new TSTEntities();

        // Big gain of connecting the Employees to Identity is getting employee associated with the logged in user.
        // get the employee assoctiated with the logged in user :
        public TSTEmployee GetCurrentEmployee()
        {
            //var currentUserLoggedIn = User.Identity.Name;
            //TSTEmployee e = db.TSTEmployees.FirstOrDefault(x => x.Email == currentUserLoggedIn);
            //return e;
            //more concise code =
            return db.TSTEmployees.FirstOrDefault(x => x.Email == User.Identity.Name);
        }


        // GET: TSTEmployees
        public ActionResult Index()
        {

            // change query to reflect actvie employees

            var tSTEmployees = db.TSTEmployees.Where(e => e.IsActive == true).Include(t => t.TSTDepartment).Include(t => t.TSTEmployeeStatus);
            return View(tSTEmployees.ToList());
        }
        // GET: Inactive Employees
        public ActionResult InactiveEmployees()
        {
            var tSTEmployees = db.TSTEmployees.Where(e => e.IsActive == false).Include(t => t.TSTDepartment).Include(t => t.TSTEmployeeStatus);
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
            // Part of creating the User object when creating an employee is selecting the appropriate role(s). Retrieve the list of roles for THIS APP Identity Owin (Open Web Interface for .Net)
            var RoleManager = HttpContext.GetOwinContext().Get<ApplicationRoleManager>();
            // create Viewbag object to pass to the view to be consumed and populate the CBL. (we will need this in the post as well)
            ViewBag.RoleId = new SelectList(RoleManager.Roles.ToList().OrderBy(r => r.Name), "Name", "Name");

            ViewBag.DeptID = new SelectList(db.TSTDepartments, "ID", "Name");
            ViewBag.StatusID = new SelectList(db.TSTEmployeeStatuses, "ID", "Name");
            return View();
        }

        // POST: TSTEmployees/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Fname,Lname,DOB,Address1,Address2,City,State,Zip,Email,Phone,HireDate,SeparationDate,JobTitle,IsActive,Image,Note,UserID,DeptID,StatusID")]
        TSTEmployee tSTEmployee, string[] selectedRoles, HttpPostedFileBase empImage) // HttpPostedFileBase *View 
        {
            if (ModelState.IsValid)
            {
                #region Create Identity User when Creating an employee
                // similar code can be found in the UserAdmin Create()
                // HttpPost action for the controller

                // create new UserManager object
                var userManager = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
                // create new application user - assign the default Username and password
                var newUser = new ApplicationUser()
                {
                    UserName = tSTEmployee.Email,
                    Email = tSTEmployee.Email
                };
                // usermanager creates the username and password combination
                userManager.Create(newUser, "P@ssw0rd");
                // This actually sets the password for the user. you could go to the Identity.config and configure to email the user their password to them. If you do that, do not forget to setup email in the web.config
                // or in the Identity.config ( no need to do both)


                // add the user to the selected role(s) - make sure we care for a null selection
                if (selectedRoles != null)
                {
                    userManager.AddToRoles(newUser.Id, selectedRoles);
                }
                else
                {
                    // no selection
                    userManager.AddToRole(newUser.Id, "User");
                }

                // assign the tSTEmployee.UserId property and send to the data structure

                tSTEmployee.UserID = newUser.Id;


                #endregion

                #region FileUpload
                //empImage
                //default the value of the imageName to 
                string imageName = "No-Image.svg.png";

                if (empImage != null)
                {
                    //get the filename
                    imageName = empImage.FileName;

                    //use the filename to get the extension
                    string ext = imageName.Substring(imageName.LastIndexOf('.'));

                    // conversation about malicious code
                    // white list
                    string[] goodExts = new string[] { ".png", ".jpg", ".jpeg", ".gif" };

                    if (!goodExts.Contains(ext))
                    {
                        // rename the file using a guid and add the ext
                        imageName = Guid.NewGuid() + ext;

                        // save to the webserver
                        empImage.SaveAs(Server.MapPath("~/Images/EmployeeImages/" + imageName));
                    }
                    else
                    {
                        // if nothing else change image back to no photo
                        imageName = "No-Image.svg.png";
                    }
                    // no matter what, add the image value to the employee object
                    tSTEmployee.Image = imageName;
                }
                #endregion
                db.TSTEmployees.Add(tSTEmployee);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var RoleManager = HttpContext.GetOwinContext().Get<ApplicationRoleManager>();
            // create Viewbag object to pass to the view to be consumed and populate the CBL. (we will need this in the post as well)
            ViewBag.RoleId = new SelectList(RoleManager.Roles.ToList().OrderBy(r => r.Name), "Name", "Name");


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
        public ActionResult Edit([Bind(Include = "ID,Fname,Lname,DOB,Address1,Address2,City,State,Zip,Email,Phone,HireDate,SeparationDate,JobTitle,IsActive,Image,Note,UserID,DeptID,StatusID")]
        TSTEmployee tSTEmployee, HttpPostedFileBase empImage)
        {
            if (ModelState.IsValid)
            {
                #region FileUpload
                //empImage
                //default the value of the imageName to 
                //string imageName = tSTEmployee.Image;

                if (empImage != null)
                {
                    //get the filename
                    string imageName = empImage.FileName;

                    //use the filename to get the extension
                    string ext = imageName.Substring(imageName.LastIndexOf('.')).ToLower();

                    // conversation about malicious code
                    // white list
                    string[] goodExts = new string[] { ".png", ".jpg", ".jpeg", ".gif" };

                    if (goodExts.Contains(ext))
                    {
                        // rename the file using a guid and add the ext
                        imageName = Guid.NewGuid() + ext;

                        // save to the webserver
                        empImage.SaveAs(Server.MapPath("~/Images/EmployeeImages/" + imageName));
                        tSTEmployee.Image = imageName;

                    }
                    else
                    {
                        // if nothing else change image back to no photo
                        imageName = "No-Image.svg.png";
                    }

                }
                #endregion

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
            //db.TSTEmployees.Remove(tSTEmployee);
            tSTEmployee.IsActive = !tSTEmployee.IsActive;
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
