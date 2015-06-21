Course Project Code Book

The original description from those that collected the data prior to being merged and cleaned. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The following variables were used, where XYZ refers to the X,Y, and Z directions respectively:
	tBodyAcc-XYZ
	tGravityAcc-XYZ
	tBodyAccJerk-XYZ
	tBodyGyro-XYZ
	tBodyGyroJerk-XYZ
	tBodyAccMag
	tGravityAccMag
	tBodyAccJerkMag
	tBodyGyroMag
	tBodyGyroJerkMag
	fBodyAcc-XYZ	
	fBodyAccJerk-XYZ
	fBodyGyro-XYZ
	fBodyAccMag
	fBodyAccJerkMag
	fBodyGyroMag
	fBodyGyroJerkMag 

However the tables contain calculations done on these variables, so the actual variable ends up coming out in this sort of fashion.
tBodyAcc-mean()-X
Thus, this variable represets the mean of the tBodyAcc variable in the X direction.
Additionally, the possible outcomes for the 'activity' (which represents what the subject is doing at the time) variable are as follows.
	
	1 WALKING

	2 WALKING_UPSTAIRS
	
	3 WALKING_DOWNSTAIRS
	
	4 SITTING

	5 STANDING

	6 LAYING

This should give a brief overview of the variables and their purposes.  For explanations on the run_analysis.R and how it interacts with these variables, information is available in the README file.
