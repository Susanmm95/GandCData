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
>names(merge)
[1] "tBodyAcc_mean_X"                   "tBodyAcc_mean_Y"                  
  [3] "tBodyAcc_mean_Z"                   "tBodyAcc_std_X"                   
  [5] "tBodyAcc_std_Y"                    "tBodyAcc_std_Z"                   
  [7] "tBodyAcc_mad_X"                    "tBodyAcc_mad_Y"                   
  [9] "tBodyAcc_mad_Z"                    "tBodyAcc_max_X"                   
 [11] "tBodyAcc_max_Y"                    "tBodyAcc_max_Z"                   
 [13] "tBodyAcc_min_X"                    "tBodyAcc_min_Y"                   
 [15] "tBodyAcc_min_Z"                    "tBodyAcc_sma"                     
 [17] "tBodyAcc_energy_X"                 "tBodyAcc_energy_Y"                
 [19] "tBodyAcc_energy_Z"                 "tBodyAcc_iqr_X"                   
 [21] "tBodyAcc_iqr_Y"                    "tBodyAcc_iqr_Z"                   
 [23] "tBodyAcc_entropy_X"                "tBodyAcc_entropy_Y"               
 [25] "tBodyAcc_entropy_Z"                "tBodyAcc_arCoeff_X"               
 [27] "tBodyAcc_arCoeff_X.1"              "tBodyAcc_arCoeff_X.2"             
 [29] "tBodyAcc_arCoeff_X.3"              "tBodyAcc_arCoeff_Y"               
 [31] "tBodyAcc_arCoeff_Y.1"              "tBodyAcc_arCoeff_Y.2"             
 [33] "tBodyAcc_arCoeff_Y.3"              "tBodyAcc_arCoeff_Z"               
 [35] "tBodyAcc_arCoeff_Z.1"              "tBodyAcc_arCoeff_Z.2"             
 [37] "tBodyAcc_arCoeff_Z.3"              "tBodyAcc_correlation_XY"          
 [39] "tBodyAcc_correlation_XZ"           "tBodyAcc_correlation_YZ"          
 [41] "tGravityAcc_mean_X"                "tGravityAcc_mean_Y"               
 [43] "tGravityAcc_mean_Z"                "tGravityAcc_std_X"                
 [45] "tGravityAcc_std_Y"                 "tGravityAcc_std_Z"                
 [47] "tGravityAcc_mad_X"                 "tGravityAcc_mad_Y"                
 [49] "tGravityAcc_mad_Z"                 "tGravityAcc_max_X"                
 [51] "tGravityAcc_max_Y"                 "tGravityAcc_max_Z"                
 [53] "tGravityAcc_min_X"                 "tGravityAcc_min_Y"                
 [55] "tGravityAcc_min_Z"                 "tGravityAcc_sma"                  
 [57] "tGravityAcc_energy_X"              "tGravityAcc_energy_Y"             
 [59] "tGravityAcc_energy_Z"              "tGravityAcc_iqr_X"                
 [61] "tGravityAcc_iqr_Y"                 "tGravityAcc_iqr_Z"                
 [63] "tGravityAcc_entropy_X"             "tGravityAcc_entropy_Y"            
 [65] "tGravityAcc_entropy_Z"             "tGravityAcc_arCoeff_X"            
 [67] "tGravityAcc_arCoeff_X.1"           "tGravityAcc_arCoeff_X.2"          
 [69] "tGravityAcc_arCoeff_X.3"           "tGravityAcc_arCoeff_Y"            
 [71] "tGravityAcc_arCoeff_Y.1"           "tGravityAcc_arCoeff_Y.2"          
 [73] "tGravityAcc_arCoeff_Y.3"           "tGravityAcc_arCoeff_Z"            
 [75] "tGravityAcc_arCoeff_Z.1"           "tGravityAcc_arCoeff_Z.2"          
 [77] "tGravityAcc_arCoeff_Z.3"           "tGravityAcc_correlation_XY"       
 [79] "tGravityAcc_correlation_XZ"        "tGravityAcc_correlation_YZ"       
 [81] "tBodyAccJerk_mean_X"               "tBodyAccJerk_mean_Y"              
 [83] "tBodyAccJerk_mean_Z"               "tBodyAccJerk_std_X"               
 [85] "tBodyAccJerk_std_Y"                "tBodyAccJerk_std_Z"               
 [87] "tBodyAccJerk_mad_X"                "tBodyAccJerk_mad_Y"               
 [89] "tBodyAccJerk_mad_Z"                "tBodyAccJerk_max_X"               
 [91] "tBodyAccJerk_max_Y"                "tBodyAccJerk_max_Z"               
 [93] "tBodyAccJerk_min_X"                "tBodyAccJerk_min_Y"               
 [95] "tBodyAccJerk_min_Z"                "tBodyAccJerk_sma"                 
 [97] "tBodyAccJerk_energy_X"             "tBodyAccJerk_energy_Y"            
 [99] "tBodyAccJerk_energy_Z"             "tBodyAccJerk_iqr_X"               
