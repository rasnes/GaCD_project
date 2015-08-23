---
title: "CodeBook"
output: html_document
---

## Description

In this modified data set, only the mean and standard deviation (std) values of the features listed are given as variables. Variable names have been modified slightly from original dataset for readiability and to be compatible with plyr/dplyr.

Original dataset availible here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

IMPORTANT: in this data set the values of the variables are calculated avarages of each variable for each Activity (variable 1) and each Subject (variable 2). I.e. they do not correspond to the values in the original data set.

FEATURE UNITS:
- Features are normalized and bounded within [-1,1].
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.

From features_info.txt, provided with the original data set:

***

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

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

[...]

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

***

## Variable list

[Column #] "Column name"

 [1] "Activity"
 The activity performed by the Subject.
 6 values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 
 [2] "Subject"
 Subject ID.
 Value range: 1-30

Features (see description above):
 
 [3] "tBodyAccmeanX"                   
 [4] "tBodyAccmeanY"                   
 [5] "tBodyAccmeanZ"                   
 [6] "tGravityAccmeanX"                
 [7] "tGravityAccmeanY"                
 [8] "tGravityAccmeanZ"                
 [9] "tBodyAccJerkmeanX"               
[10] "tBodyAccJerkmeanY"               
[11] "tBodyAccJerkmeanZ"               
[12] "tBodyGyromeanX"                  
[13] "tBodyGyromeanY"                  
[14] "tBodyGyromeanZ"                  
[15] "tBodyGyroJerkmeanX"              
[16] "tBodyGyroJerkmeanY"              
[17] "tBodyGyroJerkmeanZ"              
[18] "tBodyAccMagmean"                 
[19] "tGravityAccMagmean"              
[20] "tBodyAccJerkMagmean"             
[21] "tBodyGyroMagmean"                
[22] "tBodyGyroJerkMagmean"            
[23] "fBodyAccmeanX"                   
[24] "fBodyAccmeanY"                   
[25] "fBodyAccmeanZ"                   
[26] "fBodyAccJerkmeanX"               
[27] "fBodyAccJerkmeanY"               
[28] "fBodyAccJerkmeanZ"               
[29] "fBodyGyromeanX"                  
[30] "fBodyGyromeanY"                  
[31] "fBodyGyromeanZ"                  
[32] "fBodyAccMagmean"                 
[33] "fBodyBodyAccJerkMagmean"         
[34] "fBodyBodyGyroMagmean"            
[35] "fBodyBodyGyroJerkMagmean"        
[36] "angletBodyAccJerkMeangravityMean"
[37] "tBodyAccstdX"                    
[38] "tBodyAccstdY"                    
[39] "tBodyAccstdZ"                    
[40] "tGravityAccstdX"                 
[41] "tGravityAccstdY"                 
[42] "tGravityAccstdZ"                 
[43] "tBodyAccJerkstdX"                
[44] "tBodyAccJerkstdY"                
[45] "tBodyAccJerkstdZ"                
[46] "tBodyGyrostdX"                   
[47] "tBodyGyrostdY"                   
[48] "tBodyGyrostdZ"                   
[49] "tBodyGyroJerkstdX"               
[50] "tBodyGyroJerkstdY"               
[51] "tBodyGyroJerkstdZ"               
[52] "tBodyAccMagstd"                  
[53] "tGravityAccMagstd"               
[54] "tBodyAccJerkMagstd"              
[55] "tBodyGyroMagstd"                 
[56] "tBodyGyroJerkMagstd"             
[57] "fBodyAccstdX"                    
[58] "fBodyAccstdY"                    
[59] "fBodyAccstdZ"                    
[60] "fBodyAccJerkstdX"                
[61] "fBodyAccJerkstdY"                
[62] "fBodyAccJerkstdZ"                
[63] "fBodyGyrostdX"                   
[64] "fBodyGyrostdY"                   
[65] "fBodyGyrostdZ"                   
[66] "fBodyAccMagstd"                  
[67] "fBodyBodyAccJerkMagstd"          
[68] "fBodyBodyGyroMagstd"             
[69] "fBodyBodyGyroJerkMagstd" 

For more information about this dataset please README and features_info.txt in original data set, or contact: activityrecognition '@' smartlab.ws.
