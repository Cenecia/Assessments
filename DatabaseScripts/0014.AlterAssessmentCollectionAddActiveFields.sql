ALTER TABLE AssessmentCollection
	ADD Active BIT NOT NULL DEFAULT 1,
	AvailableDate DateTime NULL,
	ExpiresDate DateTime NULL