## Getting and Cleaning Data - Week 3 - Course Project

run_analysis <- function(){
      
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
      
      ## Prior work: name activityLabels variables
      names(activityLabels) <- c("activityCode", "activity")
      
      ## Construct a complete test data.frame (testData)
      testData <- cbind(subjectTest,yTest,xTest)            ; rm(subjectTest,yTest,xTest)
            
      ## Construct a complete train data.frame (trainData)
      trainData <- cbind(subjectTrain,yTrain,xTrain)        ; rm(subjectTrain,yTrain,xTrain)
           
      ## Combine both datasets in unique dataset (fullData)
      fullData <- rbind(testData,trainData)                 ; rm(testData,trainData)
      
      ## Extracts only the measurements on the mean and standard deviation for 
      ## "Triaxial acceleration from the accelerometer measurements" (AccellMeanStd)
      accellMeanStd <- fullData[,1:8]
      
      ## Extracts only the measurements on the mean and standard deviation for 
      ## "Triaxial Angular velocity from the gyroscope" (gyroMeanStd)
      gyroMeanStd <- fullData[,123:128]                     ; rm(fullData)
      
      ## merge both sensors (accelerometer and gyroscope) data
      meanStd <- cbind(accellMeanStd,gyroMeanStd)
      
      ## Using descriptive "activity names" to name the activities in the data set 
      
      library(dplyr)
          
      dataSet <- activityLabels %>% 
            merge(meanStd, by.x = "activityCode", by.y = "V1.1") %>% 
                  arrange(V1, activityCode) %>%  
                        select (-activityCode)              ; rm(meanStd, activityLabels)
      
      ## Appropriately label the data set with descriptive variable names
            names(dataSet)[2] <- "subject"
            dataSet$subject   <- as.factor(dataSet$subject)
            
            
      
      ## From dataSet, create a ftable with the average value of each variable,
      ## for each activity-subject pair, and return a data.frame
      library(reshape2)
            dataMelt    <- melt(dataSet, id = c("subject","activity"), measure.vars = 3:14)      #; rm(dataSet)
            fTable      <- dataMelt %>% acast( subject ~ activity ~ variable, mean) %>% ftable  #; rm(dataMelt)
            data        <- data.frame(expand.grid(rev(attr(fTable, "row.vars"))), unclass(fTable))
      
      ## Appropriately label the final data set with descriptive variable names
      names(data)[1:2]  <- c("activity","subject")
     
      varNames <- as.character(features$V2[1:6])
      names(data)[3:8]  <- varNames                         ; rm(features)  
     
      varNames <- as.character(features$V2[121:126])
      names(data)[9:14] <- varNames                         ; rm(varNames)
     
     finalTable <- select(data, subject, activity, 3:14)
     
      ## Write finalTable to a file      
      write.table(finalTable,"./finalTable.txt",row.name = FALSE)
      
     ## Presents table on Rstudio Console
      View(finalTable)                                      ; rm(finalTable)
     
     ## farewell statement 
      print("finalTable with requested result written to 'finalTable.txt' on courseProject Directory.")
}