[101] "tBodyAccJerk_iqr_Y"                "tBodyAccJerk_iqr_Z"               
[103] "tBodyAccJerk_entropy_X"            "tBodyAccJerk_entropy_Y"           
[105] "tBodyAccJerk_entropy_Z"            "tBodyAccJerk_arCoeff_X"           
[107] "tBodyAccJerk_arCoeff_X.1"          "tBodyAccJerk_arCoeff_X.2"         
[109] "tBodyAccJerk_arCoeff_X.3"          "tBodyAccJerk_arCoeff_Y"           
[111] "tBodyAccJerk_arCoeff_Y.1"          "tBodyAccJerk_arCoeff_Y.2"         
[113] "tBodyAccJerk_arCoeff_Y.3"          "tBodyAccJerk_arCoeff_Z"           
[115] "tBodyAccJerk_arCoeff_Z.1"          "tBodyAccJerk_arCoeff_Z.2"         
[117] "tBodyAccJerk_arCoeff_Z.3"          "tBodyAccJerk_correlation_XY"      
[119] "tBodyAccJerk_correlation_XZ"       "tBodyAccJerk_correlation_YZ"      
[121] "tBodyGyro_mean_X"                  "tBodyGyro_mean_Y"                 
[123] "tBodyGyro_mean_Z"                  "tBodyGyro_std_X"                  
[125] "tBodyGyro_std_Y"                   "tBodyGyro_std_Z"                  
[127] "tBodyGyro_mad_X"                   "tBodyGyro_mad_Y"                  
[129] "tBodyGyro_mad_Z"                   "tBodyGyro_max_X"                  
[131] "tBodyGyro_max_Y"                   "tBodyGyro_max_Z"                  
[133] "tBodyGyro_min_X"                   "tBodyGyro_min_Y"                  
[135] "tBodyGyro_min_Z"                   "tBodyGyro_sma"                    
[137] "tBodyGyro_energy_X"                "tBodyGyro_energy_Y"               
[139] "tBodyGyro_energy_Z"                "tBodyGyro_iqr_X"                  
[141] "tBodyGyro_iqr_Y"                   "tBodyGyro_iqr_Z"                  
[143] "tBodyGyro_entropy_X"               "tBodyGyro_entropy_Y"              
[145] "tBodyGyro_entropy_Z"               "tBodyGyro_arCoeff_X"              
[147] "tBodyGyro_arCoeff_X.1"             "tBodyGyro_arCoeff_X.2"            
[149] "tBodyGyro_arCoeff_X.3"             "tBodyGyro_arCoeff_Y"              
[151] "tBodyGyro_arCoeff_Y.1"             "tBodyGyro_arCoeff_Y.2"            
[153] "tBodyGyro_arCoeff_Y.3"             "tBodyGyro_arCoeff_Z"              
[155] "tBodyGyro_arCoeff_Z.1"             "tBodyGyro_arCoeff_Z.2"            
[157] "tBodyGyro_arCoeff_Z.3"             "tBodyGyro_correlation_XY"         
[159] "tBodyGyro_correlation_XZ"          "tBodyGyro_correlation_YZ"         
[161] "tBodyGyroJerk_mean_X"              "tBodyGyroJerk_mean_Y"             
[163] "tBodyGyroJerk_mean_Z"              "tBodyGyroJerk_std_X"              
[165] "tBodyGyroJerk_std_Y"               "tBodyGyroJerk_std_Z"              
[167] "tBodyGyroJerk_mad_X"               "tBodyGyroJerk_mad_Y"              
[169] "tBodyGyroJerk_mad_Z"               "tBodyGyroJerk_max_X"              
[171] "tBodyGyroJerk_max_Y"               "tBodyGyroJerk_max_Z"              
[173] "tBodyGyroJerk_min_X"               "tBodyGyroJerk_min_Y"              
[175] "tBodyGyroJerk_min_Z"               "tBodyGyroJerk_sma"                
[177] "tBodyGyroJerk_energy_X"            "tBodyGyroJerk_energy_Y"           
[179] "tBodyGyroJerk_energy_Z"            "tBodyGyroJerk_iqr_X"              
[181] "tBodyGyroJerk_iqr_Y"               "tBodyGyroJerk_iqr_Z"              
[183] "tBodyGyroJerk_entropy_X"           "tBodyGyroJerk_entropy_Y"          
[185] "tBodyGyroJerk_entropy_Z"           "tBodyGyroJerk_arCoeff_X"          
[187] "tBodyGyroJerk_arCoeff_X.1"         "tBodyGyroJerk_arCoeff_X.2"        
[189] "tBodyGyroJerk_arCoeff_X.3"         "tBodyGyroJerk_arCoeff_Y"          
[191] "tBodyGyroJerk_arCoeff_Y.1"         "tBodyGyroJerk_arCoeff_Y.2"        
[193] "tBodyGyroJerk_arCoeff_Y.3"         "tBodyGyroJerk_arCoeff_Z"          
[195] "tBodyGyroJerk_arCoeff_Z.1"         "tBodyGyroJerk_arCoeff_Z.2"        
[197] "tBodyGyroJerk_arCoeff_Z.3"         "tBodyGyroJerk_correlation_XY"     
[199] "tBodyGyroJerk_correlation_XZ"      "tBodyGyroJerk_correlation_YZ"     
[201] "tBodyAccMag_mean"                  "tBodyAccMag_std"                  
[203] "tBodyAccMag_mad"                   "tBodyAccMag_max"                  
[205] "tBodyAccMag_min"                   "tBodyAccMag_sma"                  
[207] "tBodyAccMag_energy"                "tBodyAccMag_iqr"                  
[209] "tBodyAccMag_entropy"               "tBodyAccMag_arCoeff"              
[211] "tBodyAccMag_arCoeff.1"             "tBodyAccMag_arCoeff.2"            
[213] "tBodyAccMag_arCoeff.3"             "tGravityAccMag_mean"              
[215] "tGravityAccMag_std"                "tGravityAccMag_mad"               
[217] "tGravityAccMag_max"                "tGravityAccMag_min"               
[219] "tGravityAccMag_sma"                "tGravityAccMag_energy"            
[221] "tGravityAccMag_iqr"                "tGravityAccMag_entropy"           
[223] "tGravityAccMag_arCoeff"            "tGravityAccMag_arCoeff.1"         
[225] "tGravityAccMag_arCoeff.2"          "tGravityAccMag_arCoeff.3"         
[227] "tBodyAccJerkMag_mean"              "tBodyAccJerkMag_std"              
[229] "tBodyAccJerkMag_mad"               "tBodyAccJerkMag_max"              
[231] "tBodyAccJerkMag_min"               "tBodyAccJerkMag_sma"              
[233] "tBodyAccJerkMag_energy"            "tBodyAccJerkMag_iqr"              
[235] "tBodyAccJerkMag_entropy"           "tBodyAccJerkMag_arCoeff"          
[237] "tBodyAccJerkMag_arCoeff.1"         "tBodyAccJerkMag_arCoeff.2"        
[239] "tBodyAccJerkMag_arCoeff.3"         "tBodyGyroMag_mean"                
[241] "tBodyGyroMag_std"                  "tBodyGyroMag_mad"                 
[243] "tBodyGyroMag_max"                  "tBodyGyroMag_min"                 
[245] "tBodyGyroMag_sma"                  "tBodyGyroMag_energy"              
[247] "tBodyGyroMag_iqr"                  "tBodyGyroMag_entropy"             
[249] "tBodyGyroMag_arCoeff"              "tBodyGyroMag_arCoeff.1"           
[251] "tBodyGyroMag_arCoeff.2"            "tBodyGyroMag_arCoeff.3"           
[253] "tBodyGyroJerkMag_mean"             "tBodyGyroJerkMag_std"             
[255] "tBodyGyroJerkMag_mad"              "tBodyGyroJerkMag_max"             
[257] "tBodyGyroJerkMag_min"              "tBodyGyroJerkMag_sma"             
[259] "tBodyGyroJerkMag_energy"           "tBodyGyroJerkMag_iqr"             
[261] "tBodyGyroJerkMag_entropy"          "tBodyGyroJerkMag_arCoeff"         
[263] "tBodyGyroJerkMag_arCoeff.1"        "tBodyGyroJerkMag_arCoeff.2"       
[265] "tBodyGyroJerkMag_arCoeff.3"        "fBodyAcc_mean_X"                  
[267] "fBodyAcc_mean_Y"                   "fBodyAcc_mean_Z"                  
[269] "fBodyAcc_std_X"                    "fBodyAcc_std_Y"                   
[271] "fBodyAcc_std_Z"                    "fBodyAcc_mad_X"                   
[273] "fBodyAcc_mad_Y"                    "fBodyAcc_mad_Z"                   
[275] "fBodyAcc_max_X"                    "fBodyAcc_max_Y"                   
[277] "fBodyAcc_max_Z"                    "fBodyAcc_min_X"                   
[279] "fBodyAcc_min_Y"                    "fBodyAcc_min_Z"                   
[281] "fBodyAcc_sma"                      "fBodyAcc_energy_X"                
[283] "fBodyAcc_energy_Y"                 "fBodyAcc_energy_Z"                
[285] "fBodyAcc_iqr_X"                    "fBodyAcc_iqr_Y"                   
[287] "fBodyAcc_iqr_Z"                    "fBodyAcc_entropy_X"               
[289] "fBodyAcc_entropy_Y"                "fBodyAcc_entropy_Z"               
[291] "fBodyAcc_maxInds_X"                "fBodyAcc_maxInds_Y"               
[293] "fBodyAcc_maxInds_Z"                "fBodyAcc_meanFreq_X"              
[295] "fBodyAcc_meanFreq_Y"               "fBodyAcc_meanFreq_Z"              
[297] "fBodyAcc_skewness_X"               "fBodyAcc_kurtosis_X"              
[299] "fBodyAcc_skewness_Y"               "fBodyAcc_kurtosis_Y"              
[301] "fBodyAcc_skewness_Z"               "fBodyAcc_kurtosis_Z"              
[303] "fBodyAcc_bandsEnergy_"             "fBodyAcc_bandsEnergy_.1"          
[305] "fBodyAcc_bandsEnergy_.2"           "fBodyAcc_bandsEnergy_.3"          
[307] "fBodyAcc_bandsEnergy_.4"           "fBodyAcc_bandsEnergy_.5"          
[309] "fBodyAcc_bandsEnergy_.6"           "fBodyAcc_bandsEnergy_.7"          
[311] "fBodyAcc_bandsEnergy_.8"           "fBodyAcc_bandsEnergy_.9"          
[313] "fBodyAcc_bandsEnergy_.10"          "fBodyAcc_bandsEnergy_.11"         
[315] "fBodyAcc_bandsEnergy_.12"          "fBodyAcc_bandsEnergy_.13"         
[317] "fBodyAcc_bandsEnergy_.14"          "fBodyAcc_bandsEnergy_.15"         
[319] "fBodyAcc_bandsEnergy_.16"          "fBodyAcc_bandsEnergy_.17"         
[321] "fBodyAcc_bandsEnergy_.18"          "fBodyAcc_bandsEnergy_.19"         
[323] "fBodyAcc_bandsEnergy_.20"          "fBodyAcc_bandsEnergy_.21"         
[325] "fBodyAcc_bandsEnergy_.22"          "fBodyAcc_bandsEnergy_.23"         
[327] "fBodyAcc_bandsEnergy_.24"          "fBodyAcc_bandsEnergy_.25"         
[329] "fBodyAcc_bandsEnergy_.26"          "fBodyAcc_bandsEnergy_.27"         
[331] "fBodyAcc_bandsEnergy_.28"          "fBodyAcc_bandsEnergy_.29"         
[333] "fBodyAcc_bandsEnergy_.30"          "fBodyAcc_bandsEnergy_.31"         
[335] "fBodyAcc_bandsEnergy_.32"          "fBodyAcc_bandsEnergy_.33"         
[337] "fBodyAcc_bandsEnergy_.34"          "fBodyAcc_bandsEnergy_.35"         
[339] "fBodyAcc_bandsEnergy_.36"          "fBodyAcc_bandsEnergy_.37"         
[341] "fBodyAcc_bandsEnergy_.38"          "fBodyAcc_bandsEnergy_.39"         
[343] "fBodyAcc_bandsEnergy_.40"          "fBodyAcc_bandsEnergy_.41"         
[345] "fBodyAccJerk_mean_X"               "fBodyAccJerk_mean_Y"              
[347] "fBodyAccJerk_mean_Z"               "fBodyAccJerk_std_X"               
[349] "fBodyAccJerk_std_Y"                "fBodyAccJerk_std_Z"               
[351] "fBodyAccJerk_mad_X"                "fBodyAccJerk_mad_Y"               
[353] "fBodyAccJerk_mad_Z"                "fBodyAccJerk_max_X"               
[355] "fBodyAccJerk_max_Y"                "fBodyAccJerk_max_Z"               
[357] "fBodyAccJerk_min_X"                "fBodyAccJerk_min_Y"               
[359] "fBodyAccJerk_min_Z"                "fBodyAccJerk_sma"                 
[361] "fBodyAccJerk_energy_X"             "fBodyAccJerk_energy_Y"            
[363] "fBodyAccJerk_energy_Z"             "fBodyAccJerk_iqr_X"               
[365] "fBodyAccJerk_iqr_Y"                "fBodyAccJerk_iqr_Z"               
[367] "fBodyAccJerk_entropy_X"            "fBodyAccJerk_entropy_Y"           
[369] "fBodyAccJerk_entropy_Z"            "fBodyAccJerk_maxInds_X"           
[371] "fBodyAccJerk_maxInds_Y"            "fBodyAccJerk_maxInds_Z"           
[373] "fBodyAccJerk_meanFreq_X"           "fBodyAccJerk_meanFreq_Y"          
[375] "fBodyAccJerk_meanFreq_Z"           "fBodyAccJerk_skewness_X"          
[377] "fBodyAccJerk_kurtosis_X"           "fBodyAccJerk_skewness_Y"          
[379] "fBodyAccJerk_kurtosis_Y"           "fBodyAccJerk_skewness_Z"          
[381] "fBodyAccJerk_kurtosis_Z"           "fBodyAccJerk_bandsEnergy_"        
[383] "fBodyAccJerk_bandsEnergy_.1"       "fBodyAccJerk_bandsEnergy_.2"      
[385] "fBodyAccJerk_bandsEnergy_.3"       "fBodyAccJerk_bandsEnergy_.4"      
[387] "fBodyAccJerk_bandsEnergy_.5"       "fBodyAccJerk_bandsEnergy_.6"      
[389] "fBodyAccJerk_bandsEnergy_.7"       "fBodyAccJerk_bandsEnergy_.8"      
[391] "fBodyAccJerk_bandsEnergy_.9"       "fBodyAccJerk_bandsEnergy_.10"     
[393] "fBodyAccJerk_bandsEnergy_.11"      "fBodyAccJerk_bandsEnergy_.12"     
[395] "fBodyAccJerk_bandsEnergy_.13"      "fBodyAccJerk_bandsEnergy_.14"     
[397] "fBodyAccJerk_bandsEnergy_.15"      "fBodyAccJerk_bandsEnergy_.16"     
[399] "fBodyAccJerk_bandsEnergy_.17"      "fBodyAccJerk_bandsEnergy_.18"     
[401] "fBodyAccJerk_bandsEnergy_.19"      "fBodyAccJerk_bandsEnergy_.20"     
[403] "fBodyAccJerk_bandsEnergy_.21"      "fBodyAccJerk_bandsEnergy_.22"     
[405] "fBodyAccJerk_bandsEnergy_.23"      "fBodyAccJerk_bandsEnergy_.24"     
[407] "fBodyAccJerk_bandsEnergy_.25"      "fBodyAccJerk_bandsEnergy_.26"     
[409] "fBodyAccJerk_bandsEnergy_.27"      "fBodyAccJerk_bandsEnergy_.28"     
[411] "fBodyAccJerk_bandsEnergy_.29"      "fBodyAccJerk_bandsEnergy_.30"     
[413] "fBodyAccJerk_bandsEnergy_.31"      "fBodyAccJerk_bandsEnergy_.32"     
[415] "fBodyAccJerk_bandsEnergy_.33"      "fBodyAccJerk_bandsEnergy_.34"     
[417] "fBodyAccJerk_bandsEnergy_.35"      "fBodyAccJerk_bandsEnergy_.36"     
[419] "fBodyAccJerk_bandsEnergy_.37"      "fBodyAccJerk_bandsEnergy_.38"     
[421] "fBodyAccJerk_bandsEnergy_.39"      "fBodyAccJerk_bandsEnergy_.40"     
[423] "fBodyAccJerk_bandsEnergy_.41"      "fBodyGyro_mean_X"                 
[425] "fBodyGyro_mean_Y"                  "fBodyGyro_mean_Z"                 
[427] "fBodyGyro_std_X"                   "fBodyGyro_std_Y"                  
[429] "fBodyGyro_std_Z"                   "fBodyGyro_mad_X"                  
[431] "fBodyGyro_mad_Y"                   "fBodyGyro_mad_Z"                  
[433] "fBodyGyro_max_X"                   "fBodyGyro_max_Y"                  
[435] "fBodyGyro_max_Z"                   "fBodyGyro_min_X"                  
[437] "fBodyGyro_min_Y"                   "fBodyGyro_min_Z"                  
[439] "fBodyGyro_sma"                     "fBodyGyro_energy_X"               
[441] "fBodyGyro_energy_Y"                "fBodyGyro_energy_Z"               
[443] "fBodyGyro_iqr_X"                   "fBodyGyro_iqr_Y"                  
[445] "fBodyGyro_iqr_Z"                   "fBodyGyro_entropy_X"              
[447] "fBodyGyro_entropy_Y"               "fBodyGyro_entropy_Z"              
[449] "fBodyGyro_maxInds_X"               "fBodyGyro_maxInds_Y"              
[451] "fBodyGyro_maxInds_Z"               "fBodyGyro_meanFreq_X"             
[453] "fBodyGyro_meanFreq_Y"              "fBodyGyro_meanFreq_Z"             
[455] "fBodyGyro_skewness_X"              "fBodyGyro_kurtosis_X"             
[457] "fBodyGyro_skewness_Y"              "fBodyGyro_kurtosis_Y"             
[459] "fBodyGyro_skewness_Z"              "fBodyGyro_kurtosis_Z"             
[461] "fBodyGyro_bandsEnergy_"            "fBodyGyro_bandsEnergy_.1"         
[463] "fBodyGyro_bandsEnergy_.2"          "fBodyGyro_bandsEnergy_.3"         
[465] "fBodyGyro_bandsEnergy_.4"          "fBodyGyro_bandsEnergy_.5"         
[467] "fBodyGyro_bandsEnergy_.6"          "fBodyGyro_bandsEnergy_.7"         
[469] "fBodyGyro_bandsEnergy_.8"          "fBodyGyro_bandsEnergy_.9"         
[471] "fBodyGyro_bandsEnergy_.10"         "fBodyGyro_bandsEnergy_.11"        
[473] "fBodyGyro_bandsEnergy_.12"         "fBodyGyro_bandsEnergy_.13"        
[475] "fBodyGyro_bandsEnergy_.14"         "fBodyGyro_bandsEnergy_.15"        
[477] "fBodyGyro_bandsEnergy_.16"         "fBodyGyro_bandsEnergy_.17"        
[479] "fBodyGyro_bandsEnergy_.18"         "fBodyGyro_bandsEnergy_.19"        
[481] "fBodyGyro_bandsEnergy_.20"         "fBodyGyro_bandsEnergy_.21"        
[483] "fBodyGyro_bandsEnergy_.22"         "fBodyGyro_bandsEnergy_.23"        
[485] "fBodyGyro_bandsEnergy_.24"         "fBodyGyro_bandsEnergy_.25"        
[487] "fBodyGyro_bandsEnergy_.26"         "fBodyGyro_bandsEnergy_.27"        
[489] "fBodyGyro_bandsEnergy_.28"         "fBodyGyro_bandsEnergy_.29"        
[491] "fBodyGyro_bandsEnergy_.30"         "fBodyGyro_bandsEnergy_.31"        
[493] "fBodyGyro_bandsEnergy_.32"         "fBodyGyro_bandsEnergy_.33"        
[495] "fBodyGyro_bandsEnergy_.34"         "fBodyGyro_bandsEnergy_.35"        
[497] "fBodyGyro_bandsEnergy_.36"         "fBodyGyro_bandsEnergy_.37"        
[499] "fBodyGyro_bandsEnergy_.38"         "fBodyGyro_bandsEnergy_.39"        
[501] "fBodyGyro_bandsEnergy_.40"         "fBodyGyro_bandsEnergy_.41"        
[503] "fBodyAccMag_mean"                  "fBodyAccMag_std"                  
[505] "fBodyAccMag_mad"                   "fBodyAccMag_max"                  
[507] "fBodyAccMag_min"                   "fBodyAccMag_sma"                  
[509] "fBodyAccMag_energy"                "fBodyAccMag_iqr"                  
[511] "fBodyAccMag_entropy"               "fBodyAccMag_maxInds"              
[513] "fBodyAccMag_meanFreq"              "fBodyAccMag_skewness"             
[515] "fBodyAccMag_kurtosis"              "fBodyBodyAccJerkMag_mean"         
[517] "fBodyBodyAccJerkMag_std"           "fBodyBodyAccJerkMag_mad"          
[519] "fBodyBodyAccJerkMag_max"           "fBodyBodyAccJerkMag_min"          
[521] "fBodyBodyAccJerkMag_sma"           "fBodyBodyAccJerkMag_energy"       
[523] "fBodyBodyAccJerkMag_iqr"           "fBodyBodyAccJerkMag_entropy"      
[525] "fBodyBodyAccJerkMag_maxInds"       "fBodyBodyAccJerkMag_meanFreq"     
[527] "fBodyBodyAccJerkMag_skewness"      "fBodyBodyAccJerkMag_kurtosis"     
[529] "fBodyBodyGyroMag_mean"             "fBodyBodyGyroMag_std"             
[531] "fBodyBodyGyroMag_mad"              "fBodyBodyGyroMag_max"             
[533] "fBodyBodyGyroMag_min"              "fBodyBodyGyroMag_sma"             
[535] "fBodyBodyGyroMag_energy"           "fBodyBodyGyroMag_iqr"             
[537] "fBodyBodyGyroMag_entropy"          "fBodyBodyGyroMag_maxInds"         
[539] "fBodyBodyGyroMag_meanFreq"         "fBodyBodyGyroMag_skewness"        
[541] "fBodyBodyGyroMag_kurtosis"         "fBodyBodyGyroJerkMag_mean"        
[543] "fBodyBodyGyroJerkMag_std"          "fBodyBodyGyroJerkMag_mad"         
[545] "fBodyBodyGyroJerkMag_max"          "fBodyBodyGyroJerkMag_min"         
[547] "fBodyBodyGyroJerkMag_sma"          "fBodyBodyGyroJerkMag_energy"      
[549] "fBodyBodyGyroJerkMag_iqr"          "fBodyBodyGyroJerkMag_entropy"     
[551] "fBodyBodyGyroJerkMag_maxInds"      "fBodyBodyGyroJerkMag_meanFreq"    
[553] "fBodyBodyGyroJerkMag_skewness"     "fBodyBodyGyroJerkMag_kurtosis"    
[555] "angletBodyAccMeangravity"          "angletBodyAccJerkMeangravityMean" 
[557] "angletBodyGyroMeangravityMean"     "angletBodyGyroJerkMeangravityMean"
[559] "angleXgravityMean"                 "angleYgravityMean"                
[561] "angleZgravityMean"                 "Activity"                         
[563] "Subject"                          


