run_analysis<-function(){

        ## Read experiment train data into R, merge with subject and activity valune, set feature names 
        feature<-read.table("features.txt",header=FALSE)
        trainx<-read.table("./train/X_train.txt",header=FALSE)
        trainy<-read.table("./train/y_train.txt",header=FALSE)
        trainsub<-read.table("./train/subject_train.txt",header=FALSE)
        names(trainx)<-feature[,2]
        names(trainsub)<-"Subject"
        train<-cbind(trainy,trainsub,trainx)
        
        ## Read experiment test data into R, merge with subject and activity value, set feature names 
        testx<-read.table("./test/X_test.txt",header=FALSE)
        testy<-read.table("./test/y_test.txt",header=FALSE)
        testsub<-read.table("./test/subject_test.txt",header=FALSE)
        names(testx)<-feature[,2]
        names(testsub)<-"Subject"
        test<-cbind(testy,testsub,testx)
        
        ## Merge train and test data
        data<-rbind(train,test)
        
        ## Extract subject, activity and column names with mean and std
        extract<-data[,c(1,2,grep("mean",colnames(data)),grep("std",colnames(data)))]
        
        ## Apply descriptive activity names according to value
        activity<-read.table("activity_labels.txt",header=FALSE)
        names(activity)<-c("1","Activity")
        setname<-merge(activity,extract,by.x="1",by.y=1)
        raw<-setname[,2:82]
        
        ## Fix typo, remove symbol and apply camelCase to column names
        colnames(raw)<-gsub("BodyBody","Body",colnames(raw),fixed=TRUE)
        colnames(raw)<-gsub("()","",colnames(raw),fixed=TRUE)
        colnames(raw)<-gsub("-","",colnames(raw),fixed=TRUE)
        colnames(raw)<-gsub("std","Std",colnames(raw),fixed=TRUE)
        colnames(raw)<-gsub("mean","Mean",colnames(raw),fixed=TRUE)
        
        ## Reshape experiment data as variables to Activity and Subject, get mean of each variable by Activity and Subject
        library(reshape2)
        setmelt<-melt(raw,id=c("Activity","Subject"),measure.vars=colnames(raw[,3:81]))
        tidydata<-dcast(setmelt,Subject+Activity~variable,mean)
        
        ## Output result
        View(tidydata)
}
