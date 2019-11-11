run_analyis.R is a r program that 
1) renames column variables to eliminate -s and ()s in column names
2) gathers columns that contain std dev and mean measurements
3) finds the mean of each measurement for each subject and places that information into a tidy data file named TidyMeans.csv.

run_analysis2.R
Susan
2019-11-10
library("dplyr")
## 
## Attaching package: 'dplyr'
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
library("reshape2")

features<-read.table("features.txt", header=FALSE)
activity_label <- read.table("activity_labels.txt", header=FALSE)

train <- read.table("X_train.txt", header=FALSE) 
train_label <- read.table("y_train.txt", header=FALSE) 
train_subject <- read.table("subject_train.txt")

test <- read.table("X_test.txt", header=FALSE) 
test_label <- read.table("y_test.txt", header=FALSE) 
test_subject <- read.table("subject_test.txt", header=FALSE) 

subject <- "Subject"
activity <- "Activity"

col_names <- gsub("-", "_", features$V2)
col_names <- gsub("[^a-zA-Z\\d_]", "", col_names)
names(train) <- make.names(names = col_names, unique = TRUE, allow_ = TRUE)
names(test)<- make.names(names = col_names, unique = TRUE, allow_ = TRUE)

names(test_label) <- activity  
names(test_subject) <- subject

names(train_label) <- activity  
names(train_subject) <- subject

merge<- rbind(cbind(train, train_label, train_subject), cbind(test, test_label, test_subject))

nrow(merge)
## [1] 10299
ncol(merge)
## [1] 563

mergeMeanStd<-select(merge, matches("mean|std"), one_of(subject, activity)) 
ncol(mergeMeanStd)
## [1] 88
names(mergeMeanStd)
names(mergeMeanStd)
##  [1] "tBodyAcc_mean_X"                  
##  [2] "tBodyAcc_mean_Y"                  
##  [3] "tBodyAcc_mean_Z"                  
##  [4] "tBodyAcc_std_X"                   
##  [5] "tBodyAcc_std_Y"                   
##  [6] "tBodyAcc_std_Z"                   
##  [7] "tGravityAcc_mean_X"               
##  [8] "tGravityAcc_mean_Y"               
##  [9] "tGravityAcc_mean_Z"               
## [10] "tGravityAcc_std_X"                
## [11] "tGravityAcc_std_Y"                
## [12] "tGravityAcc_std_Z"                
## [13] "tBodyAccJerk_mean_X"              
## [14] "tBodyAccJerk_mean_Y"              
## [15] "tBodyAccJerk_mean_Z"              
## [16] "tBodyAccJerk_std_X"               
## [17] "tBodyAccJerk_std_Y"               
## [18] "tBodyAccJerk_std_Z"               
## [19] "tBodyGyro_mean_X"                 
## [20] "tBodyGyro_mean_Y"                 
## [21] "tBodyGyro_mean_Z"                 
## [22] "tBodyGyro_std_X"                  
## [23] "tBodyGyro_std_Y"                  
## [24] "tBodyGyro_std_Z"                  
## [25] "tBodyGyroJerk_mean_X"             
## [26] "tBodyGyroJerk_mean_Y"             
## [27] "tBodyGyroJerk_mean_Z"             
## [28] "tBodyGyroJerk_std_X"              
## [29] "tBodyGyroJerk_std_Y"              
## [30] "tBodyGyroJerk_std_Z"              
## [31] "tBodyAccMag_mean"                 
## [32] "tBodyAccMag_std"                  
## [33] "tGravityAccMag_mean"              
## [34] "tGravityAccMag_std"               
## [35] "tBodyAccJerkMag_mean"             
## [36] "tBodyAccJerkMag_std"              
## [37] "tBodyGyroMag_mean"                
## [38] "tBodyGyroMag_std"                 
## [39] "tBodyGyroJerkMag_mean"            
## [40] "tBodyGyroJerkMag_std"             
## [41] "fBodyAcc_mean_X"                  
## [42] "fBodyAcc_mean_Y"                  
## [43] "fBodyAcc_mean_Z"                  
## [44] "fBodyAcc_std_X"                   
## [45] "fBodyAcc_std_Y"                   
## [46] "fBodyAcc_std_Z"                   
## [47] "fBodyAcc_meanFreq_X"              
## [48] "fBodyAcc_meanFreq_Y"              
## [49] "fBodyAcc_meanFreq_Z"              
## [50] "fBodyAccJerk_mean_X"              
## [51] "fBodyAccJerk_mean_Y"              
## [52] "fBodyAccJerk_mean_Z"              
## [53] "fBodyAccJerk_std_X"               
## [54] "fBodyAccJerk_std_Y"               
## [55] "fBodyAccJerk_std_Z"               
## [56] "fBodyAccJerk_meanFreq_X"          
## [57] "fBodyAccJerk_meanFreq_Y"          
## [58] "fBodyAccJerk_meanFreq_Z"          
## [59] "fBodyGyro_mean_X"                 
## [60] "fBodyGyro_mean_Y"                 
## [61] "fBodyGyro_mean_Z"                 
## [62] "fBodyGyro_std_X"                  
## [63] "fBodyGyro_std_Y"                  
## [64] "fBodyGyro_std_Z"                  
## [65] "fBodyGyro_meanFreq_X"             
## [66] "fBodyGyro_meanFreq_Y"             
## [67] "fBodyGyro_meanFreq_Z"             
## [68] "fBodyAccMag_mean"                 
## [69] "fBodyAccMag_std"                  
## [70] "fBodyAccMag_meanFreq"             
## [71] "fBodyBodyAccJerkMag_mean"         
## [72] "fBodyBodyAccJerkMag_std"          
## [73] "fBodyBodyAccJerkMag_meanFreq"     
## [74] "fBodyBodyGyroMag_mean"            
## [75] "fBodyBodyGyroMag_std"             
## [76] "fBodyBodyGyroMag_meanFreq"        
## [77] "fBodyBodyGyroJerkMag_mean"        
## [78] "fBodyBodyGyroJerkMag_std"         
## [79] "fBodyBodyGyroJerkMag_meanFreq"    
## [80] "angletBodyAccMeangravity"         
## [81] "angletBodyAccJerkMeangravityMean" 
## [82] "angletBodyGyroMeangravityMean"    
## [83] "angletBodyGyroJerkMeangravityMean"
## [84] "angleXgravityMean"                
## [85] "angleYgravityMean"                
## [86] "angleZgravityMean"                
## [87] "Subject"                          
## [88] "Activity"
ids<-c(subject, activity)
tidy_means <- melt(merge,id = ids, colnames(train)) 
tidy_means<-dcast(tidy_means, Subject + Activity ~ variable, fun.aggregate = mean, na.rm = TRUE)

write.table(tidy_means, file = "TidyMeans.csv", sep = ",", row.names = FALSE)                
                
                       
The dataset is as follows:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following features:
=========================================

Feature Selection 
=================

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
