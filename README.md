## Getting and Cleaning Data Project

The data for this assignment is available at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
to use the script contained in this repo run_analysis.R the data files will need to be downloaded and located in the working directory. (e.g. "/Users/name/Documents/R")

Bring the run_analysis.R file into R-Studio. 
From the console you can then type: 

source("run_analysis.R")

and run the code.

This will do the following:
- 1. Read the datasets: training, test, activity, features and subject 
- 2. Merge the training and the test sets to create one data set
- 3. Appropriately label the data set with descriptive variable names
- 4. Extract only the measurements on the mean and standard deviation for each measurement
- 5. Uses descriptive activity names to name the activities in the dataset
- 6. Merge the cleaned datasets into one dataset
- 7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
- 8. Write a wide format tidy dataset to the working directory
- 9. And finally, create and write a long format tidy dataset to the working directory (suitable for further analysis such as regression analysis)

