##Code Book for R script "run_analysis.R"submitted as part of Course project.
###This script is divided into four parts as below. These descriptive information is also present in the code as "comments"
###Step1 - Merge the training and the test sets to create one data set
#####Reads required data files from the working directory
#####It is assumed that all data files in the zip file have been extracted and individual data files are available in the root folder of working directory 
#####Once the files are read from working directory into variables, these files (XTest,Xtrain,YTest,YTrain, SubjectTest&SubjectTrain) are merged into one file 
###Step2 - Extracts only the measurements on the mean and standard deviation for each measurement.###
#####In this step, script extracts column names containing strings "Mean" and "Std". The index of these columns are used in determining in-scope columns.
#####Applied logic to include only in-scope columns (determined above) in the final merged data-set
###Step3- Uses descriptive activity names to name the activities in the data set
#####Activity Code in Y data file will be updated withdescription value in the "activity" look-up table/file.
#####Then the script combines Xdata, YData and Subject files into one consolidated file
#####First two columns in the combined file will be then named as "Subject" & "activity"
###Step4- Appropriately labels the data set with descriptive variable names.
#####Brackets are removed from column names and "-" replaced with "_" using substitute command for better readability
###Step5 - Independent tidy data set with the average of each variable for each activity and each subject.
#####"deplyr" package is being used for grouping and aggregation (Courtesy- Swirl lessons in the module)
#####Data is then grouped by Subject and activity fields
#####Mean(Average) for all measurements are calculated based on groupings mentioned above
#####Finally, script writes summarised data with averages into a text file by name "tidy_data_averages.txt"
