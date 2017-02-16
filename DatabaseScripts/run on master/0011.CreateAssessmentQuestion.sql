CREATE TABLE UserAssessmentQuestion
(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	AssessmentQuestionID INT NOT NULL,
	UserAssessmentCategoryID INT NOT NULL,
	Comments NVARCHAR(MAX) NULL
	CONSTRAINT fk_UserAssessmentQuestionAssessmentQuestion FOREIGN KEY (AssessmentQuestionID)
	REFERENCES AssessmentQuestion(ID),
	CONSTRAINT fk_UserAssessmentQuestionUserAssessmentCategory FOREIGN KEY (UserAssessmentCategoryID)
	REFERENCES UserAssessmentCategory(ID)
)