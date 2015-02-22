###Step1 - Merge the training and the test sets to create one data set.###

#Read required data files from the working directory
#Assumtion - All data files in the zip file have been extracted and individual data files are available in the root folder of working directory 

Xtrain<-read.table("X_train.txt")
Xtest<-read.table("X_test.txt")

SubjTrain<-read.table("subject_train.txt")
SubjTest<-read.table("subject_test.txt")

Ytrain<-read.table("y_train.txt")
Ytest<-read.table("y_test.txt")

features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

#Merge Files

Xdata<-rbind(Xtrain,Xtest)
Subj<-rbind(SubjTrain,SubjTest)
Ydata<-rbind(Ytrain,Ytest)

###Step2 - Extracts only the measurements on the mean and standard deviation for each measurement.###

#Extract Mean and Std Deviation measurements (index) frim features file.
mean_columns<-features[grepl("mean",features$V2,ignore.case=T),1]
stddev_columns<-features[grepl("std",features$V2,ignore.case=T),1]
#Combining mean & std deviation column names
features_in_scope<- union(mean_columns,stddev_columns)

#Include only in-scope columns (determined above) in the final data set
Xdata<-Xdata[,features_in_scope]
names(Xdata)<-features[features_in_scope,2]

###Step3- Uses descriptive activity names to name the activities in the data set###

#Update ACtivity Code in Y data file to description value in the "activity" look-up table/file.
Ydata[,1]<-activities[Ydata[,1], 2]

#Combining Xdata, YData and SUbject files into one file
tidy_data<-cbind(Subj,Ydata,Xdata)

#Set column names for first two columns of the combined file
names(tidy_data)[1]<-"Subject"
names(tidy_data)[2]<-"activity"

###Step4- Appropriately labels the data set with descriptive variable names.

#Cleaning up variable(column) descriptions.
names(tidy_data)<-sub("\\(\\)", "", names(tidy_data))
names(tidy_data)<-sub("\\)\\)", "", names(tidy_data))
names(tidy_data)<-gsub("-", "_", names(tidy_data))


###Step5 - Independent tidy data set with the average of each variable for each activity and each subject.

#Invoking "deplyr" package for grouping and aggregation.
library("dplyr")

#Transforming data into dplyr format
tidy_data_dplyr <- tbl_df(tidy_data)
#Group data by Subject and activity fields
grouped_data<-group_by(tidy_data_dplyr,Subject,activity) 
#Mean(Average) for all measurements calculated based on "group-by" values
tidy_data_averages<-summarise_each(grouped_data,funs(mean))

#Write summarised data with averages into a text file
write.table(tidy_data_averages, "tidy_data_averages.txt")
