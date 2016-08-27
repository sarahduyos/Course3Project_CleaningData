setwd("C:/UCI HAR Dataset")

## reading features (metrics calculated on variables, 561)
features <- read.table("features.txt", header = FALSE)

## reading activities (6)
activities <- read.table("activity_labels.txt", header = FALSE)

## defining function that will combine subjects, activities in metrics - argument "test" or "training" will be passed to this function
## for subjects and activities descriptive column names are defined
combinesets <- function(typeofsets){
    setwd(paste("C:/UCI HAR Dataset/", typeofsets, sep = ""))
    subject <- read.table(paste("subject_", typeofsets, ".txt", sep = ""), header = FALSE)
    colnames(subject)[1] <- "subject"
    metrics <- read.table(paste("X_", typeofsets, ".txt", sep = ""), header = FALSE)
    activity <- merge(read.table(paste("Y_", typeofsets, ".txt", sep = ""), header = FALSE), activities)
    colnames(activity)[1] <- "actID"
    colnames(activity)[2] <- "activity"
    cbind(activity, subject, metrics)
}

## calling function combinesets for test and train and combining both datasets into combined
testdata <- combinesets("test")
traindata <- combinesets("train")
combined <- rbind(testdata, traindata)

## renaming columns containing metrics with features that have been read - starting in column 3 because first 2 columns are subject and activity
for (i in 1:561) {colnames(combined)[i+3] <- as.character(features[i, 2])}

## keeping only subject, activity and metrics containing mean or std in name - angle variables containing Mean are excluded 
reduced <- combined[ , grepl("activity", colnames(combined )) | grepl("subject", colnames(combined )) | grepl( "mean", colnames(combined )) |  grepl( "std", colnames( combined ))]

## to get tidy data, special characters are excluded from column names and all names are converted to lower case
for(i in 1:ncol(reduced)) {colnames(reduced)[i] <- tolower(gsub("[[:punct:]]", "", colnames(reduced)[i]))}

## get average (mean) of metrics in reduced data (all columns except first 2) grouping by subject and activity (first 2 columns)
averagebypersonactivity <- aggregate(reduced[,3:ncol(reduced)], reduced[,1:2], FUN = mean)

