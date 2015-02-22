#### Steps to be followed for executing R script and generating output text file for course project submission evaluation.
##### Step 1 -Download files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##### Step 2 -Unzip contents in the zip file to your local PC and copy below 8 files into your local R working directory.
######  1.X_train.txt
######  2.X_test.txt
######  3.subject_train.txt
######  4.subject_test.txt
######  5.y_train.txt
######  6.y_test.txt
######  7.features.txt
######  8.activity_labels.txt
##### Step3 -Save "run_analysis.R" script into your R working directory
##### Step4 - Execute command source("run_analysis.R") from R Studio
##### Step5 - The script above will generate a text file by name "tidy_data_averages.txt" in your R working directory
##### Step6 - Read "tidy_data_averages.txt" file into R using "read.table" command and evaluate the contents in the file.
