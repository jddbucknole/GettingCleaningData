#Download and Unzip data
fileUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("data")){
      dir.create("data")
}
if(!file.exists("projdata")){
      dir.create("projdata")
}
download.file(fileUrl,destfile="./projdata/get_data_project.zip")
datafiles<-unzip("./projdata/get_data_project.zip")

#Load train
Xtrain <- read.table("./UCI HAR dataset/train/X_train.txt")
Ytrain <- read.table("./UCI HAR dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR dataset/train/subject_train.txt")


#Load test
Xtest <- read.table("./UCI HAR dataset/test/X_test.txt")
Ytest <- read.table("./UCI HAR dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR dataset/test/subject_test.txt")

train<-cbind(Xtrain,subject_train,Ytrain)
test<-cbind(Xtest,subject_test,Ytest)

merged_data<-rbind(train,test)

varnames<-read.table("./UCI HAR dataset/features.txt")


names(merged_data)<-c(as.character(varnames$V2),"SubjectID","Activity")


# Extract only Mean and Standard deviation variables
mean_var_index <- grep("mean()",varnames$V2,ignore.case=TRUE, value=FALSE)
std_var_index <- grep("std()",varnames$V2,ignore.case=TRUE, value=FALSE)
info_var_index<-c(562,563)
varlist<-names(merged_data)


mean_std_only <- merged_data[,varlist[sort(c(mean_var_index,std_var_index,info_var_index))]]
names(mean_std_only)<-varlist[sort(c(mean_var_index,std_var_index,info_var_index))]

#Give sensible labels to activities
mean_std_only$Activity <- factor(as.factor(mean_std_only$Activity),
                    levels = c(1,2,3,4,5,6),
                    labels = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting","Standing", "Laying")) 

#Name the variables--Note: I am hesitant to do this because I'd prefer the subject matter expert names the variables appropriately
better_names <- gsub("-","",names(mean_std_only))
better_names <- gsub("()X","X",better_names,fixed=TRUE)
better_names <- gsub("()Y","X",better_names,fixed=TRUE)
better_names <- gsub("()Z","Z",better_names,fixed=TRUE)
better_names <- gsub("Acc","Acceleration",better_names,fixed=TRUE)
better_names <- gsub("Gyro","Gyroscope",better_names,fixed=TRUE)
better_names <- gsub("mean","Mean",better_names,fixed=TRUE)
better_names <- gsub("std","StandardDeviation",better_names,fixed=TRUE)
better_names <- gsub("Mag","Magnitude",better_names,fixed=TRUE)
better_names <- gsub("Freq","Frequency",better_names,fixed=TRUE)
better_names <- gsub("BodyBody","Body",better_names)

names(mean_std_only) <- better_names
      
      
#Create a tidy dataset with average of each variable for each activity and each subject
library(reshape2)
data1 <- mean_std_only

tidy <- aggregate(data1[,1:86],by=list(data1$SubjectID,data1$Activity),FUN=mean,na.rm=TRUE)

names(tidy)[1:2]<-c("Subject","Activity")

write.table(tidy, file="./data/tidy_activity_data.txt")



      
      
      
      