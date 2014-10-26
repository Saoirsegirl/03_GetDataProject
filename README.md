03_Getting_Data_Project
=======================

## Sourcing, Importing and Loading the needed files
Data for this program is sourced and described at the following websites.
**Information about the experiment** design and data collection assumptions are at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
**Files are located at:**  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Please see the codebook "run_analysis.Rmd"  for more description of this program and details on the data sourced, used and output.  

To better segregate functions performing blocks of actions from the distinct actions that create the requested final outputs, the file 03_1_Import_Files.R accompanies the program.
### Functions Performed in 03_1_Import_Files.R

*ImportUCI()*  
1. A folder named "/data"" will be created to house the needed files for this analysis.  
2. download a zip file  
3. open the .zip file - this will create a new folder "UCI HAR Dataset" in your working directory.  This can get messy, so we will  
4. move the files to the ./data folder  

*readin.features()*  
1. Read the features file into a vector and prepare it for use as column names  

*readin.activities()*  
1. Read the features file into a data.frame and prepare it to replace the id's in the y data file.  

*readAndMerge()*  
1. Read the subjects file into a data.frame  
2. Read the X file into a data.frame and update the column names  
3. Read the y file into a data.frame  
4. Merge the 3 data.frames into one complete data frame  
This function can call either "test" or "train" and is used twice in the program.

### Functions Performed in run_analysis.R  
Now that the data has been imported without any changes to the content of the data, it is ready for manipulation and transformation in our program to meet the assignment specificaitons.  

*1 - Merge Training and Test data into one data.frame* -- No data content was changed in this step, only the joining of observation from 2 data sets into one.   

*2 - Extract only the mean() and std() metrics* -- into a new data.frame. Again no data content changes, only a selection of columns out of hte full data set using a regular expression to identify column names needed.  

*3 - Use descriptive data names* -- Requires the merging of the activity descriptions be appended to each data.frame row. Here the id values of 1 thorugh 6 and correspond as follows:  
1.      WALKING  
2.    	WALKING_UPSTAIRS  
3.		WALKING_DOWNSTAIRS  
4.		SITTING  
5.		STANDING  
6.		LAYING  

*4 - Use Descriptive names in the columns* -- Added "subject" and "activity" to the documented features names in the features.txt file provided by the websites above. The originals are retained to avoid confusion. The new column for the full activites description is capitalized "Activity" to make it distinct from the original id column.   

*5 - Calculate the averages* -- using FUN = mean on each subject and activity for each measurement.   