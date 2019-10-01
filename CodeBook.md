 For this `run_analysis.R` script

 `basedir` variable is simply the subdirectory of the downloaded 
 "UCI HAR Dataset" data. It is used in read.table codes to convert 
 "UCI HAR Dataset"" data to .csv format.

 For each file in "UCI HAR Dataset"" downloaded data, there is a data.frame
 variable created by read.table

 `features` contains features.txt  
 `activityLabels` contains activity_labels.txt  
  
 `subjectTrain` contains train/subject_train.txt  
 `x_Train` contains train/X_train.txt  
 `y_Train` contains train/X_train.txt  
  
 `x_Test` contains train/subject_test.txt  
 `x_Test` contains train/X_test.txt  
 `y_Test` contains train/Y_test.txt  
  
 `trainData` combines subjectTrain, x_Train, and y_Tain  
 `testData` combines subjectTest, x_Test, and y_Test  
  
Q1:

 `allDataQ1` is my answer to question 1 and it combines the rows of trainData 
 and testData  
  
Q2:
  
 `extracting` is a logical vector of the `mean` and `std` are grepl'ed from 
 allDataQ1  
  
 Using that logical variable mapping of those two column words, the data is put   
 into `allDataQ2`, which is also my answer to Question 2  
  
Q3:
  
 `allDataQ3` is my data.frame answer to Question 3. It replaces all the   
 activity.ID numbers with its corresponding activity.Name found in   
 activityLabels data.frame  
  
  
Q4:
  
 `allDataQ4` is my answer to question 4. It simply replaces abbreviated words in   
 column names with their full names. It also uses title format naming instead of   
 lowercase.  
   
   
Q5:
    
` allDataQ5` data.frame is a copy of allDataQ4 to work with to make  
 finalDataQ5.  
   
 `finalDataQ5` is my answer to Question 5. It groups   
 column data from subject.Number and activity.Name. Then it summarizes then with  
 a means function.  
  
---
    
    
This is a List of the assignment's questions:                                             


**Question 1: Merges the training and the test sets to create one data set.**   
**Question 2: Extracts only the measurements on the mean and standard deviation 
 for each measurement.**  
**Question 3. Uses descriptive activity names to name the activities in the data 
 set**  
**Question 4. Appropriately labels the data set with descriptive variable names.**
**Question 5. From the data set in step 4, creates a second, independent 
tidy data set with the average of each variable for each activity and each subject.**