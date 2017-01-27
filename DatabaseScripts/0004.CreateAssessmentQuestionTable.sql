CREATE TABLE AssessmentQuestion
(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	HeadingTranslationID INT NOT NULL,
	AssessmentCategoryID INT NOT NULL,
	BodyTranslationID INT NULL
	CONSTRAINT fk_AssessmentQuestionTranslationHeading FOREIGN KEY (HeadingTranslationID)
	REFERENCES Translation(ID),
	CONSTRAINT fk_AssessmentQuestionAssessmentCategory FOREIGN KEY (AssessmentCategoryID)
	REFERENCES AssessmentCategory(ID),
	CONSTRAINT fk_AssessmentQuestionTranslationBody FOREIGN KEY (BodyTranslationID)
	REFERENCES Translation(ID)
)