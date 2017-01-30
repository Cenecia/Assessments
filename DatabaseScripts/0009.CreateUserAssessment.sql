CREATE TABLE UserAssessment
(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	AssessmentID INT NOT NULL,
	UserDetailID INT NOT NULL
	CONSTRAINT fk_UserAssessmentAssessmentCollection FOREIGN KEY (AssessmentID)
	REFERENCES AssessmentCollection(ID),
	CONSTRAINT fk_UserAssessmentUserDetail FOREIGN KEY (UserDetailID)
	REFERENCES UserDetails(ID)
)