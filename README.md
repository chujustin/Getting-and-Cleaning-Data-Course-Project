# Data

UCI HAR Dataset

# Files

* CodeBook.md – The codebook describing variables, data, and work done to clean up the data.

* runanalysis.R – Performs the actual cleaning and importing of the data.
	* Imports the data set from the url and unzips it into local 	directory
	* Creates variables assigning data.
	* Merges the training and test data sets together
	* Subsets the data set so that only the measurements with mean and 	standard deviation are included.
	* Replaces code numbers with their actual activity names.
	* Labels the data sets with more descriptive names.
	* Groups the data set by subject number, then activity name, 	summarise by the mean of each activity and subject, and write into 	a final tidy data set.

* Tidy_Set.txt – the tidy data set in the form of a text file.
