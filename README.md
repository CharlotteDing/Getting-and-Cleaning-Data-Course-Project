Run_analysis Function
==========================================
This is a function created to analyse mean and standard deviation of each variable for each activity and each subject in Samsung Galaxy S smartphone experiment.



This function includes following files:
-----------------------------------
- 'README.md'
- 'Codebook.md' : Description of the variables in this function
- 'run_analysis.R' : R function, coded in R version 3.1.2


Prepare:
-------
Before running this function, please
- Download experiment data at:
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Put the Run_analysis function under unzipped data folder(together with train and test folder)
- Set your working directory to this data folder
- Ensure you have installed reshape2 package in R


Running step:
----------
1, Read train and test set, assign feature names to related records, indicate activity type and experiment subject   
2, Merge train and test sets to a data frame named 'data'   
3, Extract the measurements on the mean and standard deviation for each measurement in 'data' to 'extract'   
4, Name the activities in 'extract' with activity_labels file and subset with all meaningful indices into 'raw' dataframe  
5, Remove typo, symbols and apply camelCase to feature names      
6, Melt 'raw' by Activity and Subject, feature as variables into 'setmelt'    
7, Cast the average of each variable for each activity and each subject, into 'tidydata'  
8, Show tidydata in R   

Notes: 
-----
- Features are normalized and bounded within [-1,1].

=============================
A full description of the experiment is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
