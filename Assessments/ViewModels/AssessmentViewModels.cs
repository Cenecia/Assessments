using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Assessments.ViewModels.AssessmentViewModels
{
    public class AssessmentIndexViewModel
    {
        public List<AssessmentListItem> AvailableAssessments { get; set; }
    }

    public  class AssessmentListItem
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public bool Started { get; set; }
        public List<AnswerCategoryListItem> Categories { get; set; }
    }

    public class ConductAssessmentViewModel
    {
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
        public List<AnswerQuestonViewModel> Questions { get; set; }
        public AnswerQuestonViewModel Question { get; set; }
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
                    return "panel-default";
            }
        }
    }

    public class AnswerQuestonViewModel
    {
        public int ID { get; set; }
        public string QuestionHeading { get; set; }
        public string QuestionBody { get; set; }
        [MaxLength(255, ErrorMessage = "Comment must be less than 256 characters long.")]
        public string Comment { get; set; }
        public List<AnswerLevelListItem> Levels { get; set; }
    }

    public class AnswerCheckoffItem
    {
        public int ID { get; set; }
        public int LevelID { get; set; }
        public string Wording { get; set; }
        public bool Checked { get; set; }
    }

    public class AnswerCategoryListItem
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public bool Started { get; set; }
    }

    public class AnswerLevelListItem
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int LevelOrder { get; set; }
        public List<AnswerCheckoffItem> CheckoffItems { get; set; }
    }
}