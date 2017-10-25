﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Assessments.ViewModels.SetupViewModels;
using Assessments.Services;

namespace Assessments.Controllers
{
    [Authorize(Roles = "Admin")]
    [Authorize(Roles = "ActiveUser")]
    public class SetupController : Controller
    {
        private DataServices assessmentServices = new DataServices();

        // GET: Setup
        public ActionResult Index()
        {
            var ViewModel = new SetupIndexViewModel {
                Assessments = assessmentServices.GetAllAssessments()
            };
            return View(ViewModel);
        }

        public ActionResult CreateAssessment()
        {
            var ViewModel = new SetupEditAssessmentViewModel();
            return View(ViewModel);
        }

        [HttpPost]
        public ActionResult CreateAssessment(SetupEditAssessmentViewModel ViewModel)
        {
            if (ModelState.IsValid)
            {
                int assessmentId = assessmentServices.CreateAssessment(ViewModel.Name);
                return RedirectToAction("CreateAssessmentCategories", new { id = assessmentId, numCategory = ViewModel.NumCategories });
            }

            return View(ViewModel);
        }

        [HttpGet]
        public ActionResult CreateAssessmentCategories(int id, int numCategory)
        {
            var ViewModel = new SetupCreateCategoriesViewModel
            {
                AssessmentName = assessmentServices.GetAssessmentName(id)

            };

            ViewModel.MaxNewCategories -= ViewModel.Categories.Count;

            //add 12 Categories:
            for (int i = 0; i < numCategory; i++)
            {
                ViewModel.Categories.Add(
                    new SetupCategoryListItem
                    {
                        Order = i + 1
                    }
                );
            }

            return View(ViewModel);
        }

        [HttpPost]
        public ActionResult CreateAssessmentCategories(int id, SetupCreateCategoriesViewModel ViewModel)
        {
            assessmentServices.CreateAssessmentCategories(id, ViewModel.Categories.Where(o => o.Name != null).Select(o => o.Name).ToList());
            return RedirectToAction("EditAssessment", new { id = id });
        }

        public ActionResult _AssessmentCategoryItem()
        {
            var ViewModel = new SetupCategoryListItem();
            return View(ViewModel);
        }

        [HttpGet]
        public ActionResult EditAssessment(int id)
        {
            var ViewModel = assessmentServices.GetAssessmentWithCategories(id);
            return View(ViewModel);
        }

        [HttpPost]
        public ActionResult EditAssessment(int id, SetupCreateCategoriesViewModel ViewModel)
        {
            return RedirectToAction("CreateAssessmentCategories", new { id = id, numCategory = ViewModel.NumNewCategories });
        }

        public ActionResult EditCategory(int id, int qid = 0)
        {
            var ViewModel = assessmentServices.FillEditCategoryViewModel(id, qid);
            return View(ViewModel);
        }

        [HttpPost]
        public ActionResult SaveQuestion(int id, int categoryID, SetupQuestionListItem question)
        {
            if (id == 0)
            {
                id = assessmentServices.AddQuestion(categoryID, question.Heading, question.Body, question.QuestonCode);
            }
            else
            {
                assessmentServices.UpdateQuestion(id, question.Heading, question.Body, question.QuestonCode);
            }
            var ViewModel = new SetupEditCategoryViewModel()
            {
                ID = categoryID,
                Questions = assessmentServices.GetQuestions(categoryID)
            };
            ViewModel.Question = ViewModel.Questions.Single(o => o.ID == id);

            return PartialView("_QuestionList", ViewModel);
        }

        [HttpGet]
        public ActionResult EditCheckoffItem(int id)
        {
            var ViewModel = assessmentServices.GetCheckoffItem(id);
            return View(ViewModel);
        }

        [HttpPost]
        public ActionResult EditCheckoffItem(SetupAsessmentCheckoffListItem ViewModel)
        {
            assessmentServices.UpdateCheckoffItem(ViewModel.ID, ViewModel.Wording);
            return RedirectToAction("EditCategory", new { id = ViewModel.AssessmentCategoryID, qid = ViewModel.QuestionID });
        }

        [HttpGet]
        public ActionResult DeleteCheckoffItem(int id)
        {
            var ViewModel = assessmentServices.GetCheckoffItem(id);
            return View(ViewModel);
        }

        [HttpPost]
        public ActionResult DeleteCheckoffItem(SetupAsessmentCheckoffListItem ViewModel)
        {
            assessmentServices.DeleteCheckoffItem(ViewModel.ID);
            return RedirectToAction("EditCategory", new { id = ViewModel.AssessmentCategoryID, qid = ViewModel.QuestionID });
        }

        [HttpPost]
        public ActionResult SaveCheckoffItem(SetupEditCategoryViewModel ViewModel)
        {
            if(ViewModel.ID == 0)
            {
                ViewModel.CheckoffItem.ID = assessmentServices.CreateAssessmentCheckoffItem(ViewModel.CheckoffItem.Wording, ViewModel.CheckoffItem.QuestionID, ViewModel.CheckoffItem.LevelID, 0);
            }
            else
            {
                assessmentServices.UpdateAssessmentCheckoffItem(ViewModel.ID, ViewModel.CheckoffItem.Wording, ViewModel.CheckoffItem.LevelID, 0);
            }

            return PartialView("_CheckoffItem", ViewModel.CheckoffItem);
        }

        [HttpPost]
        public void UpdateAssessment(int id, SetupCreateCategoriesViewModel ViewModel)
        {
            assessmentServices.UpdateAssessment(id, ViewModel.AssessmentName);
        }

        [HttpPost]
        public ActionResult ActivateAssessment(int id)
        {
            assessmentServices.ActivateAssessment(id);
            return RedirectToAction("EditAssessment", new { id = id });
        }

        [HttpPost]
        public void UpdateCategory(int id, SetupEditCategoryViewModel ViewModel)
        {
            assessmentServices.UpdateAssessmentCategory(id, ViewModel.Name);
        }
    }
}