============================================================
Assignment: Getting and Cleaning Data Course Project
Sudent: mbieganski
============================================================

I. Submission consists of:

- README.md - file listing and quickstart instructions 
- CodeBook.md - describes the variables, the data, and any transformations or work to clean up the data
- x_tidy_dataset.txt - tidy data meeting assignment's requirements
- x_dataset_summary.txt - tidy data set with the average of each variable for each activity and each subject

II. Quickstart

1. run source() function passing path to run_analysis.R file stored on Your drive. run_analysis function will be created in Your R environment

	Example:
	source("run_analysis.R")

2. execute run_analysis function with appropriate paramwters, which are:

	datasetDir - localization of unizipped getdata-projectfiles-UCI HAR Dataset.zip archive (default: "UCI HAR Dataset/")
	xTidyDatasetPath - path (directory and filename) of tidy dataset result file (default: "x_tidy_dataset.txt")
	xTidyDatasetSummaryPath - path (directory and filename) where would You like to store summaries based on tidy dataset (default: "x_dataset_summary.txt")

	Example using defaults:
	run_analysis()

3. Check directories that You specified previously executing run_analysis function. 2 new files are supposed to be visible

============================================================














