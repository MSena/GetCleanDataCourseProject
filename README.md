# Getting and Cleaning Data 
###Required elements for peer review and marking 

This repository presents the material and tasks developed for the Getting and Cleaning Data Project, part of the Data Science Specialization of the John Hopkins University, delivered through Coursera.
This is a guide to demonstrate my ability to collect, work with, and clean a data set.

Summary
* Repo materials
* Project Overview
* Information about the way the data is processed with the run_analysis.R script to deliver a tidy data set as requested;
* Instructions for use;
* Development information.


## Repository Materials

This repository contains the following elements:

* This README file;
* A script file called run_analysis.R, containing all the steps taken to deliver a tidy data set as asked for in the Course Project;
* A text file named finalTable.txt containing the final result of project, as produced by the R script;
* A Codebook that describes the variables, the data, and any transformations or work taken to clean up the data.
* a second txt file - secondTable.txt.

##Overview

One of the most exciting areas in all of data science right now is wearable computing.
This project build upon data collected from the accelerometers from the Samsung Galaxy S smartphone, available from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out by the Smartlab laboratory at the Università degli Studi di Genova, with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

All features are normalized and bounded within [-1,1], and each feature vector is a row on the text file.

A full description of the data is available at the following site: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Script Overview

I created a computer script (in R - run_analysis.R) that takes the raw data as input and produces the tidy data I'm sharing as output (finalTable.txt). 
The script is profusely commented, so I invite you to take a look at it. 

It first sets the working environment to the folder containing the data folder ("./UCI _HAR_Dataset/). 
It then reads the data from several txt files provided and merges them into one single data.frame (fullData), linking subjects to activities to measurements data, regardless of the previous partition (test/train). 
Afterwards, it subsets the desired variables and "merges" the activities denominations (character string:WALKING, WALKING_DOWNSTAIRS, etc).

The last part of the script computes the mean value for each variable considered, grouped by subject ~ activity pairs.
This part of the script may look kind of weird, as I initially was looking to put forward a ftable (I'm a Excel's pivot table fan). 
The question of presenting the variable means instead of frequencies was easily overcome (with acast()). 

Meanwhile, I realized that a ftable could be considered as a non-tidy format (lots of blanks - see secondTable.txt). 
I would also have to go for a write.ftable instead of write.table solution, as requested (thats how I got secondTable). 
So, I took the coding I already had and put it to work in a way that gives the required output. It is most probably different from the approaches I may see in the peer review (I'm looking forward to it).

Converting a ftable to data.frame is not nice if you want to keep column names (I tried to do it but couldn't find a convenient way), so I'm naming the variable only after getting the data.frame of step5 (and not in a previous step, as it was supposed to if you consider the project's five steps). 
Finally, You may see rm() all over the place: the idea is to remove from memory all data that is no longer needed.
This script is far from optimized, but it delivers...

### Instructions:

1. Source run_analysis.R
2. type run_analysis() in the console

In the end you get the requested txt file, the table returned in the Console (for RStudio), and a farewell message. Nothing is kept on memory, apart from the function itself.

###Development Info

This project was developed in Rstudio  
Platform: x86_64-w64-mingw32/x64 (64-bit) - running on Windows7 Professional
R version: 3.1.2 (2014-10-31) -- "Pumpkin Helmet"
##License 

The use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012