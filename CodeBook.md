#Code book

This Code Book contains:

* Information on the Course Project, and choices I made;
* Information about the data variables (including units) in the data set provided for the Course;
* Information about the way the data is processed with the run_analysis.R script to deliver a tidy data set as requested;
* Instructions for use;
* Development information.

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

Based on the second point of the above, my understanding is that one should consider only, from a set of over 500 features, those that actually relate to raw physical measurements:
* tBodyAcc-XYZ
* tBodyGyro-XYZ
('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions).

So, the task at hands involves writing a script that merges both test and train data to get, for each subject~activity pair measured, the mean and std of a set of variables that I consider to be the ones related to the raw data(as opposed to look for all variables that have mean or std in their name). This option paves the way for a "neatier" codebook, at least : )

Please note that the number of columns is not subject of marking. It's not wrong to have 6, or 166 columns. It depends only on your judgement. Please refer to the discussion forum for more on this subject (see David Hood comment on https://class.coursera.org/getdata-011/forum/thread?thread_id=252).

##The Data Variables 

The data variables considered in the exercise are then:
* subject (factor): [1:30] aka id of volunteer;
* activity (factor): the six activities for which measurements were taken (see above);
* tBodyAcc-mean()-X   :   mean of body acceleration on the x-Axis;
* tBodyAcc-mean()-Y   :   mean of body acceleration on the y-Axis;
* tBodyAcc-mean()-Z   :   mean of body acceleration on the z-Axis;
* tBodyAcc-std()-X    :   Std of body acceleration on the x-Axis;
* tBodyAcc-std()-Y    :   Std of body acceleration on the y-Axis;
* tBodyAcc-std()-Z    :   Std of body acceleration on the z-Axis;
* tBodyGyro-mean()-X  :   mean of Angular velocity on x-Axis;
* tBodyGyro-mean()-Y  :   mean of Angular velocity on y-Axis;
* tBodyGyro-mean()-Z  :   mean of Angular velocity on z-Axis;
* tBodyGyro-std()-X   :   Std of Angular velocity on x-Axis;
* tBodyGyro-std()-Y   :   Std of Angular velocity on y-Axis;
* tBodyGyro-std()-Z   :   Std of Angular velocity on z-Axis. 

All measurement features are normalized and bounded within [-1,1], and each feature vector is a row on the text file.

## Script Overview

I created a computer script (in R - run_analysis.R) that takes the raw data as input and produces the tidy data I'm sharing as output (finalTable.txt). 
The script is profusely commented, so I invite you to take a look at it. 

It first sets the working environment to the folder containing the data folder ("./UCI _HAR_Dataset/). 
It then reads the data from several txt files provided and merges them into one single data.frame (fullData), linking subjects to activities to measurements data, regardless of the previous partition (test/train). 
Afterwards, it subsets the desired variables and "merges" the activities denominations (character strings). 

The last part of the script may look kind of weird, as I initially was looking to put forward a ftable (I'm a Excel's pivot table fan). 
The question of presenting the variable means instead of frequencies was easily overcome (with acast()). 

Meanwhile, I realized that a ftable could be considered as a non-tidy format (lots of blanks - see secondTable.txt). 
I would also have to go for a write.ftable instead of write.table solution, as requested (thats how I got secondTable). 
So, I took the coding I had and put it to work in a way that gives the required output. 

It is most probably different from the approaches I may see in the peer review (I'm looking forward to it), but it delivers.
Converting a ftable to data.frame is not nice if you want to keep column names (I tried to do it but couldn't find a convenient way), so I'm naming the variable only after getting the data.frame of step5 (and not in a previous step, as it was supposed to if you consider the project's five steps). 
Finally, You may see rm() all over the place: the idea is to remove from memory all data that is no longer needed.


### Instructions:

1. Source run_analysis.R
2. type run_analysis() in the console

In the end you get the requested txt file, the table returned in the Console (for RStudio), and a farewell message. Nothing is kept on memory.

###Development Info

This project was developed in Rstudio  
Platform: x86_64-w64-mingw32/x64 (64-bit) - running on Windows7 Professional
R version: 3.1.2 (2014-10-31) -- "Pumpkin Helmet"




