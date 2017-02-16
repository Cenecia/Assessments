BEGIN TRANSACTION
	INSERT INTO Translation(EN)
	VALUES ('Level 1')

	INSERT INTO AssessmentLevel(TranslationID, LevelOrder)
	VALUES (@@IDENTITY, 1)

	INSERT INTO Translation(EN)
	VALUES ('Level 2')

	INSERT INTO AssessmentLevel(TranslationID, LevelOrder)
	VALUES (@@IDENTITY, 2)

	INSERT INTO Translation(EN)
	VALUES ('Level 3')

	INSERT INTO AssessmentLevel(TranslationID, LevelOrder)
	VALUES (@@IDENTITY, 3)

	INSERT INTO Translation(EN)
	VALUES ('Level 4')

	INSERT INTO AssessmentLevel(TranslationID, LevelOrder)
	VALUES (@@IDENTITY, 4)
COMMIT