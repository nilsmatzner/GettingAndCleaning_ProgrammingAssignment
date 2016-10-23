#### 1. Downloading and unzipping ####

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("~/R/coursera/ProgAssig_Getting/")){dir.create("~/R/coursera/ProgAssig_Getting/")}
download.file(fileUrl, destfile="~/R/coursera/ProgAssig_Getting/Dataset.zip")
unzip(zipfile="~/R/coursera/ProgAssig_Getting/Dataset.zip", exdir="~/R/coursera/ProgAssig_Getting/")

#### 2. Reading data ####

subject_test    <- read.table("~/R/coursera/ProgAssig_Getting/UCI HAR Dataset/test/subject_test.txt")
x_test          <- read.table("~/R/coursera/ProgAssig_Getting/UCI HAR Dataset/test/X_test.txt")
y_test          <- read.table("~/R/coursera/ProgAssig_Getting/UCI HAR Dataset/test/y_test.txt")
subject_train   <- read.table("~/R/coursera/ProgAssig_Getting/UCI HAR Dataset/train/subject_train.txt")
x_train         <- read.table("~/R/coursera/ProgAssig_Getting/UCI HAR Dataset/train/X_train.txt")
y_train         <- read.table("~/R/coursera/ProgAssig_Getting/UCI HAR Dataset/train/y_train.txt")
features        <- read.table("~/R/coursera/ProgAssig_Getting/UCI HAR Dataset/features.txt")
activity_labels <- read.table("~/R/coursera/ProgAssig_Getting/UCI HAR Dataset/activity_labels.txt")


#### 3. Merging dataset + adding colnames ####
## Objective: "1. Merges the training and the test sets to create one data set."
## Objective: "4. Appropriately labels the data set with descriptive variable names."

## Colnames and tables are bound in the oder of: subject, y, x
columnnames <- c("subjectID", "activityID", as.character(features[, 2]))

merge_train <- cbind(subject_train, y_train, x_train)
merge_test <- cbind(subject_test, y_test, x_test)

merge_all <- rbind(merge_train, merge_test)

colnames(merge_all) <- columnnames

#### 4. Extract certain measurements ####
## Objective: "2. Extracts only the measurements on the mean and standard deviation for each measurement."

grepstr <- c("activityID", "subjectID", "mean\\()", "std\\()")
idx <- grepl(paste(grepstr, collapse="|"), columnnames)

merge_all_select <- merge_all[, idx]

#### 5. Activity names + factors ####
## Objective: "4. Appropriately labels the data set with descriptive variable names. "

colnames(activity_labels) <- c("activityID", "activityType")

merge_all_select$activityID <- factor(merge_all_select$activityID, labels = activity_labels$activityType)

#### 6. New data set with averages ####
## Objective: "5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

merge_all_means <- aggregate(. ~ subjectID + activityID, merge_all_select, mean)

write.table(merge_all_means, "~/R/coursera/ProgAssig_Getting/merge_all_means.txt", row.names = FALSE)
