BEGIN TRANSACTION
	INSERT INTO Translations(EN)
	VALUES ('Level 1')

	INSERT INTO AssessmentLevels(TranslationID, LevelOrder)
	VALUES (@@IDENTITY, 1)

	INSERT INTO Translations(EN)
	VALUES ('Level 2')

	INSERT INTO AssessmentLevels(TranslationID, LevelOrder)
	VALUES (@@IDENTITY, 2)

	INSERT INTO Translations(EN)
	VALUES ('Level 3')

	INSERT INTO AssessmentLevels(TranslationID, LevelOrder)
	VALUES (@@IDENTITY, 3)

	INSERT INTO Translations(EN)
	VALUES ('Level 4')

	INSERT INTO AssessmentLevels(TranslationID, LevelOrder)
	VALUES (@@IDENTITY, 4)
COMMIT