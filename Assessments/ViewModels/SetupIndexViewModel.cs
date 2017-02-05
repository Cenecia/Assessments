using System;
using System.Collections.Generic;
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
        public string Name { get; set; }
    }

    public class SetupIndexAssessmentListItem
    {
        public int ID;
        public string Name;
    }

    public class SetupCreateCategoriesViewModel
    {
        public SetupCreateCategoriesViewModel()
        {
            Categories = new List<SetupCategoryListItem>();
        }

        public string AssessmentName { get; set; }
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
        public string Heading { get; set; }
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
        public string Name { get; set; }
        public SetupQuestionListItem Question { get; set; }
        public SetupAsessmentCheckoffListItem CheckoffItem { get; set; }
        public List<SetupQuestionListItem> Questions { get; set; }
        public List<SetupAssessmentLevelItem> Levels { get; set; }
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
    }
}