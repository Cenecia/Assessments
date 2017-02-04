using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Assessments.Models;
using Assessments.ViewModels.SetupViewModels;
using Assessments.ViewModels.AssessmentViewModels;

namespace Assessments.Services
{
    public class DataServices
    {
        private Entities db = new Entities();

#region Setup
        public int CreateAssessment(string name)
        {
            var newAssessment = new AssessmentCollection
            {
                Translation = new Translation { EN = name }
            };
            db.AssessmentCollections.Add(newAssessment);
            db.SaveChanges();
            return newAssessment.ID;
        }

        public void UpdateAssessment(int id, string name)
        {
            var Translation = db.AssessmentCollections.Single(o => o.ID == id).Translation;
            Translation.EN = name;
            db.SaveChanges();
        }

        public void CreateAssessmentCategory(string name, int assessmentId)
        {
            db.AssessmentCategories.Add(
                new AssessmentCategory
                {
                    Translation = new Translation { EN = name },
                    AssessmentCollectionID = assessmentId
                }
            );
            db.SaveChanges();
        }

        public void UpdateAssessmentCategory(int id, string name)
        {
            var Translation = db.AssessmentCategories.Single(o => o.ID == id).Translation;
            Translation.EN = name;
            db.SaveChanges();
        }


        public void CreateAssessmentLevel(string name, int order)
        {
            db.AssessmentLevels.Add(
                new AssessmentLevel
                {
                    Translation = new Translation { EN = name },
                    LevelOrder = order
                }
            );
            db.SaveChanges();
        }

        public void UpdateAssessmentLevel(int id, string name)
        {
            var Translation = db.AssessmentLevels.Single(o => o.ID == id).Translation;
            Translation.EN = name;
            db.SaveChanges();
        }

        public int CreateAssessmentCheckoffItem(string wording, int questionId, int levelId, int order)
        {
            var checkoffItem = new Assessments.Models.AssessmentCheckoffItem
            {
                Translation = new Translation { EN = wording },
                AssessmentQuestionID = questionId,
                AssessmentLevelID = levelId,
                CheckOffItemOrder = order
            };
            db.AssessmentCheckoffItems.Add(
              checkoffItem  
            );
            db.SaveChanges();
            return checkoffItem.ID;
        }

        public void UpdateAssessmentCheckoffItem(int id, string wording, int levelId, int order)
        {
            var Item = db.AssessmentCheckoffItems.Single(o => o.ID == id);
            Item.AssessmentLevelID = levelId;
            Item.CheckOffItemOrder = order;
            Item.Translation.EN = wording;
            db.SaveChanges();
        }

        public List<SetupIndexAssessmentListItem> GetAllAssessments()
        {
            return db.AssessmentCollections.Select(o => 
                new SetupIndexAssessmentListItem
                {
                    ID = o.ID,
                    Name = o.Translation.EN
                }
            ).ToList();
        }

        public string GetAssessmentName(int id)
        {
            return db.AssessmentCollections.Single(o => o.ID == id).Translation.EN;
        }

        public void CreateAssessmentCategories(int id, List<string> categories)
        {
            categories.ForEach(o =>
                db.AssessmentCategories.Add(
                    new AssessmentCategory
                    {
                        AssessmentCollectionID = id,
                        Translation =
                            new Translation
                            {
                                EN = o
                            }
                    }
                )
            );
            db.SaveChanges();
        }

        public SetupCreateCategoriesViewModel GetAssessmentWithCategories(int id)
        {
            var Assessment = db.AssessmentCollections.Single(o => o.ID == id);
            var ViewModel = new SetupCreateCategoriesViewModel
            {
                AssessmentName = Assessment.Translation.EN
            };

            ViewModel.Categories = 
                Assessment.AssessmentCategories.Select(o => 
                    new SetupCategoryListItem
                    {
                        Name = o.Translation.EN,
                        ID = o.ID
                    }
                ).ToList();

            return ViewModel;
        }