> names(mergeMeanStd)
 [1] "tBodyAcc_mean_X"                   "tBodyAcc_mean_Y"                  
 [3] "tBodyAcc_mean_Z"                   "tBodyAcc_std_X"                   
 [5] "tBodyAcc_std_Y"                    "tBodyAcc_std_Z"                   
 [7] "tGravityAcc_mean_X"                "tGravityAcc_mean_Y"               
 [9] "tGravityAcc_mean_Z"                "tGravityAcc_std_X"                
[11] "tGravityAcc_std_Y"                 "tGravityAcc_std_Z"                
[13] "tBodyAccJerk_mean_X"               "tBodyAccJerk_mean_Y"              
[15] "tBodyAccJerk_mean_Z"               "tBodyAccJerk_std_X"               
[17] "tBodyAccJerk_std_Y"                "tBodyAccJerk_std_Z"               
[19] "tBodyGyro_mean_X"                  "tBodyGyro_mean_Y"                 
[21] "tBodyGyro_mean_Z"                  "tBodyGyro_std_X"                  
[23] "tBodyGyro_std_Y"                   "tBodyGyro_std_Z"                  
[25] "tBodyGyroJerk_mean_X"              "tBodyGyroJerk_mean_Y"             
[27] "tBodyGyroJerk_mean_Z"              "tBodyGyroJerk_std_X"              
[29] "tBodyGyroJerk_std_Y"               "tBodyGyroJerk_std_Z"              
[31] "tBodyAccMag_mean"                  "tBodyAccMag_std"                  
[33] "tGravityAccMag_mean"               "tGravityAccMag_std"               
[35] "tBodyAccJerkMag_mean"              "tBodyAccJerkMag_std"              
[37] "tBodyGyroMag_mean"                 "tBodyGyroMag_std"                 
[39] "tBodyGyroJerkMag_mean"             "tBodyGyroJerkMag_std"             
[41] "fBodyAcc_mean_X"                   "fBodyAcc_mean_Y"                  
[43] "fBodyAcc_mean_Z"                   "fBodyAcc_std_X"                   
[45] "fBodyAcc_std_Y"                    "fBodyAcc_std_Z"                   
[47] "fBodyAcc_meanFreq_X"               "fBodyAcc_meanFreq_Y"              
[49] "fBodyAcc_meanFreq_Z"               "fBodyAccJerk_mean_X"              
[51] "fBodyAccJerk_mean_Y"               "fBodyAccJerk_mean_Z"              
[53] "fBodyAccJerk_std_X"                "fBodyAccJerk_std_Y"               
[55] "fBodyAccJerk_std_Z"                "fBodyAccJerk_meanFreq_X"          
[57] "fBodyAccJerk_meanFreq_Y"           "fBodyAccJerk_meanFreq_Z"          
[59] "fBodyGyro_mean_X"                  "fBodyGyro_mean_Y"                 
[61] "fBodyGyro_mean_Z"                  "fBodyGyro_std_X"                  
[63] "fBodyGyro_std_Y"                   "fBodyGyro_std_Z"                  
[65] "fBodyGyro_meanFreq_X"              "fBodyGyro_meanFreq_Y"             
[67] "fBodyGyro_meanFreq_Z"              "fBodyAccMag_mean"                 
[69] "fBodyAccMag_std"                   "fBodyAccMag_meanFreq"             
[71] "fBodyBodyAccJerkMag_mean"          "fBodyBodyAccJerkMag_std"          
[73] "fBodyBodyAccJerkMag_meanFreq"      "fBodyBodyGyroMag_mean"            
[75] "fBodyBodyGyroMag_std"              "fBodyBodyGyroMag_meanFreq"        
[77] "fBodyBodyGyroJerkMag_mean"         "fBodyBodyGyroJerkMag_std"         
[79] "fBodyBodyGyroJerkMag_meanFreq"     "angletBodyAccMeangravity"         
[81] "angletBodyAccJerkMeangravityMean"  "angletBodyGyroMeangravityMean"    
[83] "angletBodyGyroJerkMeangravityMean" "angleXgravityMean"                
[85] "angleYgravityMean"                 "angleZgravityMean"                
[87] "Subject"                           "Activity" 
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
