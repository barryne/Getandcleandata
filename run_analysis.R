## The data for this assignment is available at:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## to use this script the data files are assumed to be downloaded 
## and are located in the working directory

## Read the datasets: training, test, activity, features and subject 
trainx <- read.table("X_train.txt")
trainy <- read.table("y_train.txt")
testx <- read.table("X_test.txt")
testy <- read.table("y_test.txt")
trainsubj <- read.table("subject_train.txt")
testsubj <- read.table("subject_test.txt")
activity <- read.table("activity_labels.txt")
features <- read.table("features.txt")

## 1. Merge the training and the test sets to create one data set.
xdata <- rbind(trainx, testx)
ydata <- rbind(trainy, testy)
sdata <- rbind(trainsubj, testsubj)

## 4. Appropriately label the data set with descriptive variable names
names(activity) <- c("actid", "activitytype")
names(features) <- c("featid", "featuretype")
names(sdata) <- c("subjectid")
names(xdata) <- features$featuretype
names(ydata) <- c("activity")

## 2. Extract only the measurements on the mean and 
##    standard deviation for each measurement. 
meanorsd <- grep("-mean\\(\\)|-std\\(\\)", features$featuretype)
xdata <- xdata[, meanorsd]
names(xdata) <- tolower(names(xdata))

## 3. Uses descriptive activity names to name the 
##    activities in the data set
activity[, 2] = gsub("_", "", tolower(as.character(activity[, 2])))
ydata[, 1] = activity[ydata[, 1], 2]

## Merge the cleaned datasets into one dataset
merge <- cbind(sdata, ydata, xdata)

## 5. Creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject. 
meandata <- aggregate(merge, by=list(activity=merge$activity, 
                                     subjectid=merge$subjectid), mean)
meandata[,3]=NULL
meandata[,3]=NULL

## write wide format tidy dataset
write.csv(meandata, "meandatatidy.csv")
## now create long format tidy dataset
featurenames <- names(meandata)[3:68]
meandatalong <- reshape(meandata, 
        varying= featurenames,
        v.names= "mean",
        timevar= "feature",
        times= featurenames,
        direction="long")
meandatalong[,5]=NULL
meandatalong <- meandatalong[with(meandatalong, order(meandatalong$activity, meandatalong$subjectid)),]
write.table(meandatalong, "meandatalong.txt", sep="\t", row.names=FALSE)