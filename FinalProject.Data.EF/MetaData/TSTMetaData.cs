using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalProject.Data.EF//.MetaData
{
    public class TSTDepartmentMetaData
    {
        [Required(ErrorMessage = "*Name Is Required.")]
        [Display(Name ="Department")]
        public string Name { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }
    }
    // 3)
    [MetadataType(typeof(TSTDepartmentMetaData))]
    // 2)
    public partial class TSTDepartment { }

    public class TSTEmployeeMetaData
    {
        [Display(Name = "First Name")]
        [Required(ErrorMessage = "*First Name Is Required.")]
        public string Fname { get; set; }

        [Display(Name = "Last Name")]
        [Required(ErrorMessage = "*Last Name Is Required.")]
        public string Lname { get; set; }

        [Required(ErrorMessage = "*Date Of Birth Is Required.")]
        [DisplayFormat(DataFormatString = "{0:d}")]
        [Display(Name = "Date Of Birth")]
        public System.DateTime DOB { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Address1 { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Address2 { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string City { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string State { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Zip { get; set; }

        [Required(ErrorMessage = "*Email Is Required.")]
        public string Email { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Phone { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]", DataFormatString = "{0:d}}")]
        public Nullable<System.DateTime> SeparationDate { get; set; }

        [Display(Name = "Job Title")]
        public string JobTitle { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Image { get; set; }

        [UIHint("MultilineText")]
        public string Note { get; set; }

        public string UserID { get; set; }

        [Display(Name = "Department")]
        public int DeptID { get; set; }

        public int StatusID { get; set; }

    }
    [MetadataType(typeof(TSTEmployeeMetaData))]
    public partial class TSTEmployee {
        public string FullName
        {
             get { return Fname + " " + Lname; }
        }
           
    }

    public class TSTEmployeeStatusMetaData
    {
        [Required(ErrorMessage = "*Name Is Required.")]
        [Display(Name ="Status")]
        public string Name { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }

    }
    [MetadataType(typeof(TSTEmployeeStatusMetaData))]
    public partial class TSTEmployeeStatus { }

    //public partial class TSTTechNotesMetaData
    //{
    //    [UIHint("MultilineText")]
    //    [DisplayFormat(NullDisplayText = "[-N/A-]")]
    //    public string Notes { get; set; }

    //    [Display(Name = "Time Created")]
    //    [DisplayFormat(DataFormatString = "{0:d}")]
    //    public System.DateTime TimeCreated { get; set; }

    //}

    //[MetadataType(typeof(TSTTechNotesMetaData))]
    //public partial class TSTTechNote { }

    public partial class TSTTicketMetaData
    {
        [DisplayFormat(DataFormatString = "{0:d}")]
        public System.DateTime CreatedDate { get; set; }

        [Display(Name = "Resolution Date")]
        [DisplayFormat(NullDisplayText = "[-N/A-]", DataFormatString = "{0:d}")]
        public Nullable<System.DateTime> ResolutionDate { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }

        [Display(Name ="Submited By")]
        public int SubmitedByID { get; set; }

        [Display(Name = "Tech")]
        public Nullable<int> TechID { get; set; }

        [Display(Name = "Statues")]
        public int StatusID { get; set; }

        [Display(Name = "Priority")]
        public int PriorityID { get; set; }



        public string Subject { get; set; }
    }
    [MetadataType(typeof(TSTTicketMetaData))]
    public partial class TSTTicket { }

    public partial class TSTTicketPriorityMetaData
    {
        [Required(ErrorMessage = "*Name Is Required.")]
        [Display(Name = "Priority")]

        public string Name { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }

    }
    [MetadataType(typeof(TSTTicketPriorityMetaData))]
    public partial class TSTTicketPriority { }


    public partial class TSTTicketStatusMetaData
    {
        [Required(ErrorMessage = "*Name Is Required.")]
        public string Name { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }
    }
    [MetadataType(typeof(TSTTicketStatusMetaData))]
    public partial class TSTTicketStatus { }


}
