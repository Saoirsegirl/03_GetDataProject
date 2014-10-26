## ---- 03_Getting_and_Cleaning_Data -- Project #1

importUCI <- function() {
    # create/verify data folder in place and retreive and unpack data files
    if (!file.exists('UCI HAR Dataset')) {dir.create('./data')}
    # information on subject: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
    # http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
    file_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(file_URL, "./data/data.zip", method = "curl" )
    unzip("./data/data.zip", overwrite = TRUE)
    # unzip creates a list of files and folders in your working directory - we need to have them in ./data
    
    folders <- list.dirs("./UCI HAR Dataset")
    for (fold in folders)  {
      files <- list.files(fold)
        for (file in files)  {
            file.rename(from = paste0("./UCI HAR Dataset/", file), 
                        to = paste0("./data/", file))
            } } }

readin.features <- function() {
    features <- as.vector(read.table("./data/features.txt")[,2])
}

readin.activities <-  function() {
    activities <- read.table("./data/activity_labels.txt")
}

readAndMerge <- function(dataset) {
    subjects <- read.table(paste0("./data/",dataset, "/subject_",dataset,".txt"))
    x <- read.table(paste0("./data/",dataset, "/X_",dataset,".txt"))
    colnames(x) <- features
    y <- read.table(paste0("./data/",dataset, "/Y_",dataset,".txt"))
    if (dataset == "train") {
        train_data <- cbind(subjects, y, x)
    }else {
        test_data <- cbind(subjects, y, x)
    }
    }
