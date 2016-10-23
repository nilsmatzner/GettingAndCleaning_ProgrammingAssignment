# Processing script
Using R the script run_analysis.R will automatically download and unzip data.

However, here are the links to the _data_
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and the full _descirption_
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# The R script
The code of run_analysis.R performs the following steps.<br/>
1. Downloading and unzipping files (note that my home directory has been used)
2. Reading data sets into R
3. Merging dataset + adding columnnames
4. Extracting measurements on the mean and standard deviation
5. Assgning propper activity names
6. Creating new tidy data set and writing to file

# The tables and variables
* x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
* features contains the names for the x dataset, which are used as column names.
* activity_labels contains the activity types, which are used as factor labels in the merged data sets.
* merge_train and merge_test are data sets that contain all the training resp. test data after merging the x, y and subject tables.
* merge_all is a row-binded table of merge_train and merge_test.
* merge_all_select is a smaller set of merge_all with only the measurements on the mean and standard deviation for each measurement.
* merge_all_means uses merge_all_select with the average of each variable for each activity and each subject.
