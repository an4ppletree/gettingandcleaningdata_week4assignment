#You should create one R script called run_analysis.R that does the following.

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each 
#   measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.


library(dplyr)

basedir <- "./UCI HAR Dataset"

#column names
features <- read.table(file.path(basedir, "features.txt"), header = F)
activityLabels <- read.table(file.path(basedir, "activity_labels.txt"),
                             col.names = c("activity.ID", "activity.Name"),
                             header = F)


#subjectTrain
subjectTrain <- read.table(file.path(basedir, "train","subject_train.txt"), 
                           header = F, col.names = "subject.Number")
x_Train <- read.table(file.path(basedir, "train","X_train.txt"), header = F,
                      col.names = features[,2])
y_Train <- read.table(file.path(basedir, "train","Y_train.txt"), header = F,
                      col.names = "activity.ID")



#subjectTest
subjectTest <- read.table(file.path(basedir, "test","subject_test.txt"), 
                          header = F, col.names = "subject.Number")
x_Test <- read.table(file.path(basedir, "test","X_test.txt"), header = F,
                     col.names = features[,2])
y_Test <- read.table(file.path(basedir, "test","Y_test.txt"), header = F,
                     col.names = "activity.ID")


#Question 1: Merges the training and the test sets to create one data set.

trainData <- cbind(subjectTrain, y_Train, x_Train)
testData <- cbind(subjectTest, y_Test, x_Test)

allDataQ1 <- rbind(trainData, testData)


#Question 2: Extracts only the measurements on the mean and standard deviation 
#           for each measurement.

extracting <- grepl( "mean", names(allDataQ1) ) | grepl("std", names(allDataQ1))
allDataQ2 <- cbind(allDataQ1[,1:2], allDataQ1[extracting])

#Question 3. Uses descriptive activity names to name the activities in the data
#            set

allDataQ3 <- allDataQ2

allDataQ3$activity.ID <- activityLabels[allDataQ3$activity.ID, 2]

colnames(allDataQ3)[colnames(allDataQ3) == "activity.ID"] <- "activity.Name"



#Question 4. Appropriately labels the data set with descriptive variable names.

allDataQ4 <- allDataQ3


names(allDataQ4) <- gsub("^t","Time", names(allDataQ4))
names(allDataQ4) <- gsub("Freq","Frequency", names(allDataQ4))
names(allDataQ4) <- gsub("^f","Frequency", names(allDataQ4))
names(allDataQ4) <- gsub("Acc","Accelerometer", names(allDataQ4))
names(allDataQ4) <- gsub("Gyro","Gyroscope", names(allDataQ4))
names(allDataQ4) <- gsub("Mag","Magnitude", names(allDataQ4))
names(allDataQ4) <- gsub("BodyBody","Body", names(allDataQ4))
names(allDataQ4) <- gsub("mean","Mean", names(allDataQ4))
names(allDataQ4) <- gsub("std","STD", names(allDataQ4))

#Question 5. From the data set in step 4, creates a second, independent tidy 
# data set with the average of each variable for each activity and each subject.


allDataQ5 <- allDataQ4


finalDataQ5 <- group_by(allDataQ5, subject.Number,  activity.Name)  %>%
                summarize_all(funs(mean))

write.table(finalDataQ5, "finalDataQ5.txt", row.name=FALSE)