        public SetupEditCategoryViewModel FillEditCategoryViewModel(int id, int questionID)
        {
            var category = db.AssessmentCategories.Single(o => o.ID == id);
            var ViewModel = new SetupEditCategoryViewModel
            {
                ID = id,
                Levels = db.AssessmentLevels.Select(o =>
                    new SetupAssessmentLevelItem
                    {
                        ID = o.ID,
                        Name = o.Translation.EN,
                        Order = o.LevelOrder,
                        CheckoffItems = o.AssessmentCheckoffItems.Where(x => x.AssessmentQuestionID == questionID).Select(x => 
                            new SetupAsessmentCheckoffListItem
                            {
                                ID = x.ID,
                                LevelID = o.ID,
                                QuestionID = x.AssessmentQuestionID,
                                Wording = x.Translation.EN
                            }
                        ).ToList()
                    }
                ).ToList(),
                Questions = !category.AssessmentQuestions.Any() 
                    ? new List<SetupQuestionListItem>()
                    : category.AssessmentQuestions.Select(o => 
                    new SetupQuestionListItem
                    {
                        ID = o.ID,
                        Heading = o.Translation.EN,
                        Body = o.Translation1.EN,
                        CategoryID = o.AssessmentCategoryID
                    }
                    ).ToList(),
                Question = questionID == 0 
                    ? new SetupQuestionListItem()
                    : category.AssessmentQuestions.Where(o => o.ID == questionID).Select(o => 
                        new SetupQuestionListItem
                        {
                            ID = o.ID,
                            Heading = o.Translation.EN,
                            Body = o.Translation1.EN
                        }
                    ).Single()
            };
            ViewModel.Name = category.Translation.EN;

            if (questionID == 0)
                ViewModel.Questions.Add(new SetupQuestionListItem());
            else
            {
                ViewModel.CheckoffItem = new SetupAsessmentCheckoffListItem { QuestionID = questionID };
            }

            return ViewModel;
        }

        public int AddQuestion(int id, string heading, string body)
        {
            var question = new AssessmentQuestion
            {
                AssessmentCategoryID = id,
                Translation = new Translation { EN = heading },
                Translation1 = new Translation { EN = body }
            };
            db.AssessmentQuestions.Add(question);
            db.SaveChanges();
            return question.ID;
        }

        public void UpdateQuestion(int id, string heading, string body)
        {
            var question = db.AssessmentQuestions.Single(o => o.ID == id);
            question.Translation.EN = heading != null ? heading : question.Translation.EN;
            question.Translation1.EN = body != null ? body : question.Translation1.EN;
            db.SaveChanges();
        }

        public int AddCheckoffItem(int id, int levelID, string wording)
        {
            var checkoffItem = new Assessments.Models.AssessmentCheckoffItem
            {
                AssessmentQuestionID = id,
                AssessmentLevelID = levelID,
                Translation = new Translation { EN = wording }
            };
            db.AssessmentCheckoffItems.Add(checkoffItem);
            db.SaveChanges();
            return checkoffItem.ID;
        }

        public List<SetupQuestionListItem> GetQuestions(int id)
        {
            return db.AssessmentQuestions.Where(o => o.AssessmentCategoryID == id).Select(o => 
                new SetupQuestionListItem
                {
                    ID = o.ID,
                    Heading = o.Translation.EN,
                    Body = o.Translation1.EN,
                    CategoryID = o.AssessmentCategoryID
                }
            ).ToList();
        }
#endregion

        public List<AssessmentListItem> GetUserAssessments(string userid)
        {
            return db.AssessmentCollections.Select(o => 
                new AssessmentListItem
                {
                    ID = o.ID,
                    Title = o.Translation.EN,
                    Started = o.UserAssessments.Any(x => x.UserDetail.UserId == userid),
                    Categories = o.AssessmentCategories.Select(x => 
                        new AnswerCategoryListItem {
                            ID = x.ID,
                            Name = x.Translation.EN,
                            Started = x.UserAssessmentCategories.Any(y => y.UserAssessment.UserDetail.UserId == userid)
                        }).ToList()
                }
            ).ToList();
        }

        public ConductAssessmentViewModel ConductAssessment(string userid, int id, int? questionID)
        {
            var ViewModel = new ConductAssessmentViewModel
            {
                CategoryID = id
            };
            
            //next unanswered question if any
            var nextQuestion = db.AssessmentQuestions.FirstOrDefault(o =>
                o.AssessmentCategoryID == id
                && !o.UserAssessmentQuestions.Any(x =>
                    x.UserAssessmentCategory.UserAssessment.UserDetail.UserId == userid)
            );
            if (nextQuestion == null)
                nextQuestion = db.AssessmentQuestions.First(o => o.AssessmentCategoryID == id);

            var levels = db.AssessmentLevels.ToList();
            var Question = questionID == null ? nextQuestion : db.AssessmentQuestions.Single(o => o.ID == questionID);
            var AssessmentQuestion = db.AssessmentQuestions.Where(o => o.ID == Question.ID).Single();
            ViewModel.Question = 
                new AnswerQuestonViewModel
                {
                    ID = AssessmentQuestion.ID,
                    QuestionHeading = AssessmentQuestion.Translation.EN,
                    QuestionBody = AssessmentQuestion.Translation1.EN,
                    Levels = levels.Select(o => new AnswerLevelListItem {
                        ID = o.ID,
                        Name  = o.Translation.EN,
                        CheckoffItems = AssessmentQuestion.AssessmentCheckoffItems.Where(x => x.AssessmentLevelID == o.ID).Select(x =>
                        new AnswerCheckoffItem {
                            ID = x.ID,
                            LevelID = o.ID,
                            Wording = x.Translation.EN,
                            Checked = x.UserAssessmentCheckoffItems.Any(y => y.AssessmentCheckoffItemID == x.ID && y.Checked)
                        }).ToList()
                    }).ToList()
                };

            ViewModel.Questions = 
                AssessmentQuestion.AssessmentCategory.AssessmentQuestions.Select(o =>
                    new AnswerQuestonViewModel
                    {
                        ID = o.ID,
                        QuestionHeading = o.Translation.EN,
                        QuestionBody = o.Translation1.EN
                    }
                ).OrderBy(o => o.ID).ToList();

            var Answer = 
                AssessmentQuestion.UserAssessmentQuestions.SingleOrDefault(o => 
                    o.AssessmentQuestionID == Question.ID 
                    && o.UserAssessmentCategory.UserAssessment.UserDetail.UserId == userid
                );

            if(Answer != null)
            {
                ViewModel.Question.Comment = Answer.Comments;
            }

            return ViewModel;
        }

