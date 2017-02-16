CREATE TABLE UserAssessmentCheckoffItem
(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	AssessmentCheckoffItemID INT NOT NULL,
	UserAssessmentQuestionID INT NOT NULL,
	Checked BIT NOT NULL
	CONSTRAINT fk_UserAssessmentCheckoffItemAssessmentCheckoffItem FOREIGN KEY (AssessmentCheckoffItemID)
	REFERENCES AssessmentCheckoffItem(ID),
	CONSTRAINT fk_UserAssessmentCheckoffItemUserAssessmentQuestion FOREIGN KEY (UserAssessmentQuestionID)
	REFERENCES UserAssessmentQuestion(ID)
)