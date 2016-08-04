using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalProject.Data.EF// 1).MetaData
{
    public class TSTDepartmentsMetaData
    {
        [Required(ErrorMessage = "*Name Is Required.")]
        public string Name { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }

        [Display(Name = "Is Active")]
        public bool IsActive { get; set; }
    }
    // 3)
    [MetadataType(typeof(TSTDepartmentsMetaData))]
    // 2)
    public partial class TSTDepartment { }

    public class TSTEmployeesMetaData
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

        public int DeptID { get; set; }

        public int StatusID { get; set; }

    }
    [MetadataType(typeof(TSTEmployeesMetaData))]
    public partial class TSTEmployee { }
    
    public class TSTEmployeeStatusesMetaData
    {
        [Required(ErrorMessage = "*Name Is Required.")]
        public string Name { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }

    }
    [MetadataType(typeof(TSTEmployeeStatusesMetaData))]
    public partial class TSTEmployeeStatus { }

    public partial class TSTTechNotesMetaData
    {
        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Notes { get; set; }

        [Display(Name = "Time Created")]
        [DisplayFormat(DataFormatString = "{0:d}")]
        public System.DateTime TimeCreated { get; set; }

    }

    [MetadataType(typeof(TSTTechNotesMetaData))]
    public partial class TSTTechNote { }

    public partial class TSTTicketsMetaData
    {
        [DisplayFormat(DataFormatString = "{0:d}")]
        public System.DateTime CreatedDate { get; set; }

        [Display(Name = "Resolution Date")]
        [DisplayFormat(NullDisplayText = "[-N/A-]",DataFormatString = "{0:d}")]
        public Nullable<System.DateTime> ResolutionDate { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }


        public string Subject { get; set; }
    }
    [MetadataType(typeof(TSTTicketsMetaData))]
    public partial class TSTTicket { }

    public partial class TSTTicketPrioritysMetaData
    {
        [Required(ErrorMessage = "*Name Is Required.")]
        public string Name { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }

    }
    [MetadataType(typeof(TSTTicketPrioritysMetaData))]
    public partial class TSTTicketPriority { }


    public partial class TSTTicketStatusesMetaData
    {
        [Required(ErrorMessage = "*Name Is Required.")]
        public string Name { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }
    }
    [MetadataType(typeof(TSTTicketStatusesMetaData))]
    public partial class TSTTicketStatus { }
















}
