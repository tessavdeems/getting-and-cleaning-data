==================================================================
Getting and Cleaning data course project
Coursera
==================================================================

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

To run the data the unzipped folder 'UCI HAR Dataset' should be in the working directory. 
Furthermore, the package 'dplyr' should be installed.

The run_analysis.R script is divided into five steps: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

After running these steps, two data files are created.
Data: Tidy data set with all the mean and std columns for all training and test data
Data_average: Summarized dataset of 'Data', where the mean of all columns is taken for each activity and subject.
