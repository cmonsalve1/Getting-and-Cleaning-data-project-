*Get situated:
getwd()

*Obtain data from website:
variable<-

*Folder for destination of data:
dst2

*Download data: download(variable, dst2, mode="wb") 

*Set working directory conveniently: setwd

*Read table: activityLabels (variable)

*Read table: features (variable)

*View table: head(activityLabels)

*View table: head(features)

*Extract MEAN and STADDEV, funtions "grep" and "gsub" for finding, matching and replacing: Applied to variable "featuresWanted"

*Load datasets (train) "read.table" from two different tables and combine them with "cbind":train <- cbind(trainSubjects, trainActivities, train)

*Load datasets (test) "read.table" from two different tables and combine them with "cbind":test <- cbind(testSubjects, testActivities, test)

*Merge data: allData <- rbind(train, test)

*Encode the vector a"allData" s a factor: allData$activity <- factor(allData$activity...)

*Create a file with: write.table(allData.mean, "tidy.txt"...)
  