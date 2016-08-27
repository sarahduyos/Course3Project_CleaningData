==================================================================
Coursera Data Scientist Program, Getting and Cleaning Data Course Project (Course 3, Week 4)
==================================================================
Sarah M. Duyos
==================================================================

GOAL:
The goal of this project is to show the ability to collect, work with, and clean a data set producing tidy data that can be used for later analysis. 

SOURCE:
The input for this project is the data and documentation files in: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The README file in the prior link describes the structure and process followed to obtain the data stored there and the units for each measure.  

==================================================================

SCRIPT:

The R script run_analysis.R will do the following:

	1.Merges the source training and the test sets to create one data set.
	2.Extracts only the measurements on the mean and standard deviation for each measurement, excluding other measurements in the original data. 
	3.Uses descriptive activity names to name the activities in the data set
	4.Appropriately labels the data set with descriptive variable names following the standards for tidy data (no special characters in column names 		  and always lower case). 
	5.From the data set in step 4, a second, independent tidy data set named averagebypersonactivity is created. It contains the average (mean) of 		  each metric for each combination of activity and subject.

==================================================================

UNITS:

Because units are mantained when mean or standard deviation are applied, the units in the resulting dataset averagebypersonactivity are the same that 
the units specified in the README file of the source data.

==================================================================

VARIABLES IN OUTPUT:

The data frame averagebypersonactivity contains the following variables:

activity:		categorical variable with 6 different values describing the activity being performed by the subject
subject:		Integer in range 1 to 30 identifying the subject, for which measures were done
The last 79 variables represent the average values for each of the metrics contained in the original data, where only metrics for mean and standard deviation were kept.

==================================================================

TRANSFORMATIONS:

1. For test and train datasets, activity, subject and metrics (or features) were combined
2. Then the test and train datasets were put together
3. Activity ID with values 1-6 were crosswalked to the activity labels containing descriptive values for each activity
4. Out of the original 561 metrics or features, only 79 pointing to mean or standard deviations were kept.
5. Variables were renamed to conform with tidy data standards by eliminating special characters and using only lower case.
6. Averages for the 79 metrics mentioned in 4. were calculated, grouping by subject and activity.

==================================================================

Sarah M. Duyos, August 2016
