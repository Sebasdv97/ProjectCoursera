list.dirs()
####features of datasets###
features<-read.table( "./UCI HAR Dataset/features.txt",)
dim(features)
features<-t(features)
dim(features)
features<-features[2,]
###merge training datasets####
training_set<-read.table( "./UCI HAR Dataset/train/X_train.txt",col.names = features)
dim(training_set)
training_labels<-read.table( "./UCI HAR Dataset/train/Y_train.txt",)
dim(training_labels)
training<-cbind(training_labels,training_set)
names(training)[1]<-"Labels"
###merge set datasets###
test_set<-read.table( "./UCI HAR Dataset/test/X_test.txt",col.names =features )
dim(test_set)
test_labels<-read.table( "./UCI HAR Dataset/test/y_test.txt")
dim(test_labels)
test<-cbind(test_labels,test_set)
names(test)[1]<-"Labels"
###merge all###
all<-rbind(training,test)
dim(all)
###Extracts only the measurements on the mean and standard deviation for each measurement.###
mean<-all[,grepl(".mean...",names(all))]
mean2<-all[,grepl("Mean.",names(all))]
std<-all[,grepl(".std..",names(all))]
temp<-all[,1]
allmeanandstd<-cbind(temp,mean,mean,mean2,std)
###Uses descriptive activity names to name the activities in the data set###
activity_labels<-read.table( "./UCI HAR Dataset/activity_labels.txt",)
dim(activity_labels)
allwithactnames<-merge(allmeanandstd,activity_labels,by.x ="temp",by.y="V1")
allwithactnames$temp<-NULL
TidyDataset<-allwithactnames[,c(ncol(allwithactnames),1:(ncol(allwithactnames)-1))] #reorder de dataframe
###Appropriately labels the data set with descriptive variable names.###
names(TidyDataset)[1]<-"Activity"
###average each variable for each acctivity###
library(dplyr)
TidyDatasetWithAveragePerAct<-TidyDataset %>% group_by(Activity) %>% summarise_all(funs(mean))