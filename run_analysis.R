## ---- 03_Getting_and_Cleaning_Data -- Project #1
# use my path, or set you own in its place
myWD <- "~/Documents/Coursera/03-Getting_and_Cleaning_Data/Projects"
#set working directory
setwd(myWD)
# source needed tools
library()
source("03_1_Import_Files.R")

# - Step 1: Identify, load and pre-organize needed files -- source(03_1_Import_Files.R)
importUCI()
features <- readin.features() 
activities <- readin.activities()
colnames(activities) <- c("activity", "Activity")

testData <- readAndMerge("test") 
trainData <- readAndMerge("train") 

# Instruction #1 - merge test and training data
allData <- rbind(testData, trainData)

# Instruction #2 - extract only mean and standard deviation metrics
tidyData1 <- cbind( allData[ , 1:2],
                    allData[ , grepl("mean", names( allData ) ) ],
                    allData[ , grepl("std" , names( allData ) ) ] )
    
# Instruction #3 - Use descriptive activity names
tidyData2 <- merge(activities, tidyData1, by.x = "activity", by.y = "V1.1", all=FALSE)

# instruction #4 - Use descriptive Variable (column) names
names(tidyData2)[1:3] <- c("activity", "Activity", "Subject")

# QA Point - verify subject 2 from test data == subject 2 from tidyData2


# Instruction #5 - Tidy Data set of averages - write to file for submission
submitData <- aggregate(. ~ Subject + Activity, data = tidyData2, FUN = "mean")
write.table(submitData, file="submitData.txt", sep = ",")