# CodeBook for the Getting-and-Cleaning-Data-Course-Project

<h2>Study Design</h2>

A description of the original study design and the data collected can be found at the following web location:<br>
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Also, the original zip file data download contains the file features_info.txt that provides the following which I have excerpted. 
<pre>
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope
3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' 
to denote time) were captured at a constant rate of 50 Hz. Then they were filtered 
using a median filter and a 3rd order low pass Butterworth filter with a corner 
frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then 
separated into body and gravity acceleration signals (tBodyAcc-XYZ and 
tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency 
of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in 
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the 
magnitude of these three-dimensional signals were calculated using the Euclidean 
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

  _mean: Mean value
  _std: Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample.
These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
</pre>

<h2>Code Book</h2>

The following list describes the data types (columns) in the data frame returned by the function run_analysis(). Each numeric row in the data frame is a summation of all the observations for the associated subject and activity. All numeric values 
<pre>
Variable                  Data Type
========================= ===============
subject				      integer (1 to 30)
activity                  factor/text ("LAYING", "SITTING", "STANDING", "WALKING",
                                       "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS")
tBodyAcc_mean_X           numeric (-1.0 < x < 1.0)
tBodyAcc_mean_Y           numeric (-1.0 < x < 1.0)
tBodyAcc_mean_Z           numeric (-1.0 < x < 1.0)
tBodyAcc_std_X            numeric (-1.0 < x < 1.0)
tBodyAcc_std_Y            numeric (-1.0 < x < 1.0)
tBodyAcc_std_Z            numeric (-1.0 < x < 1.0)
tGravityAcc_mean_X        numeric (-1.0 < x < 1.0)
tGravityAcc_mean_Y        numeric (-1.0 < x < 1.0)
tGravityAcc_mean_Z        numeric (-1.0 < x < 1.0)
tGravityAcc_std_X         numeric (-1.0 < x < 1.0)
tGravityAcc_std_Y         numeric (-1.0 < x < 1.0)
tGravityAcc_std_Z         numeric (-1.0 < x < 1.0)
tBodyAccJerk_mean_X       numeric (-1.0 < x < 1.0)
tBodyAccJerk_mean_Y       numeric (-1.0 < x < 1.0)
tBodyAccJerk_mean_Z       numeric (-1.0 < x < 1.0)
tBodyAccJerk_std_X        numeric (-1.0 < x < 1.0)
tBodyAccJerk_std_Y        numeric (-1.0 < x < 1.0)
tBodyAccJerk_std_Z        numeric (-1.0 < x < 1.0)
tBodyGyro_mean_X          numeric (-1.0 < x < 1.0)
tBodyGyro_mean_Y          numeric (-1.0 < x < 1.0)
tBodyGyro_mean_Z          numeric (-1.0 < x < 1.0)
tBodyGyro_std_X           numeric (-1.0 < x < 1.0)
tBodyGyro_std_Y           numeric (-1.0 < x < 1.0)
tBodyGyro_std_Z           numeric (-1.0 < x < 1.0)
tBodyGyroJerk_mean_X      numeric (-1.0 < x < 1.0)
tBodyGyroJerk_mean_Y      numeric (-1.0 < x < 1.0)
tBodyGyroJerk_mean_Z      numeric (-1.0 < x < 1.0)
tBodyGyroJerk_std_X       numeric (-1.0 < x < 1.0)
tBodyGyroJerk_std_Y       numeric (-1.0 < x < 1.0)
tBodyGyroJerk_std_Z       numeric (-1.0 < x < 1.0)
tBodyAccMag_mean          numeric (-1.0 < x < 1.0)
tBodyAccMag_std           numeric (-1.0 < x < 1.0)
tGravityAccMag_mean       numeric (-1.0 < x < 1.0)
tGravityAccMag_std        numeric (-1.0 < x < 1.0)
tBodyAccJerkMag_mean      numeric (-1.0 < x < 1.0)
tBodyAccJerkMag_std       numeric (-1.0 < x < 1.0)
tBodyGyroMag_mean         numeric (-1.0 < x < 1.0)
tBodyGyroMag_std          numeric (-1.0 < x < 1.0)
tBodyGyroJerkMag_mean     numeric (-1.0 < x < 1.0)
tBodyGyroJerkMag_std      numeric (-1.0 < x < 1.0)
fBodyAcc_mean_X           numeric (-1.0 < x < 1.0)
fBodyAcc_mean_Y           numeric (-1.0 < x < 1.0)
fBodyAcc_mean_Z           numeric (-1.0 < x < 1.0)
fBodyAcc_std_X            numeric (-1.0 < x < 1.0)
fBodyAcc_std_Y            numeric (-1.0 < x < 1.0)
fBodyAcc_std_Z            numeric (-1.0 < x < 1.0)
fBodyAccJerk_mean_X       numeric (-1.0 < x < 1.0)
fBodyAccJerk_mean_Y       numeric (-1.0 < x < 1.0)
fBodyAccJerk_mean_Z       numeric (-1.0 < x < 1.0)
fBodyAccJerk_std_X        numeric (-1.0 < x < 1.0)
fBodyAccJerk_std_Y        numeric (-1.0 < x < 1.0)
fBodyAccJerk_std_Z        numeric (-1.0 < x < 1.0)
fBodyGyro_mean_X          numeric (-1.0 < x < 1.0)
fBodyGyro_mean_Y          numeric (-1.0 < x < 1.0)
fBodyGyro_mean_Z          numeric (-1.0 < x < 1.0)
fBodyGyro_std_X           numeric (-1.0 < x < 1.0)
fBodyGyro_std_Y           numeric (-1.0 < x < 1.0)
fBodyGyro_std_Z           numeric (-1.0 < x < 1.0)
fBodyAccMag_mean          numeric (-1.0 < x < 1.0)
fBodyAccMag_std           numeric (-1.0 < x < 1.0)
fBodyBodyAccJerkMag_mean  numeric (-1.0 < x < 1.0)
fBodyBodyAccJerkMag_std   numeric (-1.0 < x < 1.0)
fBodyBodyGyroMag_mean     numeric (-1.0 < x < 1.0)
fBodyBodyGyroMag_std      numeric (-1.0 < x < 1.0)
fBodyBodyGyroJerkMag_mean numeric (-1.0 < x < 1.0)
fBodyBodyGyroJerkMag_std  numeric (-1.0 < x < 1.0)
</pre>  