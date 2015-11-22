# rm(list=ls())
# setwd("/Users/macbookpro/Documents/Data Science/Getting and Cleaning Data/Course Project/")

## The function assemble reads the files and puts together one sigle data.frame called Data
## and returns it with all the data from the directories "test" and "train". 
## pathtodir is the path to the directory where the data is.
## kind is a string that specifies the directory where the file comes from either
## "test" or "train".
## ind takes the values 0 or 1 depending on wether kind is "test" or "train" respectively


Assemble <- function(pathtodir, kind, ind){
        
        ## helper function that sets the name of the ready to read file.
        bfn=function(prefix, kind){
                paste(prefix, kind, ".txt", sep="")        
        }
        
        ## reads the data from the file X_<kind>.txt and fills the data.frame X with it.
        X <- read.table(paste(pathtodir, bfn("X_", kind), sep="/"), sep = "", header = FALSE)
        
        ## reads the data from the file features.txt and fills the data.frame features with it. 
        ### CFM ### features <- read.table("./UCI HAR Dataset/features.txt", sep = "", header = FALSE)
        
        ## names the columns of X with the second column of features, V2.
        ### CFM ### names(X) <- features$V2
        ## reads the data from the file subject_<kind>.txt into the data.frame subjects. 
        subjects <- read.table(paste(pathtodir,bfn("subject_",kind),sep="/"), sep = "", header = FALSE)
        ## names the only column of subjects as subject.
        names(subjects) <- "subject"
        
        ## reads the data from the file y_<kind>.txt and fills the data.frame y with it.
        y <- read.table(paste(pathtodir,bfn("y_",kind),sep="/"), sep = "", header = FALSE)
        ## names the only column of y as activity.
        names(y) <- "activity"
        
        ## redirect the pathtodir inside "Inertial Signals" to access the next files.
        newpathtodir=paste(pathtodir,"Inertial Signals",sep="/")
        
        ## read all the files inside Inertial Signals for each <kind> and fill several data.frames
        ## with names taken from the initials of the original file names.
        
        bax <- read.table(paste(newpathtodir,bfn("body_acc_x_",kind),sep="/"), sep = "", header = FALSE)
        bay <- read.table(paste(newpathtodir,bfn("body_acc_y_",kind),sep="/"), sep = "", header = FALSE)
        baz <- read.table(paste(newpathtodir,bfn("body_acc_z_",kind),sep="/"), sep = "", header = FALSE)
        
        bgx <- read.table(paste(newpathtodir,bfn("body_gyro_x_",kind),sep="/"), sep = "", header = FALSE)
        bgy <- read.table(paste(newpathtodir,bfn("body_gyro_y_",kind),sep="/"), sep = "", header = FALSE)
        
        bgz <- read.table(paste(newpathtodir,bfn("body_gyro_z_",kind),sep="/"), sep = "", header = FALSE)
        tax <- read.table(paste(newpathtodir,bfn("total_acc_x_",kind),sep="/"), sep = "", header = FALSE)
        tay <- read.table(paste(newpathtodir,bfn("total_acc_y_",kind),sep="/"), sep = "", header = FALSE)
        taz <- read.table(paste(newpathtodir,bfn("total_acc_z_",kind),sep="/"), sep = "", header = FALSE)
        
        ## names the columns of all the data.tables created 
        ## pasting together the name of the data.frame and the number of the corresponding column
        ## using a dot as a separator
        names(bax) <- sapply(as.list(1:128),function(x){paste("bax",x,sep=".")})
        names(bay) <- sapply(as.list(1:128),function(x){paste("bay",x,sep=".")})
        names(baz) <- sapply(as.list(1:128),function(x){paste("baz",x,sep=".")})
        
        names(bgx) <- sapply(as.list(1:128),function(x){paste("bgx",x,sep=".")})
        names(bgy) <- sapply(as.list(1:128),function(x){paste("bgy",x,sep=".")})
        names(bgz) <- sapply(as.list(1:128),function(x){paste("bgz",x,sep=".")})
        
        names(tax) <- sapply(as.list(1:128),function(x){paste("tax",x,sep=".")})
        names(tay) <- sapply(as.list(1:128),function(x){paste("tay",x,sep=".")})
        names(taz) <- sapply(as.list(1:128),function(x){paste("taz",x,sep=".")})
        
        ## defines a new column called indicator that labels the rows coming from
        ## each <kind> with a 0 if <kind> = test, or 1 if <kind> = train
        ## according to ind.
        indicator <- rep(ind,length(subjects$subject))
        
        ## fills and returns the data.frame Data cbinding all the created data.frames together
        Data <- cbind(subjects,y,indicator,bax,bay,baz,bgx,bgy,bgz,tax,tay,taz,X)
        return(Data)
}

## fills the data.frame TestData with all the test data.
TestData <- Assemble("./UCI HAR Dataset/test","test",0)
## fills the data.frame TrainData with all the train data.
TrainData <- Assemble("./UCI HAR Dataset/train","train",1)

## fills the data.frame AllData rbinding both data.frames TestData and Traindata.
AllData <- rbind(TestData,TrainData)

## cleans up the workspace
rm(TestData,TrainData)


library(dplyr)

features <- read.table("./UCI HAR Dataset/features.txt", sep = "", header = FALSE)

## reads the columns from AllData which correspond to those in features
## that contain the word mean and fills the data.frame meanData with those columns
meanData <- select(AllData, num_range("V", grep("mean", features$V2, ignore.case=FALSE)))

## reads the columns from AllData which correspond to those in features
## that contain the word std and fills the data.frame sdData with those columns
sdData <- select(AllData, num_range("V", grep("std", features$V2, ignore.case=FALSE)))

## selects the first three columns from Alldata which contains the variables
## subject, activity, and indicator
genData <- select(AllData, 1:3)

Names <- c(names(genData),
        as.character(features$V2[grep("mean", features$V2, ignore.case=FALSE)]),
        as.character(features$V2[grep("std", features$V2, ignore.case=FALSE)])
)

## changes the parenthesis in the variable names by empty spaces
## to clean variable names
Names <- gsub("()","",Names,fixed=TRUE)
# changes the dashes by underscore to clean variable names
Names <- gsub("-","_",Names,fixed=TRUE)

## cleans the workspace
rm(AllData,features)

## creates the data.frame  MSData cbinding genData, meanData, and sdData.
## assigns clean variable names to columns of MSData.
MSData <- cbind(genData,meanData,sdData)
names(MSData) <- Names

## cleans workspace.
rm(meanData,sdData,genData)

activities <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)

## helper function to replace activity codes by the corresponding string
activityLabel <- function(i){activities$V2[i]}

## assigns descriptive names to the activity column of MSData.
MSData <- mutate(MSData,activity=activityLabel(activity))

## groups MSData by the columns subject and activity
GroupedData <- group_by(MSData,subject,activity)

## summarize GroupedData computing the means of all their columns
## This is the data.frame for part 5.
SummarizedData <- summarize_each(GroupedData,funs(mean))

## creates the tidy data set and fills the data.frame LabeledData with it. 
## This is the data.frame for part 4.
LabeledData <- ungroup(GroupedData)

## cleans the worksapce.
rm(GroupedData,activities,MSData,Names,activityLabel,Assemble)

## creates the file "AverageBySubjectActivity.txt" with the tidy data set
## this is the file that will be uploaded to GitHub.
write.table(SummarizedData,"AverageBySubjectActivity.txt",row.names = FALSE)
