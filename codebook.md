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
names(merge)
##   [1] "tBodyAcc_mean_X"                  
##   [2] "tBodyAcc_mean_Y"                  
##   [3] "tBodyAcc_mean_Z"                  
##   [4] "tBodyAcc_std_X"                   
##   [5] "tBodyAcc_std_Y"                   
##   [6] "tBodyAcc_std_Z"                   
##   [7] "tBodyAcc_mad_X"                   
##   [8] "tBodyAcc_mad_Y"                   
##   [9] "tBodyAcc_mad_Z"                   
##  [10] "tBodyAcc_max_X"                   
##  [11] "tBodyAcc_max_Y"                   
##  [12] "tBodyAcc_max_Z"                   
##  [13] "tBodyAcc_min_X"                   
##  [14] "tBodyAcc_min_Y"                   
##  [15] "tBodyAcc_min_Z"                   
##  [16] "tBodyAcc_sma"                     
##  [17] "tBodyAcc_energy_X"                
##  [18] "tBodyAcc_energy_Y"                
##  [19] "tBodyAcc_energy_Z"                
##  [20] "tBodyAcc_iqr_X"                   
##  [21] "tBodyAcc_iqr_Y"                   
##  [22] "tBodyAcc_iqr_Z"                   
##  [23] "tBodyAcc_entropy_X"               
##  [24] "tBodyAcc_entropy_Y"               
##  [25] "tBodyAcc_entropy_Z"               
##  [26] "tBodyAcc_arCoeff_X"               
##  [27] "tBodyAcc_arCoeff_X.1"             
##  [28] "tBodyAcc_arCoeff_X.2"             
##  [29] "tBodyAcc_arCoeff_X.3"             
##  [30] "tBodyAcc_arCoeff_Y"               
##  [31] "tBodyAcc_arCoeff_Y.1"             
##  [32] "tBodyAcc_arCoeff_Y.2"             
##  [33] "tBodyAcc_arCoeff_Y.3"             
##  [34] "tBodyAcc_arCoeff_Z"               
##  [35] "tBodyAcc_arCoeff_Z.1"             
##  [36] "tBodyAcc_arCoeff_Z.2"             
##  [37] "tBodyAcc_arCoeff_Z.3"             
##  [38] "tBodyAcc_correlation_XY"          
##  [39] "tBodyAcc_correlation_XZ"          
##  [40] "tBodyAcc_correlation_YZ"          
##  [41] "tGravityAcc_mean_X"               
##  [42] "tGravityAcc_mean_Y"               
##  [43] "tGravityAcc_mean_Z"               
##  [44] "tGravityAcc_std_X"                
##  [45] "tGravityAcc_std_Y"                
##  [46] "tGravityAcc_std_Z"                
##  [47] "tGravityAcc_mad_X"                
##  [48] "tGravityAcc_mad_Y"                
##  [49] "tGravityAcc_mad_Z"                
##  [50] "tGravityAcc_max_X"                
##  [51] "tGravityAcc_max_Y"                
##  [52] "tGravityAcc_max_Z"                
##  [53] "tGravityAcc_min_X"                
##  [54] "tGravityAcc_min_Y"                
##  [55] "tGravityAcc_min_Z"                
##  [56] "tGravityAcc_sma"                  
##  [57] "tGravityAcc_energy_X"             
##  [58] "tGravityAcc_energy_Y"             
##  [59] "tGravityAcc_energy_Z"             
##  [60] "tGravityAcc_iqr_X"                
##  [61] "tGravityAcc_iqr_Y"                
##  [62] "tGravityAcc_iqr_Z"                
##  [63] "tGravityAcc_entropy_X"            
##  [64] "tGravityAcc_entropy_Y"            
##  [65] "tGravityAcc_entropy_Z"            
##  [66] "tGravityAcc_arCoeff_X"            
##  [67] "tGravityAcc_arCoeff_X.1"          
##  [68] "tGravityAcc_arCoeff_X.2"          
##  [69] "tGravityAcc_arCoeff_X.3"          
##  [70] "tGravityAcc_arCoeff_Y"            
##  [71] "tGravityAcc_arCoeff_Y.1"          
##  [72] "tGravityAcc_arCoeff_Y.2"          
##  [73] "tGravityAcc_arCoeff_Y.3"          
##  [74] "tGravityAcc_arCoeff_Z"            
##  [75] "tGravityAcc_arCoeff_Z.1"          
##  [76] "tGravityAcc_arCoeff_Z.2"          
##  [77] "tGravityAcc_arCoeff_Z.3"          
##  [78] "tGravityAcc_correlation_XY"       
##  [79] "tGravityAcc_correlation_XZ"       
##  [80] "tGravityAcc_correlation_YZ"       
##  [81] "tBodyAccJerk_mean_X"              
##  [82] "tBodyAccJerk_mean_Y"              
##  [83] "tBodyAccJerk_mean_Z"              
##  [84] "tBodyAccJerk_std_X"               
##  [85] "tBodyAccJerk_std_Y"               
##  [86] "tBodyAccJerk_std_Z"               
##  [87] "tBodyAccJerk_mad_X"               
##  [88] "tBodyAccJerk_mad_Y"               
##  [89] "tBodyAccJerk_mad_Z"               
##  [90] "tBodyAccJerk_max_X"               
##  [91] "tBodyAccJerk_max_Y"               
##  [92] "tBodyAccJerk_max_Z"               
##  [93] "tBodyAccJerk_min_X"               
##  [94] "tBodyAccJerk_min_Y"               
##  [95] "tBodyAccJerk_min_Z"               
##  [96] "tBodyAccJerk_sma"                 
##  [97] "tBodyAccJerk_energy_X"            
##  [98] "tBodyAccJerk_energy_Y"            
##  [99] "tBodyAccJerk_energy_Z"            
## [100] "tBodyAccJerk_iqr_X"               
## [101] "tBodyAccJerk_iqr_Y"               
## [102] "tBodyAccJerk_iqr_Z"               
## [103] "tBodyAccJerk_entropy_X"           
## [104] "tBodyAccJerk_entropy_Y"           
## [105] "tBodyAccJerk_entropy_Z"           
## [106] "tBodyAccJerk_arCoeff_X"           
## [107] "tBodyAccJerk_arCoeff_X.1"         
## [108] "tBodyAccJerk_arCoeff_X.2"         
## [109] "tBodyAccJerk_arCoeff_X.3"         
## [110] "tBodyAccJerk_arCoeff_Y"           
## [111] "tBodyAccJerk_arCoeff_Y.1"         
## [112] "tBodyAccJerk_arCoeff_Y.2"         
## [113] "tBodyAccJerk_arCoeff_Y.3"         
## [114] "tBodyAccJerk_arCoeff_Z"           
## [115] "tBodyAccJerk_arCoeff_Z.1"         
## [116] "tBodyAccJerk_arCoeff_Z.2"         
## [117] "tBodyAccJerk_arCoeff_Z.3"         
## [118] "tBodyAccJerk_correlation_XY"      
## [119] "tBodyAccJerk_correlation_XZ"      
## [120] "tBodyAccJerk_correlation_YZ"      
## [121] "tBodyGyro_mean_X"                 
## [122] "tBodyGyro_mean_Y"                 
## [123] "tBodyGyro_mean_Z"                 
## [124] "tBodyGyro_std_X"                  
## [125] "tBodyGyro_std_Y"                  
## [126] "tBodyGyro_std_Z"                  
## [127] "tBodyGyro_mad_X"                  
## [128] "tBodyGyro_mad_Y"                  
## [129] "tBodyGyro_mad_Z"                  
## [130] "tBodyGyro_max_X"                  
## [131] "tBodyGyro_max_Y"                  
## [132] "tBodyGyro_max_Z"                  
## [133] "tBodyGyro_min_X"                  
## [134] "tBodyGyro_min_Y"                  
## [135] "tBodyGyro_min_Z"                  
## [136] "tBodyGyro_sma"                    
## [137] "tBodyGyro_energy_X"               
## [138] "tBodyGyro_energy_Y"               
## [139] "tBodyGyro_energy_Z"               
## [140] "tBodyGyro_iqr_X"                  
## [141] "tBodyGyro_iqr_Y"                  
## [142] "tBodyGyro_iqr_Z"                  
## [143] "tBodyGyro_entropy_X"              
## [144] "tBodyGyro_entropy_Y"              
## [145] "tBodyGyro_entropy_Z"              
## [146] "tBodyGyro_arCoeff_X"              
## [147] "tBodyGyro_arCoeff_X.1"            
## [148] "tBodyGyro_arCoeff_X.2"            
## [149] "tBodyGyro_arCoeff_X.3"            
## [150] "tBodyGyro_arCoeff_Y"              
## [151] "tBodyGyro_arCoeff_Y.1"            
## [152] "tBodyGyro_arCoeff_Y.2"            
## [153] "tBodyGyro_arCoeff_Y.3"            
## [154] "tBodyGyro_arCoeff_Z"              
## [155] "tBodyGyro_arCoeff_Z.1"            
## [156] "tBodyGyro_arCoeff_Z.2"            
## [157] "tBodyGyro_arCoeff_Z.3"            
## [158] "tBodyGyro_correlation_XY"         
## [159] "tBodyGyro_correlation_XZ"         
## [160] "tBodyGyro_correlation_YZ"         
## [161] "tBodyGyroJerk_mean_X"             
## [162] "tBodyGyroJerk_mean_Y"             
## [163] "tBodyGyroJerk_mean_Z"             
## [164] "tBodyGyroJerk_std_X"              
## [165] "tBodyGyroJerk_std_Y"              
## [166] "tBodyGyroJerk_std_Z"              
## [167] "tBodyGyroJerk_mad_X"              
## [168] "tBodyGyroJerk_mad_Y"              
## [169] "tBodyGyroJerk_mad_Z"              
## [170] "tBodyGyroJerk_max_X"              
## [171] "tBodyGyroJerk_max_Y"              
## [172] "tBodyGyroJerk_max_Z"              
## [173] "tBodyGyroJerk_min_X"              
## [174] "tBodyGyroJerk_min_Y"              
## [175] "tBodyGyroJerk_min_Z"              
## [176] "tBodyGyroJerk_sma"                
## [177] "tBodyGyroJerk_energy_X"           
## [178] "tBodyGyroJerk_energy_Y"           
## [179] "tBodyGyroJerk_energy_Z"           
## [180] "tBodyGyroJerk_iqr_X"              
## [181] "tBodyGyroJerk_iqr_Y"              
## [182] "tBodyGyroJerk_iqr_Z"              
## [183] "tBodyGyroJerk_entropy_X"          
## [184] "tBodyGyroJerk_entropy_Y"          
## [185] "tBodyGyroJerk_entropy_Z"          
## [186] "tBodyGyroJerk_arCoeff_X"          
## [187] "tBodyGyroJerk_arCoeff_X.1"        
## [188] "tBodyGyroJerk_arCoeff_X.2"        
## [189] "tBodyGyroJerk_arCoeff_X.3"        
## [190] "tBodyGyroJerk_arCoeff_Y"          
## [191] "tBodyGyroJerk_arCoeff_Y.1"        
## [192] "tBodyGyroJerk_arCoeff_Y.2"        
## [193] "tBodyGyroJerk_arCoeff_Y.3"        
## [194] "tBodyGyroJerk_arCoeff_Z"          
## [195] "tBodyGyroJerk_arCoeff_Z.1"        
## [196] "tBodyGyroJerk_arCoeff_Z.2"        
## [197] "tBodyGyroJerk_arCoeff_Z.3"        
## [198] "tBodyGyroJerk_correlation_XY"     
## [199] "tBodyGyroJerk_correlation_XZ"     
## [200] "tBodyGyroJerk_correlation_YZ"     
## [201] "tBodyAccMag_mean"                 
## [202] "tBodyAccMag_std"                  
## [203] "tBodyAccMag_mad"                  
## [204] "tBodyAccMag_max"                  
## [205] "tBodyAccMag_min"                  
## [206] "tBodyAccMag_sma"                  
## [207] "tBodyAccMag_energy"               
## [208] "tBodyAccMag_iqr"                  
## [209] "tBodyAccMag_entropy"              
## [210] "tBodyAccMag_arCoeff"              
## [211] "tBodyAccMag_arCoeff.1"            
## [212] "tBodyAccMag_arCoeff.2"            
## [213] "tBodyAccMag_arCoeff.3"            
## [214] "tGravityAccMag_mean"              
## [215] "tGravityAccMag_std"               
## [216] "tGravityAccMag_mad"               
## [217] "tGravityAccMag_max"               
## [218] "tGravityAccMag_min"               
## [219] "tGravityAccMag_sma"               
## [220] "tGravityAccMag_energy"            
## [221] "tGravityAccMag_iqr"               
## [222] "tGravityAccMag_entropy"           
## [223] "tGravityAccMag_arCoeff"           
## [224] "tGravityAccMag_arCoeff.1"         
## [225] "tGravityAccMag_arCoeff.2"         
## [226] "tGravityAccMag_arCoeff.3"         
## [227] "tBodyAccJerkMag_mean"             
## [228] "tBodyAccJerkMag_std"              
## [229] "tBodyAccJerkMag_mad"              
## [230] "tBodyAccJerkMag_max"              
## [231] "tBodyAccJerkMag_min"              
## [232] "tBodyAccJerkMag_sma"              
## [233] "tBodyAccJerkMag_energy"           
## [234] "tBodyAccJerkMag_iqr"              
## [235] "tBodyAccJerkMag_entropy"          
## [236] "tBodyAccJerkMag_arCoeff"          
## [237] "tBodyAccJerkMag_arCoeff.1"        
## [238] "tBodyAccJerkMag_arCoeff.2"        
## [239] "tBodyAccJerkMag_arCoeff.3"        
## [240] "tBodyGyroMag_mean"                
## [241] "tBodyGyroMag_std"                 
## [242] "tBodyGyroMag_mad"                 
## [243] "tBodyGyroMag_max"                 
## [244] "tBodyGyroMag_min"                 
## [245] "tBodyGyroMag_sma"                 
## [246] "tBodyGyroMag_energy"              
## [247] "tBodyGyroMag_iqr"                 
## [248] "tBodyGyroMag_entropy"             
## [249] "tBodyGyroMag_arCoeff"             
## [250] "tBodyGyroMag_arCoeff.1"           
## [251] "tBodyGyroMag_arCoeff.2"           
## [252] "tBodyGyroMag_arCoeff.3"           
## [253] "tBodyGyroJerkMag_mean"            
## [254] "tBodyGyroJerkMag_std"             
## [255] "tBodyGyroJerkMag_mad"             
## [256] "tBodyGyroJerkMag_max"             
## [257] "tBodyGyroJerkMag_min"             
## [258] "tBodyGyroJerkMag_sma"             
## [259] "tBodyGyroJerkMag_energy"          
## [260] "tBodyGyroJerkMag_iqr"             
## [261] "tBodyGyroJerkMag_entropy"         
## [262] "tBodyGyroJerkMag_arCoeff"         
## [263] "tBodyGyroJerkMag_arCoeff.1"       
## [264] "tBodyGyroJerkMag_arCoeff.2"       
## [265] "tBodyGyroJerkMag_arCoeff.3"       
## [266] "fBodyAcc_mean_X"                  
## [267] "fBodyAcc_mean_Y"                  
## [268] "fBodyAcc_mean_Z"                  
## [269] "fBodyAcc_std_X"                   
## [270] "fBodyAcc_std_Y"                   
## [271] "fBodyAcc_std_Z"                   
## [272] "fBodyAcc_mad_X"                   
## [273] "fBodyAcc_mad_Y"                   
## [274] "fBodyAcc_mad_Z"                   
## [275] "fBodyAcc_max_X"                   
## [276] "fBodyAcc_max_Y"                   
## [277] "fBodyAcc_max_Z"                   
## [278] "fBodyAcc_min_X"                   
## [279] "fBodyAcc_min_Y"                   
## [280] "fBodyAcc_min_Z"                   
## [281] "fBodyAcc_sma"                     
## [282] "fBodyAcc_energy_X"                
## [283] "fBodyAcc_energy_Y"                
## [284] "fBodyAcc_energy_Z"                
## [285] "fBodyAcc_iqr_X"                   
## [286] "fBodyAcc_iqr_Y"                   
## [287] "fBodyAcc_iqr_Z"                   
## [288] "fBodyAcc_entropy_X"               
## [289] "fBodyAcc_entropy_Y"               
## [290] "fBodyAcc_entropy_Z"               
## [291] "fBodyAcc_maxInds_X"               
## [292] "fBodyAcc_maxInds_Y"               
## [293] "fBodyAcc_maxInds_Z"               
## [294] "fBodyAcc_meanFreq_X"              
## [295] "fBodyAcc_meanFreq_Y"              
## [296] "fBodyAcc_meanFreq_Z"              
## [297] "fBodyAcc_skewness_X"              
## [298] "fBodyAcc_kurtosis_X"              
## [299] "fBodyAcc_skewness_Y"              
## [300] "fBodyAcc_kurtosis_Y"              
## [301] "fBodyAcc_skewness_Z"              
## [302] "fBodyAcc_kurtosis_Z"              
## [303] "fBodyAcc_bandsEnergy_"            
## [304] "fBodyAcc_bandsEnergy_.1"          
## [305] "fBodyAcc_bandsEnergy_.2"          
## [306] "fBodyAcc_bandsEnergy_.3"          
## [307] "fBodyAcc_bandsEnergy_.4"          
## [308] "fBodyAcc_bandsEnergy_.5"          
## [309] "fBodyAcc_bandsEnergy_.6"          
## [310] "fBodyAcc_bandsEnergy_.7"          
## [311] "fBodyAcc_bandsEnergy_.8"          
## [312] "fBodyAcc_bandsEnergy_.9"          
## [313] "fBodyAcc_bandsEnergy_.10"         
## [314] "fBodyAcc_bandsEnergy_.11"         
## [315] "fBodyAcc_bandsEnergy_.12"         
## [316] "fBodyAcc_bandsEnergy_.13"         
## [317] "fBodyAcc_bandsEnergy_.14"         
## [318] "fBodyAcc_bandsEnergy_.15"         
## [319] "fBodyAcc_bandsEnergy_.16"         
## [320] "fBodyAcc_bandsEnergy_.17"         
## [321] "fBodyAcc_bandsEnergy_.18"         
## [322] "fBodyAcc_bandsEnergy_.19"         
## [323] "fBodyAcc_bandsEnergy_.20"         
## [324] "fBodyAcc_bandsEnergy_.21"         
## [325] "fBodyAcc_bandsEnergy_.22"         
## [326] "fBodyAcc_bandsEnergy_.23"         
## [327] "fBodyAcc_bandsEnergy_.24"         
## [328] "fBodyAcc_bandsEnergy_.25"         
## [329] "fBodyAcc_bandsEnergy_.26"         
## [330] "fBodyAcc_bandsEnergy_.27"         
## [331] "fBodyAcc_bandsEnergy_.28"         
## [332] "fBodyAcc_bandsEnergy_.29"         
## [333] "fBodyAcc_bandsEnergy_.30"         
## [334] "fBodyAcc_bandsEnergy_.31"         
## [335] "fBodyAcc_bandsEnergy_.32"         
## [336] "fBodyAcc_bandsEnergy_.33"         
## [337] "fBodyAcc_bandsEnergy_.34"         
## [338] "fBodyAcc_bandsEnergy_.35"         
## [339] "fBodyAcc_bandsEnergy_.36"         
## [340] "fBodyAcc_bandsEnergy_.37"         
## [341] "fBodyAcc_bandsEnergy_.38"         
## [342] "fBodyAcc_bandsEnergy_.39"         
## [343] "fBodyAcc_bandsEnergy_.40"         
## [344] "fBodyAcc_bandsEnergy_.41"         
## [345] "fBodyAccJerk_mean_X"              
## [346] "fBodyAccJerk_mean_Y"              
## [347] "fBodyAccJerk_mean_Z"              
## [348] "fBodyAccJerk_std_X"               
## [349] "fBodyAccJerk_std_Y"               
## [350] "fBodyAccJerk_std_Z"               
## [351] "fBodyAccJerk_mad_X"               
## [352] "fBodyAccJerk_mad_Y"               
## [353] "fBodyAccJerk_mad_Z"               
## [354] "fBodyAccJerk_max_X"               
## [355] "fBodyAccJerk_max_Y"               
## [356] "fBodyAccJerk_max_Z"               
## [357] "fBodyAccJerk_min_X"               
## [358] "fBodyAccJerk_min_Y"               
## [359] "fBodyAccJerk_min_Z"               
## [360] "fBodyAccJerk_sma"                 
## [361] "fBodyAccJerk_energy_X"            
## [362] "fBodyAccJerk_energy_Y"            
## [363] "fBodyAccJerk_energy_Z"            
## [364] "fBodyAccJerk_iqr_X"               
## [365] "fBodyAccJerk_iqr_Y"               
## [366] "fBodyAccJerk_iqr_Z"               
## [367] "fBodyAccJerk_entropy_X"           
## [368] "fBodyAccJerk_entropy_Y"           
## [369] "fBodyAccJerk_entropy_Z"           
## [370] "fBodyAccJerk_maxInds_X"           
## [371] "fBodyAccJerk_maxInds_Y"           
## [372] "fBodyAccJerk_maxInds_Z"           
## [373] "fBodyAccJerk_meanFreq_X"          
## [374] "fBodyAccJerk_meanFreq_Y"          
## [375] "fBodyAccJerk_meanFreq_Z"          
## [376] "fBodyAccJerk_skewness_X"          
## [377] "fBodyAccJerk_kurtosis_X"          
## [378] "fBodyAccJerk_skewness_Y"          
## [379] "fBodyAccJerk_kurtosis_Y"          
## [380] "fBodyAccJerk_skewness_Z"          
## [381] "fBodyAccJerk_kurtosis_Z"          
## [382] "fBodyAccJerk_bandsEnergy_"        
## [383] "fBodyAccJerk_bandsEnergy_.1"      
## [384] "fBodyAccJerk_bandsEnergy_.2"      
## [385] "fBodyAccJerk_bandsEnergy_.3"      
## [386] "fBodyAccJerk_bandsEnergy_.4"      
## [387] "fBodyAccJerk_bandsEnergy_.5"      
## [388] "fBodyAccJerk_bandsEnergy_.6"      
## [389] "fBodyAccJerk_bandsEnergy_.7"      
## [390] "fBodyAccJerk_bandsEnergy_.8"      
## [391] "fBodyAccJerk_bandsEnergy_.9"      
## [392] "fBodyAccJerk_bandsEnergy_.10"     
## [393] "fBodyAccJerk_bandsEnergy_.11"     
## [394] "fBodyAccJerk_bandsEnergy_.12"     
## [395] "fBodyAccJerk_bandsEnergy_.13"     
## [396] "fBodyAccJerk_bandsEnergy_.14"     
## [397] "fBodyAccJerk_bandsEnergy_.15"     
## [398] "fBodyAccJerk_bandsEnergy_.16"     
## [399] "fBodyAccJerk_bandsEnergy_.17"     
## [400] "fBodyAccJerk_bandsEnergy_.18"     
## [401] "fBodyAccJerk_bandsEnergy_.19"     
## [402] "fBodyAccJerk_bandsEnergy_.20"     
## [403] "fBodyAccJerk_bandsEnergy_.21"     
## [404] "fBodyAccJerk_bandsEnergy_.22"     
## [405] "fBodyAccJerk_bandsEnergy_.23"     
## [406] "fBodyAccJerk_bandsEnergy_.24"     
## [407] "fBodyAccJerk_bandsEnergy_.25"     
## [408] "fBodyAccJerk_bandsEnergy_.26"     
## [409] "fBodyAccJerk_bandsEnergy_.27"     
## [410] "fBodyAccJerk_bandsEnergy_.28"     
## [411] "fBodyAccJerk_bandsEnergy_.29"     
## [412] "fBodyAccJerk_bandsEnergy_.30"     
## [413] "fBodyAccJerk_bandsEnergy_.31"     
## [414] "fBodyAccJerk_bandsEnergy_.32"     
## [415] "fBodyAccJerk_bandsEnergy_.33"     
## [416] "fBodyAccJerk_bandsEnergy_.34"     
## [417] "fBodyAccJerk_bandsEnergy_.35"     
## [418] "fBodyAccJerk_bandsEnergy_.36"     
## [419] "fBodyAccJerk_bandsEnergy_.37"     
## [420] "fBodyAccJerk_bandsEnergy_.38"     
## [421] "fBodyAccJerk_bandsEnergy_.39"     
## [422] "fBodyAccJerk_bandsEnergy_.40"     
## [423] "fBodyAccJerk_bandsEnergy_.41"     
## [424] "fBodyGyro_mean_X"                 
## [425] "fBodyGyro_mean_Y"                 
## [426] "fBodyGyro_mean_Z"                 
## [427] "fBodyGyro_std_X"                  
## [428] "fBodyGyro_std_Y"                  
## [429] "fBodyGyro_std_Z"                  
## [430] "fBodyGyro_mad_X"                  
## [431] "fBodyGyro_mad_Y"                  
## [432] "fBodyGyro_mad_Z"                  
## [433] "fBodyGyro_max_X"                  
## [434] "fBodyGyro_max_Y"                  
## [435] "fBodyGyro_max_Z"                  
## [436] "fBodyGyro_min_X"                  
## [437] "fBodyGyro_min_Y"                  
## [438] "fBodyGyro_min_Z"                  
## [439] "fBodyGyro_sma"                    
## [440] "fBodyGyro_energy_X"               
## [441] "fBodyGyro_energy_Y"               
## [442] "fBodyGyro_energy_Z"               
## [443] "fBodyGyro_iqr_X"                  
## [444] "fBodyGyro_iqr_Y"                  
## [445] "fBodyGyro_iqr_Z"                  
## [446] "fBodyGyro_entropy_X"              
## [447] "fBodyGyro_entropy_Y"              
## [448] "fBodyGyro_entropy_Z"              
## [449] "fBodyGyro_maxInds_X"              
## [450] "fBodyGyro_maxInds_Y"              
## [451] "fBodyGyro_maxInds_Z"              
## [452] "fBodyGyro_meanFreq_X"             
## [453] "fBodyGyro_meanFreq_Y"             
## [454] "fBodyGyro_meanFreq_Z"             
## [455] "fBodyGyro_skewness_X"             
## [456] "fBodyGyro_kurtosis_X"             
## [457] "fBodyGyro_skewness_Y"             
## [458] "fBodyGyro_kurtosis_Y"             
## [459] "fBodyGyro_skewness_Z"             
## [460] "fBodyGyro_kurtosis_Z"             
## [461] "fBodyGyro_bandsEnergy_"           
## [462] "fBodyGyro_bandsEnergy_.1"         
## [463] "fBodyGyro_bandsEnergy_.2"         
## [464] "fBodyGyro_bandsEnergy_.3"         
## [465] "fBodyGyro_bandsEnergy_.4"         
## [466] "fBodyGyro_bandsEnergy_.5"         
## [467] "fBodyGyro_bandsEnergy_.6"         
## [468] "fBodyGyro_bandsEnergy_.7"         
## [469] "fBodyGyro_bandsEnergy_.8"         
## [470] "fBodyGyro_bandsEnergy_.9"         
## [471] "fBodyGyro_bandsEnergy_.10"        
## [472] "fBodyGyro_bandsEnergy_.11"        
## [473] "fBodyGyro_bandsEnergy_.12"        
## [474] "fBodyGyro_bandsEnergy_.13"        
## [475] "fBodyGyro_bandsEnergy_.14"        
## [476] "fBodyGyro_bandsEnergy_.15"        
## [477] "fBodyGyro_bandsEnergy_.16"        
## [478] "fBodyGyro_bandsEnergy_.17"        
## [479] "fBodyGyro_bandsEnergy_.18"        
## [480] "fBodyGyro_bandsEnergy_.19"        
## [481] "fBodyGyro_bandsEnergy_.20"        
## [482] "fBodyGyro_bandsEnergy_.21"        
## [483] "fBodyGyro_bandsEnergy_.22"        
## [484] "fBodyGyro_bandsEnergy_.23"        
## [485] "fBodyGyro_bandsEnergy_.24"        
## [486] "fBodyGyro_bandsEnergy_.25"        
## [487] "fBodyGyro_bandsEnergy_.26"        
## [488] "fBodyGyro_bandsEnergy_.27"        
## [489] "fBodyGyro_bandsEnergy_.28"        
## [490] "fBodyGyro_bandsEnergy_.29"        
## [491] "fBodyGyro_bandsEnergy_.30"        
## [492] "fBodyGyro_bandsEnergy_.31"        
## [493] "fBodyGyro_bandsEnergy_.32"        
## [494] "fBodyGyro_bandsEnergy_.33"        
## [495] "fBodyGyro_bandsEnergy_.34"        
## [496] "fBodyGyro_bandsEnergy_.35"        
## [497] "fBodyGyro_bandsEnergy_.36"        
## [498] "fBodyGyro_bandsEnergy_.37"        
## [499] "fBodyGyro_bandsEnergy_.38"        
## [500] "fBodyGyro_bandsEnergy_.39"        
## [501] "fBodyGyro_bandsEnergy_.40"        
## [502] "fBodyGyro_bandsEnergy_.41"        
## [503] "fBodyAccMag_mean"                 
## [504] "fBodyAccMag_std"                  
## [505] "fBodyAccMag_mad"                  
## [506] "fBodyAccMag_max"                  
## [507] "fBodyAccMag_min"                  
## [508] "fBodyAccMag_sma"                  
## [509] "fBodyAccMag_energy"               
## [510] "fBodyAccMag_iqr"                  
## [511] "fBodyAccMag_entropy"              
## [512] "fBodyAccMag_maxInds"              
## [513] "fBodyAccMag_meanFreq"             
## [514] "fBodyAccMag_skewness"             
## [515] "fBodyAccMag_kurtosis"             
## [516] "fBodyBodyAccJerkMag_mean"         
## [517] "fBodyBodyAccJerkMag_std"          
## [518] "fBodyBodyAccJerkMag_mad"          
## [519] "fBodyBodyAccJerkMag_max"          
## [520] "fBodyBodyAccJerkMag_min"          
## [521] "fBodyBodyAccJerkMag_sma"          
## [522] "fBodyBodyAccJerkMag_energy"       
## [523] "fBodyBodyAccJerkMag_iqr"          
## [524] "fBodyBodyAccJerkMag_entropy"      
## [525] "fBodyBodyAccJerkMag_maxInds"      
## [526] "fBodyBodyAccJerkMag_meanFreq"     
## [527] "fBodyBodyAccJerkMag_skewness"     
## [528] "fBodyBodyAccJerkMag_kurtosis"     
## [529] "fBodyBodyGyroMag_mean"            
## [530] "fBodyBodyGyroMag_std"             
## [531] "fBodyBodyGyroMag_mad"             
## [532] "fBodyBodyGyroMag_max"             
## [533] "fBodyBodyGyroMag_min"             
## [534] "fBodyBodyGyroMag_sma"             
## [535] "fBodyBodyGyroMag_energy"          
## [536] "fBodyBodyGyroMag_iqr"             
## [537] "fBodyBodyGyroMag_entropy"         
## [538] "fBodyBodyGyroMag_maxInds"         
## [539] "fBodyBodyGyroMag_meanFreq"        
## [540] "fBodyBodyGyroMag_skewness"        
## [541] "fBodyBodyGyroMag_kurtosis"        
## [542] "fBodyBodyGyroJerkMag_mean"        
## [543] "fBodyBodyGyroJerkMag_std"         
## [544] "fBodyBodyGyroJerkMag_mad"         
## [545] "fBodyBodyGyroJerkMag_max"         
## [546] "fBodyBodyGyroJerkMag_min"         
## [547] "fBodyBodyGyroJerkMag_sma"         
## [548] "fBodyBodyGyroJerkMag_energy"      
## [549] "fBodyBodyGyroJerkMag_iqr"         
## [550] "fBodyBodyGyroJerkMag_entropy"     
## [551] "fBodyBodyGyroJerkMag_maxInds"     
## [552] "fBodyBodyGyroJerkMag_meanFreq"    
## [553] "fBodyBodyGyroJerkMag_skewness"    
## [554] "fBodyBodyGyroJerkMag_kurtosis"    
## [555] "angletBodyAccMeangravity"         
## [556] "angletBodyAccJerkMeangravityMean" 
## [557] "angletBodyGyroMeangravityMean"    
## [558] "angletBodyGyroJerkMeangravityMean"
## [559] "angleXgravityMean"                
## [560] "angleYgravityMean"                
## [561] "angleZgravityMean"                
## [562] "Activity"                         
## [563] "Subject"
mergeMeanStd<-select(merge, matches("mean|std"), one_of(subject, activity)) 
ncol(mergeMeanStd)
## [1] 88
summary(mergeMeanStd)
##  tBodyAcc_mean_X   tBodyAcc_mean_Y    tBodyAcc_mean_Z    tBodyAcc_std_X   
##  Min.   :-1.0000   Min.   :-1.00000   Min.   :-1.00000   Min.   :-1.0000  
##  1st Qu.: 0.2626   1st Qu.:-0.02490   1st Qu.:-0.12102   1st Qu.:-0.9924  
##  Median : 0.2772   Median :-0.01716   Median :-0.10860   Median :-0.9430  
##  Mean   : 0.2743   Mean   :-0.01774   Mean   :-0.10892   Mean   :-0.6078  
##  3rd Qu.: 0.2884   3rd Qu.:-0.01062   3rd Qu.:-0.09759   3rd Qu.:-0.2503  
##  Max.   : 1.0000   Max.   : 1.00000   Max.   : 1.00000   Max.   : 1.0000  
##  tBodyAcc_std_Y     tBodyAcc_std_Z    tGravityAcc_mean_X
##  Min.   :-1.00000   Min.   :-1.0000   Min.   :-1.0000   
##  1st Qu.:-0.97699   1st Qu.:-0.9791   1st Qu.: 0.8117   
##  Median :-0.83503   Median :-0.8508   Median : 0.9218   
##  Mean   :-0.51019   Mean   :-0.6131   Mean   : 0.6692   
##  3rd Qu.:-0.05734   3rd Qu.:-0.2787   3rd Qu.: 0.9547   
##  Max.   : 1.00000   Max.   : 1.0000   Max.   : 1.0000   
##  tGravityAcc_mean_Y  tGravityAcc_mean_Z tGravityAcc_std_X
##  Min.   :-1.000000   Min.   :-1.00000   Min.   :-1.0000  
##  1st Qu.:-0.242943   1st Qu.:-0.11671   1st Qu.:-0.9949  
##  Median :-0.143551   Median : 0.03680   Median :-0.9819  
##  Mean   : 0.004039   Mean   : 0.09215   Mean   :-0.9652  
##  3rd Qu.: 0.118905   3rd Qu.: 0.21621   3rd Qu.:-0.9615  
##  Max.   : 1.000000   Max.   : 1.00000   Max.   : 1.0000  
##  tGravityAcc_std_Y tGravityAcc_std_Z tBodyAccJerk_mean_X
##  Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.00000   
##  1st Qu.:-0.9913   1st Qu.:-0.9866   1st Qu.: 0.06298   
##  Median :-0.9759   Median :-0.9665   Median : 0.07597   
##  Mean   :-0.9544   Mean   :-0.9389   Mean   : 0.07894   
##  3rd Qu.:-0.9464   3rd Qu.:-0.9296   3rd Qu.: 0.09131   
##  Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.00000   
##  tBodyAccJerk_mean_Y tBodyAccJerk_mean_Z tBodyAccJerk_std_X
##  Min.   :-1.000000   Min.   :-1.000000   Min.   :-1.0000   
##  1st Qu.:-0.018555   1st Qu.:-0.031552   1st Qu.:-0.9913   
##  Median : 0.010753   Median :-0.001159   Median :-0.9513   
##  Mean   : 0.007948   Mean   :-0.004675   Mean   :-0.6398   
##  3rd Qu.: 0.033538   3rd Qu.: 0.024578   3rd Qu.:-0.2912   
##  Max.   : 1.000000   Max.   : 1.000000   Max.   : 1.0000   
##  tBodyAccJerk_std_Y tBodyAccJerk_std_Z tBodyGyro_mean_X  
##  Min.   :-1.0000    Min.   :-1.0000    Min.   :-1.00000  
##  1st Qu.:-0.9850    1st Qu.:-0.9892    1st Qu.:-0.04579  
##  Median :-0.9250    Median :-0.9543    Median :-0.02776  
##  Mean   :-0.6080    Mean   :-0.7628    Mean   :-0.03098  
##  3rd Qu.:-0.2218    3rd Qu.:-0.5485    3rd Qu.:-0.01058  
##  Max.   : 1.0000    Max.   : 1.0000    Max.   : 1.00000  
##  tBodyGyro_mean_Y   tBodyGyro_mean_Z   tBodyGyro_std_X   tBodyGyro_std_Y  
##  Min.   :-1.00000   Min.   :-1.00000   Min.   :-1.0000   Min.   :-1.0000  
##  1st Qu.:-0.10399   1st Qu.: 0.06485   1st Qu.:-0.9872   1st Qu.:-0.9819  
##  Median :-0.07477   Median : 0.08626   Median :-0.9016   Median :-0.9106  
##  Mean   :-0.07472   Mean   : 0.08836   Mean   :-0.7212   Mean   :-0.6827  
##  3rd Qu.:-0.05110   3rd Qu.: 0.11044   3rd Qu.:-0.4822   3rd Qu.:-0.4461  
##  Max.   : 1.00000   Max.   : 1.00000   Max.   : 1.0000   Max.   : 1.0000  
##  tBodyGyro_std_Z   tBodyGyroJerk_mean_X tBodyGyroJerk_mean_Y
##  Min.   :-1.0000   Min.   :-1.00000     Min.   :-1.00000    
##  1st Qu.:-0.9850   1st Qu.:-0.11723     1st Qu.:-0.05868    
##  Median :-0.8819   Median :-0.09824     Median :-0.04056    
##  Mean   :-0.6537   Mean   :-0.09671     Mean   :-0.04232    
##  3rd Qu.:-0.3379   3rd Qu.:-0.07930     3rd Qu.:-0.02521    
##  Max.   : 1.0000   Max.   : 1.00000     Max.   : 1.00000    
##  tBodyGyroJerk_mean_Z tBodyGyroJerk_std_X tBodyGyroJerk_std_Y
##  Min.   :-1.00000     Min.   :-1.0000     Min.   :-1.0000    
##  1st Qu.:-0.07936     1st Qu.:-0.9907     1st Qu.:-0.9922    
##  Median :-0.05455     Median :-0.9348     Median :-0.9548    
##  Mean   :-0.05483     Mean   :-0.7313     Mean   :-0.7861    
##  3rd Qu.:-0.03168     3rd Qu.:-0.4865     3rd Qu.:-0.6268    
##  Max.   : 1.00000     Max.   : 1.0000     Max.   : 1.0000    
##  tBodyGyroJerk_std_Z tBodyAccMag_mean  tBodyAccMag_std  
##  Min.   :-1.0000     Min.   :-1.0000   Min.   :-1.0000  
##  1st Qu.:-0.9926     1st Qu.:-0.9819   1st Qu.:-0.9822  
##  Median :-0.9503     Median :-0.8746   Median :-0.8437  
##  Mean   :-0.7399     Mean   :-0.5482   Mean   :-0.5912  
##  3rd Qu.:-0.5097     3rd Qu.:-0.1201   3rd Qu.:-0.2423  
##  Max.   : 1.0000     Max.   : 1.0000   Max.   : 1.0000  
##  tGravityAccMag_mean tGravityAccMag_std tBodyAccJerkMag_mean
##  Min.   :-1.0000     Min.   :-1.0000    Min.   :-1.0000     
##  1st Qu.:-0.9819     1st Qu.:-0.9822    1st Qu.:-0.9896     
##  Median :-0.8746     Median :-0.8437    Median :-0.9481     
##  Mean   :-0.5482     Mean   :-0.5912    Mean   :-0.6494     
##  3rd Qu.:-0.1201     3rd Qu.:-0.2423    3rd Qu.:-0.2956     
##  Max.   : 1.0000     Max.   : 1.0000    Max.   : 1.0000     
##  tBodyAccJerkMag_std tBodyGyroMag_mean tBodyGyroMag_std 
##  Min.   :-1.0000     Min.   :-1.0000   Min.   :-1.0000  
##  1st Qu.:-0.9907     1st Qu.:-0.9781   1st Qu.:-0.9775  
##  Median :-0.9288     Median :-0.8223   Median :-0.8259  
##  Mean   :-0.6278     Mean   :-0.6052   Mean   :-0.6625  
##  3rd Qu.:-0.2733     3rd Qu.:-0.2454   3rd Qu.:-0.3940  
##  Max.   : 1.0000     Max.   : 1.0000   Max.   : 1.0000  
##  tBodyGyroJerkMag_mean tBodyGyroJerkMag_std fBodyAcc_mean_X  
##  Min.   :-1.0000       Min.   :-1.0000      Min.   :-1.0000  
##  1st Qu.:-0.9923       1st Qu.:-0.9922      1st Qu.:-0.9913  
##  Median :-0.9559       Median :-0.9403      Median :-0.9456  
##  Mean   :-0.7621       Mean   :-0.7780      Mean   :-0.6228  
##  3rd Qu.:-0.5499       3rd Qu.:-0.6093      3rd Qu.:-0.2646  
##  Max.   : 1.0000       Max.   : 1.0000      Max.   : 1.0000  
##  fBodyAcc_mean_Y   fBodyAcc_mean_Z   fBodyAcc_std_X    fBodyAcc_std_Y    
##  Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.00000  
##  1st Qu.:-0.9792   1st Qu.:-0.9832   1st Qu.:-0.9929   1st Qu.:-0.97689  
##  Median :-0.8643   Median :-0.8954   Median :-0.9416   Median :-0.83261  
##  Mean   :-0.5375   Mean   :-0.6650   Mean   :-0.6034   Mean   :-0.52842  
##  3rd Qu.:-0.1032   3rd Qu.:-0.3662   3rd Qu.:-0.2493   3rd Qu.:-0.09216  
##  Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.00000  
##  fBodyAcc_std_Z    fBodyAcc_meanFreq_X fBodyAcc_meanFreq_Y
##  Min.   :-1.0000   Min.   :-1.00000    Min.   :-1.000000  
##  1st Qu.:-0.9780   1st Qu.:-0.41878    1st Qu.:-0.144772  
##  Median :-0.8398   Median :-0.23825    Median : 0.004666  
##  Mean   :-0.6179   Mean   :-0.22147    Mean   : 0.015401  
##  3rd Qu.:-0.3023   3rd Qu.:-0.02043    3rd Qu.: 0.176603  
##  Max.   : 1.0000   Max.   : 1.00000    Max.   : 1.000000  
##  fBodyAcc_meanFreq_Z fBodyAccJerk_mean_X fBodyAccJerk_mean_Y
##  Min.   :-1.00000    Min.   :-1.0000     Min.   :-1.0000    
##  1st Qu.:-0.13845    1st Qu.:-0.9912     1st Qu.:-0.9848    
##  Median : 0.06084    Median :-0.9516     Median :-0.9257    
##  Mean   : 0.04731    Mean   :-0.6567     Mean   :-0.6290    
##  3rd Qu.: 0.24922    3rd Qu.:-0.3270     3rd Qu.:-0.2638    
##  Max.   : 1.00000    Max.   : 1.0000     Max.   : 1.0000    
##  fBodyAccJerk_mean_Z fBodyAccJerk_std_X fBodyAccJerk_std_Y
##  Min.   :-1.0000     Min.   :-1.0000    Min.   :-1.0000   
##  1st Qu.:-0.9873     1st Qu.:-0.9920    1st Qu.:-0.9865   
##  Median :-0.9475     Median :-0.9562    Median :-0.9280   
##  Mean   :-0.7436     Mean   :-0.6550    Mean   :-0.6122   
##  3rd Qu.:-0.5133     3rd Qu.:-0.3203    3rd Qu.:-0.2361   
##  Max.   : 1.0000     Max.   : 1.0000    Max.   : 1.0000   
##  fBodyAccJerk_std_Z fBodyAccJerk_meanFreq_X fBodyAccJerk_meanFreq_Y
##  Min.   :-1.0000    Min.   :-1.00000        Min.   :-1.000000      
##  1st Qu.:-0.9895    1st Qu.:-0.29770        1st Qu.:-0.427951      
##  Median :-0.9590    Median :-0.04544        Median :-0.236530      
##  Mean   :-0.7809    Mean   :-0.04771        Mean   :-0.213393      
##  3rd Qu.:-0.5903    3rd Qu.: 0.20447        3rd Qu.: 0.008651      
##  Max.   : 1.0000    Max.   : 1.00000        Max.   : 1.000000      
##  fBodyAccJerk_meanFreq_Z fBodyGyro_mean_X  fBodyGyro_mean_Y 
##  Min.   :-1.00000        Min.   :-1.0000   Min.   :-1.0000  
##  1st Qu.:-0.33139        1st Qu.:-0.9853   1st Qu.:-0.9847  
##  Median :-0.10246        Median :-0.8917   Median :-0.9197  
##  Mean   :-0.12383        Mean   :-0.6721   Mean   :-0.7062  
##  3rd Qu.: 0.09124        3rd Qu.:-0.3837   3rd Qu.:-0.4735  
##  Max.   : 1.00000        Max.   : 1.0000   Max.   : 1.0000  
##  fBodyGyro_mean_Z  fBodyGyro_std_X   fBodyGyro_std_Y   fBodyGyro_std_Z  
##  Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.0000  
##  1st Qu.:-0.9851   1st Qu.:-0.9881   1st Qu.:-0.9808   1st Qu.:-0.9862  
##  Median :-0.8877   Median :-0.9053   Median :-0.9061   Median :-0.8915  
##  Mean   :-0.6442   Mean   :-0.7386   Mean   :-0.6742   Mean   :-0.6904  
##  3rd Qu.:-0.3225   3rd Qu.:-0.5225   3rd Qu.:-0.4385   3rd Qu.:-0.4168  
##  Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.0000  
##  fBodyGyro_meanFreq_X fBodyGyro_meanFreq_Y fBodyGyro_meanFreq_Z
##  Min.   :-1.00000     Min.   :-1.00000     Min.   :-1.00000    
##  1st Qu.:-0.27189     1st Qu.:-0.36257     1st Qu.:-0.23240    
##  Median :-0.09868     Median :-0.17298     Median :-0.05369    
##  Mean   :-0.10104     Mean   :-0.17428     Mean   :-0.05139    
##  3rd Qu.: 0.06810     3rd Qu.: 0.01366     3rd Qu.: 0.12251    
##  Max.   : 1.00000     Max.   : 1.00000     Max.   : 1.00000    
##  fBodyAccMag_mean  fBodyAccMag_std   fBodyAccMag_meanFreq
##  Min.   :-1.0000   Min.   :-1.0000   Min.   :-1.00000    
##  1st Qu.:-0.9847   1st Qu.:-0.9829   1st Qu.:-0.09663    
##  Median :-0.8755   Median :-0.8547   Median : 0.07026    
##  Mean   :-0.5860   Mean   :-0.6595   Mean   : 0.07688    
##  3rd Qu.:-0.2173   3rd Qu.:-0.3823   3rd Qu.: 0.24495    
##  Max.   : 1.0000   Max.   : 1.0000   Max.   : 1.00000    
##  fBodyBodyAccJerkMag_mean fBodyBodyAccJerkMag_std
##  Min.   :-1.0000          Min.   :-1.0000        
##  1st Qu.:-0.9898          1st Qu.:-0.9907        
##  Median :-0.9290          Median :-0.9255        
##  Mean   :-0.6208          Mean   :-0.6401        
##  3rd Qu.:-0.2600          3rd Qu.:-0.3082        
##  Max.   : 1.0000          Max.   : 1.0000        
##  fBodyBodyAccJerkMag_meanFreq fBodyBodyGyroMag_mean fBodyBodyGyroMag_std
##  Min.   :-1.000000            Min.   :-1.0000       Min.   :-1.0000     
##  1st Qu.:-0.002959            1st Qu.:-0.9825       1st Qu.:-0.9781     
##  Median : 0.164180            Median :-0.8756       Median :-0.8275     
##  Mean   : 0.173220            Mean   :-0.6974       Mean   :-0.7000     
##  3rd Qu.: 0.357307            3rd Qu.:-0.4514       3rd Qu.:-0.4713     
##  Max.   : 1.000000            Max.   : 1.0000       Max.   : 1.0000     
##  fBodyBodyGyroMag_meanFreq fBodyBodyGyroJerkMag_mean
##  Min.   :-1.00000          Min.   :-1.0000          
##  1st Qu.:-0.23436          1st Qu.:-0.9921          
##  Median :-0.05210          Median :-0.9453          
##  Mean   :-0.04156          Mean   :-0.7798          
##  3rd Qu.: 0.15158          3rd Qu.:-0.6122          
##  Max.   : 1.00000          Max.   : 1.0000          
##  fBodyBodyGyroJerkMag_std fBodyBodyGyroJerkMag_meanFreq
##  Min.   :-1.0000          Min.   :-1.00000             
##  1st Qu.:-0.9926          1st Qu.:-0.01948             
##  Median :-0.9382          Median : 0.13625             
##  Mean   :-0.7922          Mean   : 0.12671             
##  3rd Qu.:-0.6437          3rd Qu.: 0.28896             
##  Max.   : 1.0000          Max.   : 1.00000             
##  angletBodyAccMeangravity angletBodyAccJerkMeangravityMean
##  Min.   :-1.000000        Min.   :-1.000000               
##  1st Qu.:-0.124694        1st Qu.:-0.287031               
##  Median : 0.008146        Median : 0.007668               
##  Mean   : 0.007705        Mean   : 0.002648               
##  3rd Qu.: 0.149005        3rd Qu.: 0.291490               
##  Max.   : 1.000000        Max.   : 1.000000               
##  angletBodyGyroMeangravityMean angletBodyGyroJerkMeangravityMean
##  Min.   :-1.00000              Min.   :-1.000000                
##  1st Qu.:-0.49311              1st Qu.:-0.389041                
##  Median : 0.01719              Median :-0.007186                
##  Mean   : 0.01768              Mean   :-0.009219                
##  3rd Qu.: 0.53614              3rd Qu.: 0.365996                
##  Max.   : 1.00000              Max.   : 1.000000                
##  angleXgravityMean angleYgravityMean   angleZgravityMean      Subject     
##  Min.   :-1.0000   Min.   :-1.000000   Min.   :-1.000000   Min.   : 1.00  
##  1st Qu.:-0.8173   1st Qu.: 0.002151   1st Qu.:-0.131880   1st Qu.: 9.00  
##  Median :-0.7156   Median : 0.182029   Median :-0.003882   Median :17.00  
##  Mean   :-0.4965   Mean   : 0.063255   Mean   :-0.054284   Mean   :16.15  
##  3rd Qu.:-0.5215   3rd Qu.: 0.250790   3rd Qu.: 0.102970   3rd Qu.:24.00  
##  Max.   : 1.0000   Max.   : 1.000000   Max.   : 1.000000   Max.   :30.00  
##     Activity    
##  Min.   :1.000  
##  1st Qu.:2.000  
##  Median :4.000  
##  Mean   :3.625  
##  3rd Qu.:5.000  
##  Max.   :6.000
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
