getwd()
setwd("~/Data Science/Getting and Cleaning Data/data2")
variable<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dst2 = 'C:/Users/Chispita/Documents/Data Science/Getting and Cleaning Data/data2/getdata_dataset.zip'
download(variable, dst2, mode="wb") 
## I decompressed the folder "getdata_dataset" straight from "Open windows explorer"
## After that I setwd as follows:
setwd("~/Data Science/Getting and Cleaning Data/data2/getdata_dataset")


## Labels and features:
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
##take a look at the table 
head(activityLabels)

## MEAN and STDDEV
featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWanted.names <- features[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresWanted]

## Load the simplified data sets: 
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)
test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresWanted]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

## Merge data sets 
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featuresWanted.names)

## Factor
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)
allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

## Create file
write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
  