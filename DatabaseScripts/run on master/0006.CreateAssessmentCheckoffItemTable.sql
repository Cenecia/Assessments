CREATE TABLE AssessmentCheckoffItem
(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	TranslationID INT NOT NULL,
	AssessmentQuestionID INT NOT NULL,
	AssessmentLevelID INT NOT NULL,
	CheckOffItemOrder INT NOT NULL
	CONSTRAINT fk_AssessmentCheckoffItemTranslationWording FOREIGN KEY (TranslationID)
	REFERENCES Translation(ID),
	CONSTRAINT fk_AssessmentCheckoffItemAssessmentQuestion FOREIGN KEY (AssessmentQuestionID)
	REFERENCES AssessmentQuestion(ID),
	CONSTRAINT fk_AssessmentQuestionAssessmentLevel FOREIGN KEY (AssessmentLevelID)
	REFERENCES AssessmentLevel(ID)
)