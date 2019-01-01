## Data
The data for this exercise is taken from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Description of the data can be viewed at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

## The R script
The file run_analysis.R when run will perform the 5-step task as per instruction. The code is expected to:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Variables
### The variables below are used in the code to assign, merge, and compute for the data necessary.
trainsub, trainx, trainy, testsub, testx, testy, activitylabels, and features  are assigned to store the raw data and labels.
mergetrain and mergetest store the combined data from the raw file while mergeall stores the combined data from the mergetrain and mergetest.
MeanStd store the mean and standard deviation of the data.
TidySet compiles all data along with appropriate descriptive names and labels.
Finally, write.table creates the tabular form, in rows and columns of the processed data, presented with appropriate variable names and labels.
