CREATE TABLE AssessmentCategory
(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	TranslationID INT NOT NULL,
	AssessmentCollectionID INT NOT NULL
	CONSTRAINT fk_AssessmentCategoryTranslationName FOREIGN KEY (TranslationID)
	REFERENCES Translation(ID),
	CONSTRAINT fk_AssessmentCategoryAssessmentCollection FOREIGN KEY (AssessmentCollectionID)
	REFERENCES AssessmentCollection(ID)
)