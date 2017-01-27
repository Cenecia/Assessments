CREATE TABLE AssessmentLevel
(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	TranslationID INT NOT NULL,
	LevelOrder INT NOT NULL,
	CONSTRAINT fk_AssessmentLevelTranslationName FOREIGN KEY (TranslationID)
	REFERENCES Translation(ID)
)