        public int SaveAnswer(string userid, ConductAssessmentViewModel ViewModel)
        {
            var answer = db.UserAssessmentQuestions.SingleOrDefault(o => o.UserAssessmentCategory.UserAssessment.UserDetail.UserId == userid 
                                                                         && o.AssessmentQuestionID == ViewModel.Question.ID);
            if(answer != null)
            {
                var checkoffItems = answer.UserAssessmentCheckoffItems.ToList();
                foreach(var item in ViewModel.Question.Levels.SelectMany(o => o.CheckoffItems))
                {
                    if(checkoffItems.Any(x => x.AssessmentCheckoffItemID == item.ID))
                    {
                        if (item.Checked)
                        {
                            checkoffItems.Single(o => o.AssessmentCheckoffItemID == item.ID).Checked = true;
                        }
                        else
                        {
                            checkoffItems.Remove(checkoffItems.Single(o => o.AssessmentCheckoffItemID == item.ID));
                        }
                    }
                    else if(item.Checked)
                    {
                        checkoffItems.Add(new UserAssessmentCheckoffItem { AssessmentCheckoffItemID = item.ID, UserAssessmentQuestionID = answer.ID });
                    }

                }
                db.SaveChanges();
            }
            else
            {
                var checkoffitemid = ViewModel.Question.Levels.SelectMany(y => y.CheckoffItems).First().ID;
                var question = 
                    db.AssessmentQuestions.Single(o => o.AssessmentCheckoffItems.Any(x => x.ID == checkoffitemid));
                answer = new UserAssessmentQuestion { AssessmentQuestionID = question.ID, UserAssessmentCategoryID = ViewModel.CategoryID };
                answer.UserAssessmentCheckoffItems = new List<UserAssessmentCheckoffItem>();
                foreach(var item in ViewModel.Question.Levels.SelectMany(o => o.CheckoffItems))
                {
                    if(item.Checked)
                    {
                        answer.UserAssessmentCheckoffItems.Add(new UserAssessmentCheckoffItem
                        {
                            AssessmentCheckoffItemID = item.ID,
                            Checked = true
                        });
                    }
                }
                if(!question.AssessmentCategory.UserAssessmentCategories.Any(o => o.UserAssessment.UserDetail.UserId == userid))
                {
                    var AnswerAssessment = new UserAssessment();
                    var AnswerCategory = new UserAssessmentCategory
                    {
                        UserAssessmentQuestions = new List<UserAssessmentQuestion>(),
                        AssessmentCategoryID = ViewModel.CategoryID
                    };
                    AnswerCategory.UserAssessmentQuestions.Add(answer);
                    if (!question.AssessmentCategory.AssessmentCollection.UserAssessments.Any(o => o.UserDetail.UserId == userid))
                    {
                        AnswerAssessment.UserDetailID = db.UserDetails.Single(o => o.UserId == userid).ID;
                        AnswerAssessment.AssessmentID = question.AssessmentCategory.AssessmentCollectionID;
                        AnswerAssessment.UserAssessmentCategories = new List<UserAssessmentCategory>();
                        AnswerAssessment.UserAssessmentCategories.Add(AnswerCategory);
                        db.UserAssessments.Add(AnswerAssessment);
                    }
                    else
                    {
                        AnswerAssessment = db.UserAssessments.Single(o => o.UserDetail.UserId == userid && o.UserAssessmentCategories.Any(x => x.AssessmentCategoryID == ViewModel.CategoryID));
                        AnswerAssessment.UserAssessmentCategories.Add(AnswerCategory);
                    }
                }
                db.SaveChanges();
            }
            return answer.AssessmentQuestionID;
        }
    }
}