Getting and Cleaning Data - Course Project
==========================================

This repository hosts the R script and documentation files for the Getting and Cleaning Data Course Project from coursera.

The dataset being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files

`run_analysis.R` is a script that performs the following steps:

* Downloads UCI HAR dataset into working directory

* Merges training and test datasets together

* Selects only features that represent mean or standard deviations of readings

* Replaces target labels and data headings with relevant and readable names

* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

`averaged_data.txt` contains the output of the script `run_analysis.R`.

`CodeBook.md` indicates all variables, data, and any transformations or work performed to clean up the data.
