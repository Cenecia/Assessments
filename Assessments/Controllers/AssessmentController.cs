using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Claims;
using Assessments.ViewModels.AssessmentViewModels;
using Assessments.Services;

namespace Assessments.Controllers
{
    [Authorize]
    public class AssessmentController : BaseController
    {
        private DataServices assessmentServices = new DataServices();

        // GET: Assessment
        public ActionResult Index()
        {
            var ViewModel = new AssessmentIndexViewModel
            {
                AvailableAssessments = assessmentServices.GetUserAssessments(UserId())
            };
            return View(ViewModel);
        }

        [HttpGet]
        public ActionResult ConductAssessment(int id, int? qid = null)
        {
            var ViewModel = assessmentServices.ConductAssessment(UserId(), id, qid);
            return View(ViewModel);
        }

        [HttpPost]
        public ActionResult ConductAssessment(int id, ConductAssessmentViewModel ViewModel)
        {
            var nextQuestionID = assessmentServices.SaveAnswer(UserId(), ViewModel);
            return RedirectToAction("ConductAssessment", new { id = ViewModel.CategoryID, qid = nextQuestionID });
        }
    }
}