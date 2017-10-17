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
        /// <summary>
        /// Creates a new Assessment with given name
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
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

        /// <summary>
        /// Updates an existing Assessment
        /// </summary>
        /// <param name="id">ID of Assessment to update</param>
        /// <param name="name">Name to update the Assessment to</param>
        public void UpdateAssessment(int id, string name)
        {
            var Translation = db.AssessmentCollections.Single(o => o.ID == id).Translation;
            Translation.EN = name;
            db.SaveChanges();
        }

        /// <summary>
        /// Create a category for an assessment
        /// </summary>
        /// <param name="name">Name of Category</param>
        /// <param name="assessmentId">ID of Assessment to add to</param>
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

        /// <summary>
        /// Update Assessment Category
        /// </summary>
        /// <param name="id">ID of Category to update</param>
        /// <param name="name">Name to update Cateogry Name to</param>
        public void UpdateAssessmentCategory(int id, string name)
        {
            var Translation = db.AssessmentCategories.Single(o => o.ID == id).Translation;
            Translation.EN = name;
            db.SaveChanges();
        }

        /// <summary>
        /// Create a Response Level (ie low, med, high)
        /// </summary>
        /// <param name="name">Name of Level</param>
        /// <param name="order">Sequential Order</param>
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

        /// <summary>
        /// Update a Response Level
        /// </summary>
        /// <param name="id">ID of Level</param>
        /// <param name="name">Name to update Level to</param>
        public void UpdateAssessmentLevel(int id, string name)
        {
            var Translation = db.AssessmentLevels.Single(o => o.ID == id).Translation;
            Translation.EN = name;
            db.SaveChanges();
        }

        /// <summary>
        /// Create a Checkoff item for a Question of a specified Level
        /// </summary>
        /// <param name="wording">Wording of Checkoff Item (EN)</param>
        /// <param name="questionId">ID of Question</param>
        /// <param name="levelId">ID of Level</param>
        /// <param name="order">Order Checkoff Item appears in the Level</param>
        /// <returns></returns>
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

        /// <summary>
        /// Update existing Checkoff Item
        /// </summary>
        /// <param name="id">ID of Checkoff Item</param>
        /// <param name="wording">New Wording</param>
        /// <param name="levelId">New Level ID</param>
        /// <param name="order">New Order</param>
        public void UpdateAssessmentCheckoffItem(int id, string wording, int levelId, int order)
        {
            var Item = db.AssessmentCheckoffItems.Single(o => o.ID == id);
            Item.AssessmentLevelID = levelId;
            Item.CheckOffItemOrder = order;
            Item.Translation.EN = wording;
            db.SaveChanges();
        }

        /// <summary>
        /// Retrieves all Assessments
        /// </summary>
        /// <returns></returns>
        public List<SetupIndexAssessmentListItem> GetAllAssessments()
        {
            return db.AssessmentCollections.Select(o => 
                new SetupIndexAssessmentListItem
                {
                    ID = o.ID,
                    Name = o.Translation.EN,
                    Live = o.Active
                }
            ).ToList();
        }

        /// <summary>
        /// Get Name of Assessment by ID
        /// </summary>
        /// <param name="id">ID of Assessment</param>
        /// <returns></returns>
        public string GetAssessmentName(int id)
        {
            return db.AssessmentCollections.Single(o => o.ID == id).Translation.EN;
        }

        /// <summary>
        /// Create a multiple categories for an Assessment
        /// </summary>
        /// <param name="id">ID of Assessment</param>
        /// <param name="categories">List of Category Names</param>
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

        /// <summary>
        /// Get object containing Assessment with its categories. Does not contain questions, checkoff items etc...
        /// </summary>
        /// <param name="id">ID of Assessment to retrieve</param>
        /// <returns></returns>
        public SetupCreateCategoriesViewModel GetAssessmentWithCategories(int id)
        {
            var Assessment = db.AssessmentCollections.Single(o => o.ID == id);
            var ViewModel = new SetupCreateCategoriesViewModel
            {
                AssessmentName = Assessment.Translation.EN,
                Live = Assessment.Active
            };

            ViewModel.Categories = 
                Assessment.AssessmentCategories.Select(o => 
                    new SetupCategoryListItem
                    {
                        Name = o.Translation.EN,
                        ID = o.ID
                    }
                ).ToList();

            if(Assessment.AssessmentCategories.Any(o => o.Translation.EN == null))
            {
                ViewModel.LockedReasons.Add("There are Categories that need to be named.");
            }
            if(Assessment.AssessmentCategories.Any(cat => cat.AssessmentQuestions.Any(q => q.Translation.EN == null)))
            {
                ViewModel.LockedReasons.Add("There are questions that are blank.");
            }

            if (Assessment.AssessmentCategories.Any(cat => cat.AssessmentQuestions.Any(o => !o.AssessmentCheckoffItems.Any(x => x.AssessmentLevel.LevelOrder == 1)))
                || Assessment.AssessmentCategories.Any(cat => cat.AssessmentQuestions.Any(o => !o.AssessmentCheckoffItems.Any(x => x.AssessmentLevel.LevelOrder == 2)))
                || Assessment.AssessmentCategories.Any(cat => cat.AssessmentQuestions.Any(o => !o.AssessmentCheckoffItems.Any(x => x.AssessmentLevel.LevelOrder == 3)))
                || Assessment.AssessmentCategories.Any(cat => cat.AssessmentQuestions.Any(o => !o.AssessmentCheckoffItems.Any(x => x.AssessmentLevel.LevelOrder == 4))))
            {
                ViewModel.LockedReasons.Add("There are Questions without at least one checkoff item per level.");
            }

            ViewModel.CanUnlock = !ViewModel.LockedReasons.Any();

            return ViewModel;
        }

        /// <summary>
        /// Retrieves object containing all categories, questions, list items, levels for editing.
        /// </summary>
        /// <param name="id">ID of Category</param>
        /// <param name="questionID">ID of currently viewed question</param>
        /// <returns></returns>
        public SetupEditCategoryViewModel FillEditCategoryViewModel(int id, int questionID)
        {
            var category = db.AssessmentCategories.Single(o => o.ID == id);
            var ViewModel = new SetupEditCategoryViewModel
            {
                ID = id,
                AssessmentID = category.AssessmentCollectionID,
                Live = category.AssessmentCollection.Active,
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
                        CategoryID = o.AssessmentCategoryID,
                        QuestionOrder = o.QuestionOrder,
                        QuestonCode = o.QuestionCode
                    }
                    ).ToList(),
                Question = questionID == 0 
                    ? new SetupQuestionListItem()
                    : category.AssessmentQuestions.Where(o => o.ID == questionID).Select(o => 
                        new SetupQuestionListItem
                        {
                            ID = o.ID,
                            Heading = o.Translation.EN,
                            Body = o.Translation1.EN,
                            QuestonCode = o.QuestionCode
                        }
                    ).Single()
            };
            ViewModel.Name = category.Translation.EN;

            if(category.AssessmentCollection.Active && questionID == 0)
            {
                ViewModel.Question = ViewModel.Questions.OrderBy(o => o.QuestionOrder).First();
            }
            else if (questionID == 0)
                ViewModel.Questions.Add(new SetupQuestionListItem());
            else
            {
                ViewModel.CheckoffItem = new SetupAsessmentCheckoffListItem { QuestionID = questionID };
            }

            return ViewModel;
        }

        /// <summary>
        /// Add new Queston to a Category
        /// </summary>
        /// <param name="id">ID of Assessment Category</param>
        /// <param name="heading">Heading of Question</param>
        /// <param name="body">Body of Question</param>
        /// <param name="questionCode">Question Code</param>
        /// <returns></returns>
        public int AddQuestion(int id, string heading, string body, string questionCode)
        {
            var prevQuestion = db.AssessmentQuestions.Where(o => o.AssessmentCategoryID == id).OrderByDescending(o => o.QuestionOrder).FirstOrDefault();
            var question = new AssessmentQuestion
            {
                AssessmentCategoryID = id,
                Translation = new Translation { EN = heading },
                Translation1 = new Translation { EN = body },
                QuestionOrder = prevQuestion != null ? prevQuestion.QuestionOrder + 1 : 1,
                QuestionCode = questionCode
            };
            db.AssessmentQuestions.Add(question);
            db.SaveChanges();
            return question.ID;
        }

        /// <summary>
        /// Update existing Question
        /// </summary>
        /// <param name="id">ID of Question</param>
        /// <param name="heading">New Question Heading</param>
        /// <param name="body">New Question Body</param>
        /// <param name="questionCode">New Question Code</param>
        public void UpdateQuestion(int id, string heading, string body, string questionCode)
        {
            var question = db.AssessmentQuestions.Single(o => o.ID == id);
            question.Translation.EN = heading != null ? heading : question.Translation.EN;
            question.Translation1.EN = body != null ? body : question.Translation1.EN;
            question.QuestionCode = questionCode;
            db.SaveChanges();
        }

        /// <summary>
        /// Get the list of Questions for a Category
        /// </summary>
        /// <param name="id">ID of Category</param>
        /// <returns></returns>
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

        /// <summary>
        /// Toggle an Assessment Active / Deactive. Active Assessments can be filled out by users but cannot be edited in setup while active.
        /// </summary>
        /// <param name="id">ID of Assessment to Activate/Deactivate</param>
        public void ActivateAssessment(int id)
        {
            var Assessment = db.AssessmentCollections.Single(o => o.ID == id);

            if (!Assessment.Active
                && !Assessment.AssessmentCategories.Any(o => o.Translation.EN == null)
                && !Assessment.AssessmentCategories.Any(cat => cat.AssessmentQuestions.Any(q => q.Translation.EN == null))
                    && !(Assessment.AssessmentCategories.Any(cat => cat.AssessmentQuestions.Any(o => !o.AssessmentCheckoffItems.Any(x => x.AssessmentLevel.LevelOrder == 1)))
                        || Assessment.AssessmentCategories.Any(cat => cat.AssessmentQuestions.Any(o => !o.AssessmentCheckoffItems.Any(x => x.AssessmentLevel.LevelOrder == 2)))
                        || Assessment.AssessmentCategories.Any(cat => cat.AssessmentQuestions.Any(o => !o.AssessmentCheckoffItems.Any(x => x.AssessmentLevel.LevelOrder == 3)))
                        || Assessment.AssessmentCategories.Any(cat => cat.AssessmentQuestions.Any(o => !o.AssessmentCheckoffItems.Any(x => x.AssessmentLevel.LevelOrder == 4)))
                    )
                )
            {
                Assessment.Active = true;
            }
            else
            {
                Assessment.Active = false;
            }

            db.SaveChanges();
        }

        public SetupAsessmentCheckoffListItem GetCheckoffItem(int id)
        {
            var checkoffItem = db.AssessmentCheckoffItems.Single(o => o.ID == id);

            return new SetupAsessmentCheckoffListItem
            {
                ID = checkoffItem.ID,
                Wording = checkoffItem.Translation.EN,
                LevelID = checkoffItem.AssessmentLevelID,
                Order = checkoffItem.CheckOffItemOrder,
                QuestionID = checkoffItem.AssessmentQuestionID,
                AssessmentCategoryID = checkoffItem.AssessmentQuestion.AssessmentCategoryID
            };
        }

        public void UpdateCheckoffItem(int id, string Wording)
        {
            var checkoffItem = db.AssessmentCheckoffItems.Single(o => o.ID == id);
            checkoffItem.Translation.EN = Wording;
            db.SaveChanges();
        }

        public void DeleteCheckoffItem(int id)
        {
            var checkoffItem = db.AssessmentCheckoffItems.Single(o => o.ID == id);
            db.AssessmentCheckoffItems.Remove(checkoffItem);
            db.SaveChanges();
        }
