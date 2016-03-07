============================================================
Assignment: Getting and Cleaning Data Course Project
Sudent: mbieganski
============================================================

CODEBOOK

1. All paths to raw data files are hardcoded

2. tstNrows variable is used to perform fast test of the script, it's limiting number of rows read from raw data files. Set to -1 causes reading all rows

3. [read] section code reads files content into separate dataframes

4. [merge] section code merges test and train datasets, rm is performed to reduce memory usage. This meets assignment requirement no. 1.

5. [adding labels] section code sets dataset names. activityId is used to join column with activity names in next section. This meets assignment requirement no. 3.

6. [subset] section code extracts columns with mean and standard deviation values, also activity name and subject is extracted. This meets assignment requirement no. 2.

7. [names conversion] section code makes names more descriptive. Unnecessary characters are removed. This meets assignment requirement no. 4.

8. [summary] section code creates independent tidy data set with the average of each variable for each activity and each subject. This meets assignment requirement no. 5.

9. [spool to file] section code creates separate files for each dataset