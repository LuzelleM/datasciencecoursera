# Downloading Data Set

## Creating directory for the data set
dir.create("./data")

## Downloading the data set
projectUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(projectUrl, destfile = "./data/dataset.zip")
unzip(zipfile = "./data/dataset.zip", exdir = "./data")

# run_analysis.R will tidy the data by performing the following:
# 1. Merge the training and the test sets into one data set.
trainsub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
trainx <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

testsub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
testx <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testy <- read.table("./data/UCI HAR Dataset/test/y_test.txt")

activitylabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")

colnames(trainsub) <- "subjectId"
colnames(trainx) <- features[,2]
colnames(trainy) <- "activityId"

colnames(testsub) <- "subjectId"
colnames(testx) <- features[,2]
colnames(testy) <- "activityId"

colnames(activitylabels) <- c('activityId', 'activityType')

mergetrain <- cbind(trainy, trainsub, trainx)
mergetest <- cbind(testy, testsub, testx)
mergeall <- rbind(mergetrain, mergetest)

# 2. Extraction of mean and standard deviation of each measurement.
mergecolnames <- colnames(mergeall)
mean_std <- (grepl("activityId", mergecolnames) | grepl("subjectId", mergecolnames) | grepl("mean", mergecolnames) | grepl("std", mergecolnames))

MeanStd <- mergeall[, mean_std == TRUE]

# 3. Labeling activity names decriptively.
activitynames <- merge(MeanStd, activitylabels, by = "activityId", all.x = TRUE)

# 4. Labeling data set decriptively.
# Done in the previous steps.

# 5. Creating independent tidy data set with the average of each variable for each activity and each subject.
TidySet <- aggregate(. ~subjectId + activityId, activitynames, mean)
TidySet <- TidySet[order(TidySet$subjectId, TidySet$activityId),]

write.table(TidySet, "TidySet.txt", row.name = FALSE)