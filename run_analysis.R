
## Script that does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data 
#    set with the average of each variable for each activity and each subject.

# It is assumed that the data is downloaded and unzipped to the folder
# "UCI HAR Dataset" in the current working folder. Or else, it can be obtained with (uncomment next 2 rows)
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
# unzip("dataset.zip")

## Loading libraries

library(dplyr)
library(stringr) # To search in strings

## Reading in all the data (Sorry about the long lines)
# Using tbl_df to make dataframes more readable.

# Categorization files
features <- tbl_df(read.table(".\\UCI HAR Dataset\\features.txt"))
activity_labels <- tbl_df(read.table(".\\UCI HAR Dataset\\activity_labels.txt"))

# test data
subject_test <- tbl_df(read.table(".\\UCI HAR Dataset\\test\\subject_test.txt"))
x_test <- tbl_df(read.table(".\\UCI HAR Dataset\\test\\X_test.txt"))
y_test <- tbl_df(read.table(".\\UCI HAR Dataset\\test\\y_test.txt"))

# train data
subject_train <- tbl_df(read.table(".\\UCI HAR Dataset\\train\\subject_train.txt"))
x_train <- tbl_df(read.table(".\\UCI HAR Dataset\\train\\X_train.txt"))
y_train <- tbl_df(read.table(".\\UCI HAR Dataset\\train\\y_train.txt"))

## 1. Merge the training and the test sets to create one data set.

# Set column names to X as given in features
colnames(x_test) <- features$V2
colnames(x_train) <- features$V2

# Include activities, with correct labels, adding suvjects and making the column
# Category ("test" or "train")
y_test[y_test$V1 %in% activity_labels$V1[1],] <- 'WALKING'
y_test[y_test$V1 %in% activity_labels$V1[2],] <- 'WALKING_UPSTAIRS'
y_test[y_test$V1 %in% activity_labels$V1[3],] <- 'WALKING_DOWNSTAIRS'
y_test[y_test$V1 %in% activity_labels$V1[4],] <- 'SITTING'
y_test[y_test$V1 %in% activity_labels$V1[5],] <- 'STANDING'
y_test[y_test$V1 %in% activity_labels$V1[6],] <- 'LAYING'
Activity <- factor(y_test$V1, levels = activity_labels$V2)
colnames(subject_test) <- "Subject"
Category <- rep("test", length(y_test$V1))
testDF <- tbl_df(cbind(Category, subject_test, Activity, x_test))


y_train[y_train$V1 %in% activity_labels$V1[1],] <- 'WALKING'
y_train[y_train$V1 %in% activity_labels$V1[2],] <- 'WALKING_UPSTAIRS'
y_train[y_train$V1 %in% activity_labels$V1[3],] <- 'WALKING_DOWNSTAIRS'
y_train[y_train$V1 %in% activity_labels$V1[4],] <- 'SITTING'
y_train[y_train$V1 %in% activity_labels$V1[5],] <- 'STANDING'
y_train[y_train$V1 %in% activity_labels$V1[6],] <- 'LAYING'
Activity <- factor(y_train$V1, levels = activity_labels$V2)
colnames(subject_train) <- "Subject"
Category <- rep("train", length(y_train$V1))
trainDF <- tbl_df(cbind(Category, subject_train, Activity, x_train))

# Combining testDF and trainDF, by rows
df <- rbind(testDF,trainDF)

## 2. Extracts only the measurements on the mean and standard deviation 
## for each measurement. 

# To be able to use dplyr functions on df it has to have valid column names
valid_column_names <- make.names(names(df), unique = T)
names(df) <- valid_column_names

# Selects the appropriate columns to a new dataframe (not including meanFreq)
df_tidy1 <- select(df, matches("Category"), matches("Subject"), matches("Activity"),
    contains("mean.."), contains("std.."))

## 3. Use descriptive activity names to name the activities in the data set

# I didn't realize it but this part is already completed in part 1, with the
# clumsy "y_train[y_train$V1 %in% activity_labels$V1[1],] <- 'WALKING'" lines

## 4. Appropriately label the data set with descriptive variable names.

# Names already from features.txt, but removing the dots in the labels
# makes the variables more readable and easier to work with. Uing gsub for that.
names(df_tidy1) <- gsub("\\.", "", names(df_tidy1))

## 5. From the data set in step 4, creates a second, independent tidy data
## set with the average of each variable for each activity and each subject.

# First sorting the df_tidy1 after 1-Activity and 2-Subject
df_tidy2 <- arrange(df_tidy1, Activity, Subject)

# Group variables we want to average for (Activity and Subject)
df_tidy <- df_tidy2 %>%
    group_by(Activity, Subject) %>%
    summarise_each(funs(mean), tBodyAccmeanX:fBodyBodyGyroJerkMagstd)

# Finally, writing the tidy dataframe to .txt file :)
write.table(df_tidy, file = "DF_tidy_GaCD_project.txt", row.names = FALSE)




