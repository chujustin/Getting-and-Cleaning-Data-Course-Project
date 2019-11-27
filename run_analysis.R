library(dplyr)

#1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI_data.zip", method="curl")
unzip("UCI_data.zip", exdir= "UCI HAR Dataset")


#2

activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("code", "measure"))
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$measure)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$measure)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

#3
X <- rbind(x_test, x_train)
Y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

merged_data <- cbind(X, Y, subject)

#4
tidy_set <- merged_data %>% select(subject, code, contains("mean"), contains("std"))

#5
tidy_set$code <- activities[tidy_set$code, 2]
colnames(tidy_set)[2] <- "activity"

#6
names(tidy_set) <- gsub("^t", "Time", colnames(tidy_set))
names(tidy_set) <- gsub("^f", "Frequency", colnames(tidy_set))
names(tidy_set) <- gsub("Acc", "Accelorometer", colnames(tidy_set))
names(tidy_set) <- gsub("Gyro", "Gyroscope", colnames(tidy_set))
names(tidy_set) <- gsub("()", "", colnames(tidy_set))
names(tidy_set) <- gsub("mean", "Mean", colnames(tidy_set), ignore.case = T)
names(tidy_set) <- gsub("std", "STD", colnames(tidy_set), ignore.case = T)
names(tidy_set) <- gsub("freq", "Frequency", colnames(tidy_set), ignore.case = T)
names(tidy_set) <- gsub("gravity", "Gravity", colnames(tidy_set))
names(tidy_set) <- gsub("angle", "Angle", colnames(tidy_set))
names(tidy_set) <- gsub("tBody", "TimeBody", colnames(tidy_set))
names(tidy_set) <- gsub("BodyBody", "Body", colnames(tidy_set))
names(tidy_set) <- gsub("-","",colnames(tidy_set))

#7
final_set <- tidy_set %>% group_by(subject, activity) %>% summarise_all(funs(mean))

write.table(final_set, "Tidy_Set.txt", row.names = F)