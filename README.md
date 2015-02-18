# Getting and Cleaning Data 
###Required elements for peer review and marking 

This repository presents the material and tasks developed for the Getting and Cleaning Data Project, part of the Data Science Specialization of the John Hopkins University, delivered through Coursera.
This is a guide to demonstrate my ability to collect, work with, and clean a data set.

## Repository Materials

This repository contains the following elements:

* This README file;
* A script file called run_analysis.R, containing all the steps taken to deliver a tidy data set as asked for in the Course Project;
* A text file named finalTable.txt containing the final result of project, as produced by the R script;
* A Codebook that describes the variables, the data, and any transformations or work taken to clean up the data.

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

A full description of the data is available at the site where it was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

##License

The use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012