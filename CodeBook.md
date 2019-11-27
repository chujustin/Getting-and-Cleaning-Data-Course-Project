

1\. Download and extract the zip file of the raw data into the folder "UHI HAR Dataset", which is created automatically on unzipping.

2\. Create variables assigning data.

* features (561 rows, 2 columns) - The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
* activities (6 rows, 2 columns) - The list of activities performed and the corresponding code representing each activity.

* x_test (2947 rows, 561 columns) - The test data.
* y_test (2947 rows, 1 column) - The activity codes for the test data.
* subject_test (2947rows, 1 column) - The subject label for the test data.
* x_train (7352 rows, 561 columns) - The training data.
* y_train (7352 rows, 1 column) - The activity codes for test data.
* subject_train (7352 rows, 1 column) - The subject label for the test data.

3\. Merge the training and test data sets together

* X (10299 rows, 561 columns) is created by rbinding x_test and x_train
* Y (10299 rows, 1 column) is created by rbinding y\_test and y\_train
* Subject (10299 rows, 1 column) is created by rbinding subject\_test and subject\_train
* merged_data (10299 rows, 563 column) is created by cbinding the above three data frames.

4\. Subset the data set so that only the measurements with mean and standard deviation are included.

* tidy\_set is created by subsetting merged\_data so that only the columns with "mean" and "std" (standard deviation) are included, as well the subject and code numbers.

5\. Replace code numbers with their actual activity names.

* using the activities data frame, replace the code numbers in the code column with their corresponding activity names and rename the column "activity".

6\. Label the data sets with more descriptive names.

* leading "t" is replaced with "Time"
* leading "f" is replaced with "Frequency"
* "Acc" is replaced with "Accelerometer"
* "Gyro" is replaced with "Gyroscope"
* "BodyBody" is replaced with "Body"
* "Mag" is replaced with "Magnitude"

7\. Group the data set by subject number, then activity name, summarise by the mean of each activity and subject, and write into a final tidy data set.
