# ProjectCoursera
###Explanation of the script#####
1) create a df with the features and reshape it in order to assign it to train and test df.
2)start working with the training datasets.
  a)save thems in 2 variables training_set & training_labels
  b)merge them with the function cbind() and leave only one df: training
3)the same as 2) but with test datas sets  
  leave ony on df: test
4) merge training and test
  Create "all" df with  rbind() because we are adding more cases to our poblation
5)Extracts only the measurements on the mean and standard deviation for each measurement
  a)create three df: "mean","Mean","std" with grepl that allows me to choose only this columns of "all"
  b)cbind() this three df to have all the measurement in one df: "allmeanandstd"
6)Uses descriptive activity names to name the activities in the data set
  a)save in a df:"activity_labels" 
  b)merge with "allmeanandstd"
  c)drop column one because it does not add nothing
  d)reorder the column for making it more tidy
7)###average each variable for each acctivity###
  a)create "TidyDatasetWithAveragePerAc", which saves de summarise per activities ith th e function summarise()
#######Variables Book########
features
training_set
training_labels
training
test_set
test_labels
test
all
mean
mean2
std
temp
allmeanandstd
activity_labels
allwithactnames
TidyDataset
TidyDatasetWithAveragePerAct


  
 
