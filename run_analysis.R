#sample input parameters
#run_analysis("UCI HAR Dataset/", "x_tidy_dataset.txt", "x_dataset_summary.txt")

run_analysis <- function(datasetDir = "UCI HAR Dataset/", xTidyDatasetPath = "x_tidy_dataset.txt", xTidyDatasetSummaryPath = "x_dataset_summary.txt") {

    xTestDatasetPath <- "test/X_test.txt"
    yTestLabelsPath <- "test/y_test.txt"
    subjectTestPath <- "test/subject_test.txt"
    xTrainDatasetPath <- "train/X_train.txt"
    yTrainLabelsPath <- "train/y_train.txt"
    subjectTrainPath <- "train/subject_train.txt"
    
    xNamesPath <- "features.txt"
    activityLabelsPath <- "activity_labels.txt"
    
    #testing puropse
    tstNrows = -1
    
    #read
    xTestDataset <- read.table(paste0(datasetDir, xTestDatasetPath), nrows = tstNrows)
    yTestLabels <- read.table(paste0(datasetDir, yTestLabelsPath), nrows = tstNrows)
    subjectTest <- read.table(paste0(datasetDir, subjectTestPath), nrows = tstNrows)
    xTrainDataset <- read.table(paste0(datasetDir, xTrainDatasetPath), nrows = tstNrows)
    yTrainLabels <- read.table(paste0(datasetDir, yTrainLabelsPath), nrows = tstNrows)
    subjectTrain <- read.table(paste0(datasetDir, subjectTrainPath), nrows = tstNrows)
    
    xNames <- read.table(paste0(datasetDir, xNamesPath))
    activityLabels <- read.table(paste0(datasetDir, activityLabelsPath))
    
    #merge
    xDataset <- rbind(xTestDataset, xTrainDataset)
    yLabels <- rbind(yTestLabels, yTrainLabels)
    subject <- rbind(subjectTest, subjectTrain)
    rm(xTestDataset, yTestLabels, xTrainDataset, yTrainLabels, subjectTest, subjectTrain)
    
    #adding labels
    xNames <- xNames[,2]
    names(xDataset) <- xNames
    xDataset["activityId"] <- yLabels
    xDataset["subject"] <- subject
    rm(xNames, yLabels, subject)
    
    #adding activity column
    names(activityLabels) <- c("activityId", "activityName")
    xDataset <- merge(xDataset, activityLabels)
    rm(activityLabels)
    
    #subsetting
    xDataset <- xDataset[,grep("mean[^F]|std|activityName|subject", names(xDataset))]
    
    #names conversion
    names(xDataset) <- gsub("\\(|\\)","", names(xDataset))
    names(xDataset) <- gsub("(Body)+","Body", names(xDataset))
    names(xDataset) <- gsub("-mean","Mean", names(xDataset))
    names(xDataset) <- gsub("-std","Deviation", names(xDataset))
    names(xDataset) <- gsub("^t","time", names(xDataset))
    names(xDataset) <- gsub("^f","fourier", names(xDataset))
    names(xDataset) <- gsub("Gyro","Gyroscope", names(xDataset))
    names(xDataset) <- gsub("Acc","Accelerometer", names(xDataset))
    names(xDataset) <- gsub("Mag","Magnitude", names(xDataset))
    
    #summary
    xDatasetSummary <- aggregate(xDataset[, 1:66], list(xDataset$subject, xDataset$activityName), mean)
    
    #spool to file
    write.table(xDataset, xTidyDatasetPath, row.names = FALSE)
    write.table(xDatasetSummary, xTidyDatasetSummaryPath, row.names = FALSE)
    rm(xDataset, xDatasetSummary)
}
