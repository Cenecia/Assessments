CREATE TABLE UserAssessmentCategory
(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	AssessmentCategoryID INT NOT NULL,
	UserAssessmentID INT NOT NULL
	CONSTRAINT fk_UserAssessmentCategoryAssessmentCategory FOREIGN KEY (AssessmentCategoryID)
	REFERENCES AssessmentCategory(ID),
	CONSTRAINT fk_UserAssessmentCategoryUserAssessmentID FOREIGN KEY (UserAssessmentID)
	REFERENCES UserAssessment(ID)
)