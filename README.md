Run_analysis
==========================================
This is a script created to analyse mean and standard deviation of each variable for each activity and each subject in Samsung Galaxy S smartphone experiment.



This function includes following files:
-----------------------------------
- 'README.md'
- 'Codebook.md' : Description of the variables in this function
- 'run_analysis.R' : R script, coded in R version 3.1.2


Prepare:
-------
Before running this script, please
- Download experiment data at:
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Put the Run_analysis script under unzipped data folder(together with train and test folder)
- Set your working directory to this data folder
- Ensure you have installed reshape2 package in R


Notes: 
-----
- Features are normalized and bounded within [-1,1].

=============================
A full description of the experiment is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
