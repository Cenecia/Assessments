# Assessments
Basic Assessment Creation Software

Work in Progress

This application allows a user to quickly and easily create Assessments such as Operational Review Assessments, Safety Assessments, Performance Assessments, Self-Assessments, etc...

#Current Features

##Setup Assessments (admin only)

  -create / edit / delete Asessments, Categories, Questions and Checkoff Items
  -lock assessments - assessments start locked and only become available to users after being unlocked. Assessments cannot be unlocked if there any blank Categories or Questions, or if there is a question without at least one check item in each level.

##Manage Users (admin only)
  
  -View all registered users and promote / demote admin status. Can also edit user names

##Conduct Assessment (registered users)
  
  -Users can take the assessments that are currently available. 
  
  -Each user can currently only take each assessment once.
  
  -Answers to each question are saved and can be modified
  
  -Scoring system: checking off any 1s will result in a score of 1, if no 1's are checked, but any level 2 items are checked, score is 2, if no 1's or 2's are checked and any level 3 items are checked, score is 3, if ALL level 3s are checked and all level 4's are checked score is 4. 


#In Development Features
-Registration - will most likely start with closed registration: ie only Admin user can create accounts


#Future Features
##-Email user confirmation
##-View User Asssessment responses (admin)
##-Save either empty or filled out assessments and .docx or .pdf
##-Statistics (scores / trends of recent assessments)
##-Auditing and Error logging

Run all the database scripts in order to build database structure.
