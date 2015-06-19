# CodeBook for the Getting-and-Cleaning-Data-Course-Project

The data for the project was downloaded as a Zip file from:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
  
Once unzipped into the "./data" directory, the data consists of 28 files in 4 folders. For purposes of this assignments, the raw data contained in the Inertial Signals directories was ignored. The remaining files of interest were contained in a directory structure as depicted below under the "root" directory "UCI HAR Dataset".

UCI HAR Dataset
+-- Test
    +-- Inertial Signals
	    subject_test.txt
		X_test.txt
		y_test.txt
+-- Train
    +-- Inertial Signals
	    subject_train.txt
		X_train.txt
		y_train.txt
    activity_labels.txt
	features.txt
	features_info.txt
	README.txt

The files X_test.txt (2947 lines/rows) and X_train.txt (7352 lines/rows) contain the raw accelerometer and gyroscope 3-axial signals and the other "features" recorded for the experiment. Each observation or row in these two data files contains 561 individual data values. 

The file features.txt contains a complete listing of the variable names for each of the 561 data points in each row of the X_test.txt and X_train.txt data files. For this exercise or project, I was only concerned with extracting the variables recording mean and standard deviations for the following variables or "signals" described in features_info.txt:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag	

'-XYZ' in the variable names above denotes 3-axial signals in the X, Y and Z directions. 

One strategy in working with these files was to create a vector of column headings from the variable names in features.txt. Unfortunately, this wasn't as easy as I'd hoped. First, the name strings in the file contained problematic characters -- in particular, dashes (minus signs), commas, and parentheses. These were removed, but, even worse, there were duplicate variable names -- for example "fBodyAcc-bandsEnergy()-1,8" appears 3 times (lines 303, 317, and 331). These "bandsEnergy" duplicate name issues made it necessary to remove unwanted columns before using a vector subset of the variable names as column headings.
	
The files subject_test.txt and subject_train.txt are effectively vectors of the subject numbers associated with the observations in the "X_test.txt" (2947 observations) and the X_train.txt (7352 observations) files.

The files y_test.txt and y_train.txt again are vectors containing the activity identifiers (activity numbers) associated with the observations in the "X_test.txt" (2947 observations) and the X_train.txt (7352 observations) files.
	
In total, there were (8*6 + 9*2) = 66 data columns selected from the "X" files. In addition, the respective subject numbers, activity identifiers, and activity names were added to an intermediate file of dimensions [10299 x 69]. 
	
The intermediate file was grouped by subject and activity then summarized within groups by averaging the signal data within each group. When displayed, the output of the run_analysis() function is as follows:

Source: local data frame [180 x 68]
Groups: subject

subject           activity tBodyAcc_mean_X tBodyAcc_mean_Y tBodyAcc_mean_Z tBodyAcc_std_X
      1             LAYING       0.2215982    -0.040513953      -0.1132036    -0.92805647
      1            SITTING       0.2612376    -0.001308288      -0.1045442    -0.97722901
      1           STANDING       0.2789176    -0.016137590      -0.1106018    -0.99575990
      1            WALKING       0.2773308    -0.017383819      -0.1111481    -0.28374026
      1 WALKING_DOWNSTAIRS       0.2891883    -0.009918505      -0.1075662     0.03003534
      1   WALKING_UPSTAIRS       0.2554617    -0.023953149      -0.0973020    -0.35470803
      2             LAYING       0.2813734    -0.018158740      -0.1072456    -0.97405946
      2            SITTING       0.2770874    -0.015687994      -0.1092183    -0.98682228
      2           STANDING       0.2779115    -0.018420827      -0.1059085    -0.98727189
      2            WALKING       0.2764266    -0.018594920      -0.1055004    -0.42364284
    ...                ...             ...             ...             ...            ...
Variables not shown: tBodyAcc_std_Y (dbl), tBodyAcc_std_Z (dbl), tGravityAcc_mean_X (dbl),
  tGravityAcc_mean_Y (dbl), tGravityAcc_mean_Z (dbl), tGravityAcc_std_X (dbl),
  tGravityAcc_std_Y (dbl), tGravityAcc_std_Z (dbl), tBodyAccJerk_mean_X (dbl),
  tBodyAccJerk_mean_Y (dbl), tBodyAccJerk_mean_Z (dbl), tBodyAccJerk_std_X (dbl),
  tBodyAccJerk_std_Y (dbl), tBodyAccJerk_std_Z (dbl), tBodyGyro_mean_X (dbl),
  tBodyGyro_mean_Y (dbl), tBodyGyro_mean_Z (dbl), tBodyGyro_std_X (dbl), 
  tBodyGyro_std_Y (dbl), tBodyGyro_std_Z (dbl), tBodyGyroJerk_mean_X (dbl),
  tBodyGyroJerk_mean_Y (dbl), tBodyGyroJerk_mean_Z (dbl), tBodyGyroJerk_std_X (dbl),
  tBodyGyroJerk_std_Y (dbl), tBodyGyroJerk_std_Z (dbl), tBodyAccMag_mean (dbl), 
  tBodyAccMag_std (dbl), tGravityAccMag_mean (dbl), tGravityAccMag_std (dbl),
  tBodyAccJerkMag_mean (dbl), tBodyAccJerkMag_std (dbl), tBodyGyroMag_mean (dbl),
  tBodyGyroMag_std (dbl), tBodyGyroJerkMag_mean (dbl), tBodyGyroJerkMag_std (dbl),
  fBodyAcc_mean_X (dbl), fBodyAcc_mean_Y (dbl), fBodyAcc_mean_Z (dbl), 
  fBodyAcc_std_X (dbl),fBodyAcc_std_Y (dbl), fBodyAcc_std_Z (dbl), 
  fBodyAccJerk_mean_X (dbl), fBodyAccJerk_mean_Y (dbl), fBodyAccJerk_mean_Z (dbl),
  fBodyAccJerk_std_X (dbl), fBodyAccJerk_std_Y (dbl), fBodyAccJerk_std_Z (dbl),
  fBodyGyro_mean_X (dbl), fBodyGyro_mean_Y (dbl), fBodyGyro_mean_Z (dbl), 
  fBodyGyro_std_X (dbl), fBodyGyro_std_Y (dbl), fBodyGyro_std_Z (dbl), 
  fBodyAccMag_mean (dbl), fBodyAccMag_std (dbl), fBodyBodyAccJerkMag_mean (dbl),
  fBodyBodyAccJerkMag_std (dbl), fBodyBodyGyroMag_mean (dbl), fBodyBodyGyroMag_std (dbl),
  fBodyBodyGyroJerkMag_mean (dbl),fBodyBodyGyroJerkMag_std (dbl)
