run_analyis.R is a r program that 
1) renames column variables to eliminate -s and ()s in column names
2) gathers columns that contain std dev and mean measurements
3) finds the mean of each measurement for each subject and places that information into a tidy data file named TidyMeans.csv.

Number of columns in merged dataset
 ncol(merge)
[1] 563

Number of columns mean/std column gather
length(mergeMeanStd)
[1] 88
> nrow(mergeMeanStd)
[1] 10299
> ncol(mergeMeanStd)
[1] 88


Results of mean/std column gather
>summary(mergeMeanStd)
tBodyAcc_mean_X   tBodyAcc_mean_Y    tBodyAcc_mean_Z    tBodyAcc_std_X   
 Min.   :-1.0000   Min.   :-1.00000   Min.   :-1.00000   Min.   :-1.0000  
 1st Qu.: 0.2626   1st Qu.:-0.02490   1st Qu.:-0.12102   1st Qu.:-0.9924  
 Median : 0.2772   Median :-0.01716   Median :-0.10860   Median :-0.9430  
 Mean   : 0.2743   Mean   :-0.01774   Mean   :-0.10892   Mean   :-0.6078  
 3rd Qu.: 0.2884   3rd Qu.:-0.01062   3rd Qu.:-0.09759   3rd Qu.:-0.2503  
 Max.   : 1.0000   Max.   : 1.00000   Max.   : 1.00000   Max.   : 1.0000  
 tBodyAcc_std_Y     tBodyAcc_std_Z    tGravityAcc_mean_X tGravityAcc_mean_Y 
 Min.   :-1.00000   Min.   :-1.0000   Min.   :-1.0000    Min.   :-1.000000  
 1st Qu.:-0.97699   1st Qu.:-0.9791   1st Qu.: 0.8117    1st Qu.:-0.242943  
 Median :-0.83503   Median :-0.8508   Median : 0.9218    Median :-0.143551  
 Mean   :-0.51019   Mean   :-0.6131   Mean   : 0.6692    Mean   : 0.004039  
 3rd Qu.:-0.05734   3rd Qu.:-0.2787   3rd Qu.: 0.9547    3rd Qu.: 0.118905  
 Max.   : 1.00000   Max.   : 1.0000   Max.   : 1.0000    Max.   : 1.000000  
 tGravityAcc_mean_Z tGravityAcc_std_X tGravityAcc_std_Y tGravityAcc_std_Z
 Min.   :-1.00000   Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000  
 1st Qu.:-0.11671   1st Qu.:-0.9949   1st Qu.:-0.9913   1st Qu.:-0.9866  
 Median : 0.03680   Median :-0.9819   Median :-0.9759   Median :-0.9665  
 Mean   : 0.09215   Mean   :-0.9652   Mean   :-0.9544   Mean   :-0.9389  
 3rd Qu.: 0.21621   3rd Qu.:-0.9615   3rd Qu.:-0.9464   3rd Qu.:-0.9296  
 Max.   : 1.00000   Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000  
 tBodyAccJerk_mean_X tBodyAccJerk_mean_Y tBodyAccJerk_mean_Z tBodyAccJerk_std_X
 Min.   :-1.00000    Min.   :-1.000000   Min.   :-1.000000   Min.   :-1.0000   
 1st Qu.: 0.06298    1st Qu.:-0.018555   1st Qu.:-0.031552   1st Qu.:-0.9913   
 Median : 0.07597    Median : 0.010753   Median :-0.001159   Median :-0.9513   
 Mean   : 0.07894    Mean   : 0.007948   Mean   :-0.004675   Mean   :-0.6398   
 3rd Qu.: 0.09131    3rd Qu.: 0.033538   3rd Qu.: 0.024578   3rd Qu.:-0.2912   
 Max.   : 1.00000    Max.   : 1.000000   Max.   : 1.000000   Max.   : 1.0000   
 tBodyAccJerk_std_Y tBodyAccJerk_std_Z tBodyGyro_mean_X   tBodyGyro_mean_Y  
 Min.   :-1.0000    Min.   :-1.0000    Min.   :-1.00000   Min.   :-1.00000  
 1st Qu.:-0.9850    1st Qu.:-0.9892    1st Qu.:-0.04579   1st Qu.:-0.10399  
 Median :-0.9250    Median :-0.9543    Median :-0.02776   Median :-0.07477  
 Mean   :-0.6080    Mean   :-0.7628    Mean   :-0.03098   Mean   :-0.07472  
 3rd Qu.:-0.2218    3rd Qu.:-0.5485    3rd Qu.:-0.01058   3rd Qu.:-0.05110  
 Max.   : 1.0000    Max.   : 1.0000    Max.   : 1.00000   Max.   : 1.00000  
 tBodyGyro_mean_Z   tBodyGyro_std_X   tBodyGyro_std_Y   tBodyGyro_std_Z  
 Min.   :-1.00000   Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000  
 1st Qu.: 0.06485   1st Qu.:-0.9872   1st Qu.:-0.9819   1st Qu.:-0.9850  
 Median : 0.08626   Median :-0.9016   Median :-0.9106   Median :-0.8819  
 Mean   : 0.08836   Mean   :-0.7212   Mean   :-0.6827   Mean   :-0.6537  
 3rd Qu.: 0.11044   3rd Qu.:-0.4822   3rd Qu.:-0.4461   3rd Qu.:-0.3379  
 Max.   : 1.00000   Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000  
 tBodyGyroJerk_mean_X tBodyGyroJerk_mean_Y tBodyGyroJerk_mean_Z
 Min.   :-1.00000     Min.   :-1.00000     Min.   :-1.00000    
 1st Qu.:-0.11723     1st Qu.:-0.05868     1st Qu.:-0.07936    
 Median :-0.09824     Median :-0.04056     Median :-0.05455    
 Mean   :-0.09671     Mean   :-0.04232     Mean   :-0.05483    
 3rd Qu.:-0.07930     3rd Qu.:-0.02521     3rd Qu.:-0.03168    
 Max.   : 1.00000     Max.   : 1.00000     Max.   : 1.00000    
 tBodyGyroJerk_std_X tBodyGyroJerk_std_Y tBodyGyroJerk_std_Z tBodyAccMag_mean 
 Min.   :-1.0000     Min.   :-1.0000     Min.   :-1.0000     Min.   :-1.0000  
 1st Qu.:-0.9907     1st Qu.:-0.9922     1st Qu.:-0.9926     1st Qu.:-0.9819  
 Median :-0.9348     Median :-0.9548     Median :-0.9503     Median :-0.8746  
 Mean   :-0.7313     Mean   :-0.7861     Mean   :-0.7399     Mean   :-0.5482  
 3rd Qu.:-0.4865     3rd Qu.:-0.6268     3rd Qu.:-0.5097     3rd Qu.:-0.1201  
 Max.   : 1.0000     Max.   : 1.0000     Max.   : 1.0000     Max.   : 1.0000  
 tBodyAccMag_std   tGravityAccMag_mean tGravityAccMag_std tBodyAccJerkMag_mean
 Min.   :-1.0000   Min.   :-1.0000     Min.   :-1.0000    Min.   :-1.0000     
 1st Qu.:-0.9822   1st Qu.:-0.9819     1st Qu.:-0.9822    1st Qu.:-0.9896     
 Median :-0.8437   Median :-0.8746     Median :-0.8437    Median :-0.9481     
 Mean   :-0.5912   Mean   :-0.5482     Mean   :-0.5912    Mean   :-0.6494     
 3rd Qu.:-0.2423   3rd Qu.:-0.1201     3rd Qu.:-0.2423    3rd Qu.:-0.2956     
 Max.   : 1.0000   Max.   : 1.0000     Max.   : 1.0000    Max.   : 1.0000     
 tBodyAccJerkMag_std tBodyGyroMag_mean tBodyGyroMag_std  tBodyGyroJerkMag_mean
 Min.   :-1.0000     Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000      
 1st Qu.:-0.9907     1st Qu.:-0.9781   1st Qu.:-0.9775   1st Qu.:-0.9923      
 Median :-0.9288     Median :-0.8223   Median :-0.8259   Median :-0.9559      
 Mean   :-0.6278     Mean   :-0.6052   Mean   :-0.6625   Mean   :-0.7621      
 3rd Qu.:-0.2733     3rd Qu.:-0.2454   3rd Qu.:-0.3940   3rd Qu.:-0.5499      
 Max.   : 1.0000     Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000      
 tBodyGyroJerkMag_std fBodyAcc_mean_X   fBodyAcc_mean_Y   fBodyAcc_mean_Z  
 Min.   :-1.0000      Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000  
 1st Qu.:-0.9922      1st Qu.:-0.9913   1st Qu.:-0.9792   1st Qu.:-0.9832  
 Median :-0.9403      Median :-0.9456   Median :-0.8643   Median :-0.8954  
 Mean   :-0.7780      Mean   :-0.6228   Mean   :-0.5375   Mean   :-0.6650  
 3rd Qu.:-0.6093      3rd Qu.:-0.2646   3rd Qu.:-0.1032   3rd Qu.:-0.3662  
 Max.   : 1.0000      Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000  
 fBodyAcc_std_X    fBodyAcc_std_Y     fBodyAcc_std_Z    fBodyAcc_meanFreq_X
 Min.   :-1.0000   Min.   :-1.00000   Min.   :-1.0000   Min.   :-1.00000   
 1st Qu.:-0.9929   1st Qu.:-0.97689   1st Qu.:-0.9780   1st Qu.:-0.41878   
 Median :-0.9416   Median :-0.83261   Median :-0.8398   Median :-0.23825   
 Mean   :-0.6034   Mean   :-0.52842   Mean   :-0.6179   Mean   :-0.22147   
 3rd Qu.:-0.2493   3rd Qu.:-0.09216   3rd Qu.:-0.3023   3rd Qu.:-0.02043   
 Max.   : 1.0000   Max.   : 1.00000   Max.   : 1.0000   Max.   : 1.00000   
 fBodyAcc_meanFreq_Y fBodyAcc_meanFreq_Z fBodyAccJerk_mean_X
 Min.   :-1.000000   Min.   :-1.00000    Min.   :-1.0000    
 1st Qu.:-0.144772   1st Qu.:-0.13845    1st Qu.:-0.9912    
 Median : 0.004666   Median : 0.06084    Median :-0.9516    
 Mean   : 0.015401   Mean   : 0.04731    Mean   :-0.6567    
 3rd Qu.: 0.176603   3rd Qu.: 0.24922    3rd Qu.:-0.3270    
 Max.   : 1.000000   Max.   : 1.00000    Max.   : 1.0000    
 fBodyAccJerk_mean_Y fBodyAccJerk_mean_Z fBodyAccJerk_std_X fBodyAccJerk_std_Y
 Min.   :-1.0000     Min.   :-1.0000     Min.   :-1.0000    Min.   :-1.0000   
 1st Qu.:-0.9848     1st Qu.:-0.9873     1st Qu.:-0.9920    1st Qu.:-0.9865   
 Median :-0.9257     Median :-0.9475     Median :-0.9562    Median :-0.9280   
 Mean   :-0.6290     Mean   :-0.7436     Mean   :-0.6550    Mean   :-0.6122   
 3rd Qu.:-0.2638     3rd Qu.:-0.5133     3rd Qu.:-0.3203    3rd Qu.:-0.2361   
 Max.   : 1.0000     Max.   : 1.0000     Max.   : 1.0000    Max.   : 1.0000   
 fBodyAccJerk_std_Z fBodyAccJerk_meanFreq_X fBodyAccJerk_meanFreq_Y
 Min.   :-1.0000    Min.   :-1.00000        Min.   :-1.000000      
 1st Qu.:-0.9895    1st Qu.:-0.29770        1st Qu.:-0.427951      
 Median :-0.9590    Median :-0.04544        Median :-0.236530      
 Mean   :-0.7809    Mean   :-0.04771        Mean   :-0.213393      
 3rd Qu.:-0.5903    3rd Qu.: 0.20447        3rd Qu.: 0.008651      
 Max.   : 1.0000    Max.   : 1.00000        Max.   : 1.000000      
 fBodyAccJerk_meanFreq_Z fBodyGyro_mean_X  fBodyGyro_mean_Y  fBodyGyro_mean_Z 
 Min.   :-1.00000        Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000  
 1st Qu.:-0.33139        1st Qu.:-0.9853   1st Qu.:-0.9847   1st Qu.:-0.9851  
 Median :-0.10246        Median :-0.8917   Median :-0.9197   Median :-0.8877  
 Mean   :-0.12383        Mean   :-0.6721   Mean   :-0.7062   Mean   :-0.6442  
 3rd Qu.: 0.09124        3rd Qu.:-0.3837   3rd Qu.:-0.4735   3rd Qu.:-0.3225  
 Max.   : 1.00000        Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000  
 fBodyGyro_std_X   fBodyGyro_std_Y   fBodyGyro_std_Z   fBodyGyro_meanFreq_X
 Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.00000    
 1st Qu.:-0.9881   1st Qu.:-0.9808   1st Qu.:-0.9862   1st Qu.:-0.27189    
 Median :-0.9053   Median :-0.9061   Median :-0.8915   Median :-0.09868    
 Mean   :-0.7386   Mean   :-0.6742   Mean   :-0.6904   Mean   :-0.10104    
 3rd Qu.:-0.5225   3rd Qu.:-0.4385   3rd Qu.:-0.4168   3rd Qu.: 0.06810    
 Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.00000    
 fBodyGyro_meanFreq_Y fBodyGyro_meanFreq_Z fBodyAccMag_mean  fBodyAccMag_std  
 Min.   :-1.00000     Min.   :-1.00000     Min.   :-1.0000   Min.   :-1.0000  
 1st Qu.:-0.36257     1st Qu.:-0.23240     1st Qu.:-0.9847   1st Qu.:-0.9829  
 Median :-0.17298     Median :-0.05369     Median :-0.8755   Median :-0.8547  
 Mean   :-0.17428     Mean   :-0.05139     Mean   :-0.5860   Mean   :-0.6595  
 3rd Qu.: 0.01366     3rd Qu.: 0.12251     3rd Qu.:-0.2173   3rd Qu.:-0.3823  
 Max.   : 1.00000     Max.   : 1.00000     Max.   : 1.0000   Max.   : 1.0000  
 fBodyAccMag_meanFreq fBodyBodyAccJerkMag_mean fBodyBodyAccJerkMag_std
 Min.   :-1.00000     Min.   :-1.0000          Min.   :-1.0000        
 1st Qu.:-0.09663     1st Qu.:-0.9898          1st Qu.:-0.9907        
 Median : 0.07026     Median :-0.9290          Median :-0.9255        
 Mean   : 0.07688     Mean   :-0.6208          Mean   :-0.6401        
 3rd Qu.: 0.24495     3rd Qu.:-0.2600          3rd Qu.:-0.3082        
 Max.   : 1.00000     Max.   : 1.0000          Max.   : 1.0000        
 fBodyBodyAccJerkMag_meanFreq fBodyBodyGyroMag_mean fBodyBodyGyroMag_std
 Min.   :-1.000000            Min.   :-1.0000       Min.   :-1.0000     
 1st Qu.:-0.002959            1st Qu.:-0.9825       1st Qu.:-0.9781     
 Median : 0.164180            Median :-0.8756       Median :-0.8275     
 Mean   : 0.173220            Mean   :-0.6974       Mean   :-0.7000     
 3rd Qu.: 0.357307            3rd Qu.:-0.4514       3rd Qu.:-0.4713     
 Max.   : 1.000000            Max.   : 1.0000       Max.   : 1.0000     
 fBodyBodyGyroMag_meanFreq fBodyBodyGyroJerkMag_mean fBodyBodyGyroJerkMag_std
 Min.   :-1.00000          Min.   :-1.0000           Min.   :-1.0000         
 1st Qu.:-0.23436          1st Qu.:-0.9921           1st Qu.:-0.9926         
 Median :-0.05210          Median :-0.9453           Median :-0.9382         
 Mean   :-0.04156          Mean   :-0.7798           Mean   :-0.7922         
 3rd Qu.: 0.15158          3rd Qu.:-0.6122           3rd Qu.:-0.6437         
 Max.   : 1.00000          Max.   : 1.0000           Max.   : 1.0000         
 fBodyBodyGyroJerkMag_meanFreq angletBodyAccMeangravity
 Min.   :-1.00000              Min.   :-1.000000       
 1st Qu.:-0.01948              1st Qu.:-0.124694       
 Median : 0.13625              Median : 0.008146       
 Mean   : 0.12671              Mean   : 0.007705       
 3rd Qu.: 0.28896              3rd Qu.: 0.149005       
 Max.   : 1.00000              Max.   : 1.000000       
 angletBodyAccJerkMeangravityMean angletBodyGyroMeangravityMean
 Min.   :-1.000000                Min.   :-1.00000             
 1st Qu.:-0.287031                1st Qu.:-0.49311             
 Median : 0.007668                Median : 0.01719             
 Mean   : 0.002648                Mean   : 0.01768             
 3rd Qu.: 0.291490                3rd Qu.: 0.53614             
 Max.   : 1.000000                Max.   : 1.00000             
 angletBodyGyroJerkMeangravityMean angleXgravityMean angleYgravityMean  
 Min.   :-1.000000                 Min.   :-1.0000   Min.   :-1.000000  
 1st Qu.:-0.389041                 1st Qu.:-0.8173   1st Qu.: 0.002151  
 Median :-0.007186                 Median :-0.7156   Median : 0.182029  
 Mean   :-0.009219                 Mean   :-0.4965   Mean   : 0.063255  
 3rd Qu.: 0.365996                 3rd Qu.:-0.5215   3rd Qu.: 0.250790  
 Max.   : 1.000000                 Max.   : 1.0000   Max.   : 1.000000  
 angleZgravityMean      Subject         Activity    
 Min.   :-1.000000   Min.   : 1.00   Min.   :1.000  
 1st Qu.:-0.131880   1st Qu.: 9.00   1st Qu.:2.000  
 Median :-0.003882   Median :17.00   Median :4.000  
 Mean   :-0.054284   Mean   :16.15   Mean   :3.625  
 3rd Qu.: 0.102970   3rd Qu.:24.00   3rd Qu.:5.000  
 Max.   : 1.000000   Max.   :30.00   Max.   :6.000  
> 




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
