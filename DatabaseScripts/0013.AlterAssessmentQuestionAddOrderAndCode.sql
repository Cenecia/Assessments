ALTER TABLE AssessmentQuestion
	ADD QuestionOrder INT NOT NULL DEFAULT(1),
		QuestionCode NVARCHAR(10) NULL
	