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
        public ActionResult ConductAssessment(int id)
        {
            var ViewModel = assessmentServices.ConductAssessment(UserId(), id);
            return View(ViewModel);
        }
    }
}