CREATE TABLE AssessmentCollection
(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	TranslationID INT NOT NULL
	CONSTRAINT fk_AssessmentCollectionTranslationTitle FOREIGN KEY (TranslationID)
	REFERENCES Translation(ID)
)