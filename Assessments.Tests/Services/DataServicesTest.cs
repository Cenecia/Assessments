using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Assessments;
using Assessments.Services;

namespace Assessments.Tests.Services
{
    [TestClass]
    public class DataServicesTest
    {
        [TestMethod]
        public void CreateAssessment()
        {
            var services = new DataServices();

            services.CreateAssessment("testAssessment");
        }

        [TestMethod]
        void UpdateAssessment()
        {
            
        }

        [TestMethod]
        void CreateAssessmentCategory()
        {
        }

        [TestMethod]
        void UpdateAssessmentCategory()
        {
        }

        [TestMethod]
        void CreateAssessmentQuestion()
        {
        }

        [TestMethod]
        void UpdateAssessmentQuestion()
        {
        }

        [TestMethod]
        void CreateAssessmentLevel()
        {
        }

        [TestMethod]
        void UpdateAssessmentLevel()
        {
        }

        [TestMethod]
        void CreateAssessmentCheckoffItem()
        {
        }

        [TestMethod]
        void UpdateAssessmentCheckoffItem()
        {
        }
    }
}
