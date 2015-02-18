## Getting and Cleaning Data - Week 3 - Course Project

run_Analysis <- function(){
      
      setwd("C:/Users/msilva/Desktop/Coursera/03_Getting_Cleaning_Data/GetCleanDataCourseProject")  
     
      ## Gather information from "Human Activity Recognition Using Smartphones Dataset" txt files
      
      activityLabels    <- read.table("./UCI _HAR_Dataset/activity_labels.txt")
      features          <- read.table("./UCI _HAR_Dataset/features.txt")
      
      subjectTest       <- read.table("./UCI _HAR_Dataset/test/subject_test.txt")
      yTest             <- read.table("./UCI _HAR_Dataset/test/y_test.txt")
      xTest             <- read.table("./UCI _HAR_Dataset/test/X_test.txt")
      
      subjectTrain      <- read.table("./UCI _HAR_Dataset/train/subject_train.txt")
      yTrain            <- read.table("./UCI _HAR_Dataset/train/y_train.txt")
      xTrain            <- read.table("./UCI _HAR_Dataset/train/X_train.txt")
      
      ## prior work: name activityLabels variables
      names(activityLabels) <- c("activityCode", "activity")
      
      ## construct complete test data.frame (testData)
      testData <- cbind(subjectTest,yTest,xTest); rm(subjectTest,yTest,xTest)
            
      ## construct complete train data.frame (trainData)
      trainData <- cbind(subjectTrain,yTrain,xTrain); rm(subjectTrain,yTrain,xTrain)
           
      ## Combine both datasets in unique dataset (fullData)
      fullData <- rbind(testData,trainData); rm(testData,trainData)
      
      ## Extracts only the measurements on the mean and standard deviation for 
      ## "Triaxial acceleration from the accelerometer measurements" (AccellerometerDataMeanStd)
      fullDataMeanStd <- fullData[,1:8]; rm(fullData)
      
      ## Extracts only the measurements on the mean and standard deviation for 
      ## "Triaxial Angular velocity from the gyroscope" (gyroscopeDataMeanStd)
      ; rm(fullData)
      
      ## Using descriptive activity names to name the activities in the data set (while rearranging the columns order too)
      library(dplyr)
          
      dataSet <- activityLabels %>% 
            merge(fullDataMeanStd, by.x = "activityCode", by.y = "V1.1") %>% 
            arrange(V1, activityCode) %>%  
            select (-activityCode) %>% 
            select(V1, activity, V1.2, V2, V3, V4, V5, V6); rm(fullDataMeanStd, activityLabels)
      
      ## Appropriately labels the data set with descriptive variable names
            names(dataSet)[1] <- "subject"
            dataSet$subject <- as.factor(dataSet$subject)
            varNames <- as.character(features$V2[1:6])
            names(dataSet)[3:8] <- varNames ;rm(varNames, features)
            
      
      ## From the dataSet, creates a ftable with 
      ## the average of each variable for each activity and each subject.
      library(reshape2)
            dataMelt <- melt(dataSet, id = c("subject","activity"), measure.vars = 3:8)
            secondTable <- dataMelt %>% acast( subject ~ activity ~ variable, mean) %>% ftable ; rm(dataMelt)
            
      ##Write secondTable to a file      
      write.ftable(secondTable,"./secondTable.txt",row.name = FALSE)
      
      secondTable
}