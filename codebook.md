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
