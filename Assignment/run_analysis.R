rm(list=ls(all=TRUE))

library(plyr)

filename <- "getdata_dataset.zip"

## NOTE: setwd to repository path first! ##
## setwd('repository_path_here')

## Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}



## Read in test sets into data.table format
xtest <- read.table('UCI HAR Dataset/test/X_test.txt')
ytest <- read.table('UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')

## Read in training sets into data.table format
xtrain <- read.table('UCI HAR Dataset/train/X_train.txt')
ytrain <- read.table('UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')

## Merge training and test sets, name subject
X <- rbind(xtrain, xtest)
y <- rbind(ytrain, ytest)
subject <- rbind(subject_train, subject_test)
names(subject) <- 'subject'

## Read in feature list and select relevant features (those that end with mean()
## or std()) and then label the features accordingly
features <- as.character(read.table('UCI HAR Dataset/features.txt')[,2])
extract_vec <- grep('.*-(mean|std)\\(\\)', features)
feature_names <- features[extract_vec]
X_ext <- X[, extract_vec]
names(X_ext) <- feature_names

## replace Y data with respective activity names
target_labels <- as.character(read.table('UCI HAR Dataset/activity_labels.txt')[,2])
y_lab <- data.frame(target_labels[unlist(y)])
names(y_lab) <- 'activity'

## merge data into one data.frame
data <- cbind(X_ext, subject, y_lab)

## average the data by activity and subject
averaged_data <- ddply(data, .(activity, subject), function(x) colMeans(x[, 1:66]))
write.table(averaged_data, "averaged_data.txt", row.name=FALSE)
