#############  run_analysis.R  ###############
#
run_analysis <- function() {
    ## Load necessary Libraries ##
    message("loading libraries...")
    library(httr)
    library(dplyr)
    library(stringr)
    #
    ## Download and unzip the data ##
    if(!file.exists("./data")) { 
        dir.create("./data") 
    }
    #
    ## ...!! it can take some time to download a 6oMB file !!...
    ## Skip the download and unzip if this has already been done
    if(!file.exists("./data/UCI HAR Dataset/test")) { 
        message("Downloading dataset from web (60MB - please be patient!)...")
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI HAR Dataset.zip"
        download.file(fileUrl, destfile="./data/UCI HAR Dataset.zip", method="auto")
        message("Unzipping download file...")
        unzip("./data/UCI HAR Dataset.zip", exdir="./data", overwrite=TRUE)
    }
    #
    ## Create a list of the column labels from features.txt
    dflabels <- read.table("./data/UCI HAR Dataset/features.txt")
    colnames(dflabels) <- c("num", "name")
    #
    ## Remove "()" from the variable names
    ## Also, change "," and "-" to "_"
    dflabels <- mutate(dflabels, name=gsub("\\(\\)", "", name))
    dflabels <- mutate(dflabels, name=gsub("-", "_", name))
    dflabels <- mutate(dflabels, name=gsub(",", "_", name))
    #
    ## Determine which variables are the means and standard deviations
    mean_std <- filter(dflabels, (str_detect(dflabels$name, "_mean") | str_detect(dflabels$name, "_std")) & !str_detect(dflabels$name, "_meanFreq") )
    cols_ms <- mean_std$num
    col_labels <- mean_std$name
    #
    ## Merge the training and the test sets to create one data set.
    message("Reading and processing data files...")
    dftrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
    dftest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
    df_all <- bind_rows(dftrain,dftest)
    #
    ## Remove the columns that aren't needed and the column names
    df_all <- df_all[,cols_ms]
    colnames(df_all) <- col_labels
    #
    ## Load and combine the training and test subject IDs
    ## Also load and combine the activity IDs
    subj_id_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
    act_id_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
    subj_id_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
    act_id_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
    subj_id_all <- bind_rows(subj_id_train, subj_id_test)
    colnames(subj_id_all) <- c("subject")
    act_id_all <- bind_rows(act_id_train, act_id_test)
    colnames(act_id_all) <- c("act_id")
    #
    ## Merge appropriate activity names to the act_id_all data frame
    act_names <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
    colnames(act_names) <- c("act_id","activity")
    act_id_all <- mutate(act_id_all, activity=act_names$activity[act_id])
    #
    ## Combine columns from data frames subj_id_all, act_id_all and df_all
    df_tidy_all <- bind_cols(list(subj_id_all, act_id_all, df_all))
    #
    ## Save a copy of this 1st file and clean up the global environment
    message("Writing 1st output file...")
    write.csv(df_tidy_all, file="./data/df_tidy_all.csv", row.names=FALSE)
    rm(list=ls())
    df_tidy_all <- read.csv(file="./data/df_tidy_all.csv")
    #
    ## Create an independent tidy data set with the average of each variable 
    ## for each activity and each subject.
    df_tidy_summary <- summarise_each(group_by(df_tidy_all, subject, activity), funs(mean), tBodyAcc_mean_X:fBodyBodyGyroJerkMag_std)
    #
    ## Save a copy of this 2nd file as a csv file and also as a plain text file
    message("Writing 2nd output file...")
    write.csv(df_tidy_summary, file="./data/df_tidy_summary.csv", row.names=FALSE)
    write.table(df_tidy_summary, file="./data/df_tidy_summary.txt", row.names=FALSE)
    #
    message("Done...")
    df_tidy_summary
}
#
#############  end of run_analysis.R  ###############