#endregion

        /// <summary>
        /// Get List of available Assessments with Category names with the userid's status for tha Assessment (started / not started)
        /// </summary>
        /// <param name="userid">raw userid of user</param>
        /// <returns></returns>
        public List<AssessmentListItem> GetUserAssessments(string userid)
        {
            return db.AssessmentCollections.Where(o => o.Active).Select(o => 
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

        /// <summary>
        /// Retrieves object containing an Assessment Category and an optional currently selected question (will choose first question if null) to be filled out by user.
        /// </summary>
        /// <param name="userid">hashed userid</param>
        /// <param name="id">ID of Assessment Category</param>
        /// <param name="questionID">Currently selected question (defaults to first question if null)</param>
        /// <returns></returns>
        public ConductAssessmentViewModel ConductAssessment(string userid, int id, int? questionID)
        {
            var ViewModel = new ConductAssessmentViewModel
            {
                CategoryID = id,
                UserDetailID = db.UserDetails.Single(o => o.UserId == userid).ID
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
            
            ViewModel.CategoryName = Question.AssessmentCategory.Translation.EN;
            ViewModel.Question = 
                new AnswerQuestonViewModel
                {
                    ID = AssessmentQuestion.ID,
                    QuestionHeading = AssessmentQuestion.Translation.EN,
                    QuestionBody = AssessmentQuestion.Translation1.EN,
                    Score = AssessmentQuestion.UserAssessmentQuestions.Any(x => x.UserAssessmentCategory.UserAssessment.UserDetail.UserId == userid) ? AssessmentQuestion.UserAssessmentQuestions.Single(x => x.UserAssessmentCategory.UserAssessment.UserDetail.UserId == userid).Score : null,
                    QuestionCode = AssessmentQuestion.QuestionCode,
                    Levels = levels.Select(o => new AnswerLevelListItem {
                        ID = o.ID,
                        Name  = o.Translation.EN,
                        LevelOrder = o.LevelOrder,
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
                        QuestionBody = o.Translation1.EN,
                        QuestionCode = o.QuestionCode,
                        Score = o.UserAssessmentQuestions.Any(x => x.UserAssessmentCategory.UserAssessment.UserDetail.UserId == userid) ?
                                o.UserAssessmentQuestions.Single(x => x.UserAssessmentCategory.UserAssessment.UserDetail.UserId == userid).Score : null
                    }
                ).OrderBy(o => o.ID).ToList();

            var Answer = 
                AssessmentQuestion.UserAssessmentQuestions.SingleOrDefault(o => 
                    o.AssessmentQuestionID == Question.ID 
                    && o.UserAssessmentCategory.UserAssessment.UserDetail.UserId == userid
                );

            ViewModel.Score = ViewModel.Questions.Any(o => o.Score != null) ? Math.Round((decimal)ViewModel.Questions.Sum(o => o.Score) / ViewModel.Questions.Count(o => o.Score != null), 1) : 0;

            if(Answer != null)
            {
                ViewModel.Question.Comment = Answer.Comments;
            }

            return ViewModel;
        }

        /// <summary>
        /// Pass the ID of the current Question to get the ID of the next Question in an Assessment category based on Question Order. Loops back to first Question if there are no Questions with a higher order.
        /// </summary>
        /// <param name="id">ID of current Question</param>
        /// <returns></returns>
        public int GetNextQuestionId(int id)
        {
            var question = db.AssessmentQuestions.Single(o => o.ID == id);
            if(question.AssessmentCategory.AssessmentQuestions.Any(o => o.QuestionOrder == question.QuestionOrder + 1))
            {
                return question.AssessmentCategory.AssessmentQuestions.Single(o => o.QuestionOrder == question.QuestionOrder + 1).ID;
            }
            return question.AssessmentCategory.AssessmentQuestions.OrderBy(o => o.QuestionOrder).First().ID;
        }

        /// <summary>
        /// Save the response of an assessment including checked off Checkoff Items and Comment
        /// </summary>
        /// <param name="userid">hashed userid</param>
        /// <param name="ViewModel">Object containing Response data</param>
        /// <returns>ID of next Question in this Category (will loop to first Question at the end)</returns>
        public int SaveAnswer(string userid, ConductAssessmentViewModel ViewModel)
        {
            //Get the user's response to Question if exists (ie: they have answered this question already and are updating)
            var answer = db.UserAssessmentQuestions.SingleOrDefault(o => o.UserAssessmentCategory.UserAssessment.UserDetail.UserId == userid 
                                                                         && o.AssessmentQuestionID == ViewModel.Question.ID);
            if(answer != null) //User has existing response
            {
                answer.Comments = ViewModel.Question.Comment; //Update the comment

                /*  Get all the CheckoffItems for this user's previous response.
                 *  Most items will have (checked = true) because items not checked off are removed.
                 */
                var checkoffItems = answer.UserAssessmentCheckoffItems.ToList();
                foreach(var item in ViewModel.Question.Levels.SelectMany(o => o.CheckoffItems)) //For each Checkoff Item in the NEW response
                {
                    if(checkoffItems.Any(x => x.AssessmentCheckoffItemID == item.ID)) //User has checked this item off in previous response
                    {
                        if (item.Checked) //User has checked this item off in new response. Set Checked to true
                        {
                            db.UserAssessmentCheckoffItems.Single(o => o.AssessmentCheckoffItemID == item.ID).Checked = true;
                        }
                        else //User has not checked off this response item. Remove the record.
                        {
                            db.UserAssessmentCheckoffItems.Remove(checkoffItems.Single(o => o.AssessmentCheckoffItemID == item.ID));
                        }
                    }
                    else if(item.Checked) //Item did not exist in old response but is checked off in new response. Create new record.
                    {
                        db.UserAssessmentCheckoffItems.Add(new UserAssessmentCheckoffItem { AssessmentCheckoffItemID = item.ID, UserAssessmentQuestionID = answer.ID, Checked = true });
                    }

                }
            }
            else //User has not responded to this Question before
            {
                //Get a Checkoff Item ID to determine Question
                var checkoffitemid = ViewModel.Question.Levels.SelectMany(y => y.CheckoffItems).First().ID;
                //Find Question the CheckoffItem belongs to
                var question = db.AssessmentQuestions.Single(o => o.AssessmentCheckoffItems.Any(x => x.ID == checkoffitemid));
                answer = new UserAssessmentQuestion { AssessmentQuestionID = question.ID, Comments = ViewModel.Question.Comment };
                answer.UserAssessmentCheckoffItems = new List<UserAssessmentCheckoffItem>();
                foreach(var item in ViewModel.Question.Levels.SelectMany(o => o.CheckoffItems))
                {
                    if(item.Checked) //Create record if Checkoff Item is checked. Skip if not checked.
                    {
                        answer.UserAssessmentCheckoffItems.Add(new UserAssessmentCheckoffItem
                        {
                            AssessmentCheckoffItemID = item.ID,
                            Checked = true
                        });
                    }
                }
                //Check if user this is the first Question the user has responded to in the Category (or Assessment)
                if(!question.AssessmentCategory.UserAssessmentCategories.Any(o => o.UserAssessment.UserDetail.UserId == userid)) //First time answering a Question in this Category
                {
                    var AnswerAssessment = new UserAssessment();
                    var AnswerCategory = new UserAssessmentCategory
                    {
                        UserAssessmentQuestions = new List<UserAssessmentQuestion>(),
                        AssessmentCategoryID = ViewModel.CategoryID
                    };
                    answer.UserAssessmentCategoryID = AnswerCategory.ID;
                    AnswerCategory.UserAssessmentQuestions.Add(answer);
                    //Check if this is first Question answered in whole Assessment by this user
                    if (!question.AssessmentCategory.AssessmentCollection.UserAssessments.Any(o => o.UserDetail.UserId == userid))
                    {
                        //First Question answered in whole assessment.
                        AnswerAssessment.UserDetailID = db.UserDetails.Single(o => o.UserId == userid).ID;
                        AnswerAssessment.AssessmentID = question.AssessmentCategory.AssessmentCollectionID;
                        AnswerAssessment.UserAssessmentCategories = new List<UserAssessmentCategory>();
                        AnswerAssessment.UserAssessmentCategories.Add(AnswerCategory);
                        db.UserAssessments.Add(AnswerAssessment);
                    }
                    else
                    {
                        //First question in this category, but not the assessment
                        AnswerAssessment = db.UserAssessments.Single(o => o.UserDetail.UserId == userid && o.AssessmentCollection.AssessmentCategories.Any(x => x.ID == ViewModel.CategoryID));
                        AnswerAssessment.UserAssessmentCategories.Add(AnswerCategory);
                    }
                }
                else
                {
                    //Not the first question responded to in this category.
                    answer.UserAssessmentCategoryID = question.AssessmentCategory.UserAssessmentCategories.Single(o => o.UserAssessment.UserDetail.UserId == userid).ID;
                    db.UserAssessmentQuestions.Add(answer);
                }
            }

            //Calculate score. See Documentation for how Score is calculated.
            answer.Score = ViewModel.Question.Levels.Any(o => o.LevelOrder == 1 && o.CheckoffItems.Any(x => x.Checked)) ? 1
                               : ViewModel.Question.Levels.Any(o => o.LevelOrder == 2 && o.CheckoffItems.Any(x => x.Checked)) ? 2
                               : (ViewModel.Question.Levels.Any(o => o.LevelOrder == 3 && o.CheckoffItems.Any(x => x.Checked))
                                  && !ViewModel.Question.Levels.Any(y => y.LevelOrder == 4 && y.CheckoffItems.Any(z => z.Checked))) ? 3
                               : ViewModel.Question.Levels.Any(o => o.LevelOrder == 4 && o.CheckoffItems.Any(x => x.Checked)) ? 4
                               : 0;

            db.SaveChanges();

            return GetNextQuestionId(answer.AssessmentQuestionID);
        }

        /// <summary>
        /// Get the hased userid from the UserDetailID
        /// </summary>
        /// <param name="UserDetailID"></param>
        /// <returns></returns>
        public string GetUserId(int UserDetailID)
        {
            return db.AspNetUsers.Single(o => o.UserDetails.Any(x => x.ID == UserDetailID)).Id;
        }
    }
}