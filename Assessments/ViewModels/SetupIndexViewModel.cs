using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Assessments.ViewModels.SetupViewModels
{
    public class SetupIndexViewModel
    {
        public SetupIndexViewModel()
        {
            Assessments = new List<SetupIndexAssessmentListItem>();
        }
        public List<SetupIndexAssessmentListItem> Assessments { get; set; }
    }

    public class SetupEditAssessmentViewModel
    {
        [Required]
        [MaxLength(50, ErrorMessage = "Assessment Name must be 50 characters or less")]
        [Display(Name = "Assessment Name")]
        public string Name { get; set; }
    }

    public class SetupIndexAssessmentListItem
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public bool Live { get; set; }
    }

    public class SetupCreateCategoriesViewModel
    {
        public SetupCreateCategoriesViewModel()
        {
            Categories = new List<SetupCategoryListItem>();
            LockedReasons = new List<string>();
        }

        [Required]
        [MaxLength(50)]
        [Display(Name = "Assessment Name")]
        public string AssessmentName { get; set; }
        public bool Live { get; set; }
        public bool CanUnlock { get; set; }
        public List<string> LockedReasons { get; set; }
        public List<SetupCategoryListItem> Categories { get; set; }
    }
    public class SetupCategoryListItem
    {
        public SetupCategoryListItem()
        {
            Questions = new List<SetupQuestionListItem>();
        }

        public int ID { get; set; }
        public int Order { get; set; }

        [MaxLength(50)]
        [Display(Name = "Category Name")]
        public string Name { get; set; }
        public List<SetupQuestionListItem> Questions { get; set; }
    }

    public class SetupQuestionListItem
    {
        public SetupQuestionListItem()
        {
            CheckoffItems = new List<SetupAsessmentCheckoffListItem>();
        }

        public int ID { get; set; }
        [Required]
        [MaxLength(50, ErrorMessage = "Question cannot be more than 50 characters")]
        public string Heading { get; set; }
        [MaxLength(12, ErrorMessage = "Code cannotbe more than 12 characters")]
        public string QuestonCode { get; set; }
        [MaxLength(255, ErrorMessage = "Queston Body must be less than 256 characters long")]
        public string Body { get; set; }
        public List<SetupAsessmentCheckoffListItem> CheckoffItems { get; set; }
        public int CategoryID { get; set; }
        public int QuestionOrder { get; set; }
        
    }

    public class SetupEditCategoryViewModel
    {
        public SetupEditCategoryViewModel()
        {
            Questions = new List<SetupQuestionListItem>();
            Levels = new List<SetupAssessmentLevelItem>();
        }

        public int ID { get; set; }
        public int Order { get; set; }
        [Required]
        [MaxLength(50)]
        [Display(Name = "Category Name")]
        public string Name { get; set; }
        public int AssessmentID { get; set; }
        public bool Live { get; set; }
        public SetupQuestionListItem Question { get; set; }
        public SetupAsessmentCheckoffListItem CheckoffItem { get; set; }
        public List<SetupQuestionListItem> Questions { get; set; }
        public List<SetupAssessmentLevelItem> Levels { get; set; }
        public string GetLevelClass(int order)
        {
            switch (order)
            {
                case 1:
                    return "panel-danger";
                case 2:
                    return "panel-warning";
                case 3:
                    return "panel-info";
                case 4:
                    return "panel-success";
                default:
                    return "panel-primary";
            }
        }
    }

    public class SetupAssessmentLevelItem
    {
        public SetupAssessmentLevelItem()
        {
            CheckoffItems = new List<SetupAsessmentCheckoffListItem>();
        }
        public int ID { get; set; }
        public int Order { get; set; }
        public string Name { get; set; }
        public List<SetupAsessmentCheckoffListItem> CheckoffItems { get; set; }
        public SetupAsessmentCheckoffListItem CheckoffItem { get; set; }
    }

    public class SetupAsessmentCheckoffListItem
    {
        public int  ID { get; set; }
        public int QuestionID { get; set; }
        public int LevelID { get; set; }
        public string Wording { get; set; }
        public int Order { get; set; }
        public int AssessmentCategoryID { get; set; }
    }
}