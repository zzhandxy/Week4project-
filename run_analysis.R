library(dplyr)

### Downloads the data used in this project from the link provided by the course

if(!file.exists("./course-project")) dir.create("./course-project")
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, "./course-project/data.zip")
data_unzip <- unzip("./course-project/data.zip", exdir = "./course-project")

### Loads the original data R

train_x <- read.table("./course-project/UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./course-project/UCI HAR Dataset/train/y_train.txt")
train_sub <- read.table("./course-project/UCI HAR Dataset/train/subject_train.txt")
test_x <- read.table("./course-project/UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./course-project/UCI HAR Dataset/test/y_test.txt")
test_sub <- read.table("./course-project/UCI HAR Dataset/test/subject_test.txt")

### Merges the training and test data into one data.frame

data_train <- cbind(train_sub, train_y, train_x)
data_test <- cbind(test_sub, test_y, test_x)
data_temp <- rbind(data_train, data_test)

### Loads the features of the data

feature <- read.table("./course-project/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)$V2

### Extracts only the measurements on the mean and standard deviation for each measurement

data <- data_temp[,c(1,2,grep("mean|std",feature)+2)]
colnames(data) <- c("subject", "activity", feature[grep("mean|std",feature)])
name_act <- read.table("./course-project/UCI HAR Dataset/activity_labels.txt")

### Uses descriptive activity names to name the activities in the data set

data$activity <- as.factor(data$activity)
levels(data_with_feature$activity) <- name_act$V2

### Appropriately labels the data set with descriptive variable names

colnames(data) <- gsub("mean", "Mean", names(data))
colnames(data) <- gsub("std", "Std", names(data))
colnames(data) <- gsub("^t", "Time-", names(data))
colnames(data) <- gsub("^f", "Frequency-", names(data))
colnames(data) <- gsub("MeanFreq", "MeanFreqency", names(data))

### Creates independent data set with the average of each variable for each activity and each subject

newdata <- data %>%
    group_by(subject, activity) %>%
    summarize_each(mean)

### Outputs the final data

write.table(newdata, "./course-project/newdata.txt")