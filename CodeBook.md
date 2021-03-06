#Code book

This Code Book contains:

* Information on the Course Project, and choices I made;
* Information about the data variables (including units) in the data set provided for the Course;

## The Course Project (and choices I made)

The Course Project relies on the information made available in the WWW by the Smartlab laboratory at the Università degli Studi di Genova.
* The experiments have been carried out with a group of 30 volunteers;
* Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist;
* Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity was captured;
* The experiments have been video-recorded to label the data manually. 

The obtained dataset randomly partitioned afterwards. Two data sets are provided:
* 70% of subjects were selected for generating the training data; and 
* 30% of subjects were put aside to test something (not clear from the Project assignment).

The features selected for this database come from accelerometer and gyroscope 3-axial raw signals.

The project assignment goes:
"You should create one R script called run_analysis.R that does the following:
* Merges the training and the test sets to create one data set;
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

Based on the second point of the above, my understanding is that one should consider only, from a set of over 560 features, those that actually have mean() or std() in its name (avoiding meanFreq()):

So, the task at hands involves writing a script that merges both test and train data to get, for each subject~activity pair measured, the mean of a set of variables that contain mean() or std() in its name.

Please note that the number of columns is not subject of marking. It's not wrong to have 6, or 166 columns. It depends only on your judgement. Please refer to the discussion forum for more on this subject (see David Hood comment on https://class.coursera.org/getdata-011/forum/thread?thread_id=252).

##The Data Variables (68 Columns)

The data variables considered in the exercise are then:
*  subject (factor): [1:30] aka id of volunteer;
*  activity (factor): the six activities for which measurements were taken (see above);
*  tBodyAcc-mean()-X
*  tBodyAcc-mean()-Y
*  tBodyAcc-mean()-Z
*  tBodyAcc-std()-X
*  tBodyAcc-std()-Y
*  tBodyAcc-std()-Z
*  tGravityAcc-mean()-X
*  tGravityAcc-mean()-Y
*  tGravityAcc-mean()-Z
*  tGravityAcc-std()-X
*  tGravityAcc-std()-Y
*  tGravityAcc-std()-Z
*  tBodyAccJerk-mean()-X
*  tBodyAccJerk-mean()-Y
*  tBodyAccJerk-mean()-Z
*  tBodyAccJerk-std()-X
*  tBodyAccJerk-std()-Y
*  tBodyAccJerk-std()-Z
*  tBodyGyro-mean()-X
*  tBodyGyro-mean()-Y
*  tBodyGyro-mean()-Z
*  tBodyGyro-std()-X
*  tBodyGyro-std()-Y
*  tBodyGyro-std()-Z
*  tBodyGyroJerk-mean()-X
*  tBodyGyroJerk-mean()-Y
*  tBodyGyroJerk-mean()-Z
*  tBodyGyroJerk-std()-X
*  tBodyGyroJerk-std()-Y
*  tBodyGyroJerk-std()-Z
*  tBodyAccMag-mean()
*  tBodyAccMag-std()
*  tGravityAccMag-mean()
*  tGravityAccMag-std()
*  tBodyAccJerkMag-mean()
*  tBodyAccJerkMag-std()
*  tBodyGyroMag-mean()
*  tBodyGyroMag-std()
*  tBodyGyroJerkMag-mean()
*  tBodyGyroJerkMag-std()
*  fBodyAcc-mean()-X
*  fBodyAcc-mean()-Y
*  fBodyAcc-mean()-Z
*  fBodyAcc-std()-X
*  fBodyAcc-std()-Y
*  fBodyAcc-std()-Z
*  fBodyAccJerk-mean()-X
*  fBodyAccJerk-mean()-Y
*  fBodyAccJerk-mean()-Z
*  fBodyAccJerk-std()-X
*  fBodyAccJerk-std()-Y
*  fBodyAccJerk-std()-Z
*  fBodyGyro-mean()-X
*  fBodyGyro-mean()-Y
*  fBodyGyro-mean()-Z
*  fBodyGyro-std()-X
*  fBodyGyro-std()-Y
*  fBodyGyro-std()-Z
*  fBodyAccMag-mean()
*  fBodyAccMag-std()
*  fBodyBodyAccJerkMag-mean()
*  fBodyBodyAccJerkMag-std()
*  fBodyBodyGyroMag-mean()
*  fBodyBodyGyroMag-std()
*  fBodyBodyGyroJerkMag-mean()
*  fBodyBodyGyroJerkMag-std()

So,the final dataset (finalTable.txt) delivers the mean of all observations of the above variables, for each subject ~ activity pair (30 subjects * 6 activities = 180 rows).
All measurement features are normalized and bounded within [-1,1].






