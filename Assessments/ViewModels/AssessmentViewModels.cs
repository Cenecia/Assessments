using System;
using System.Collections.Generic;
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
    }
}