# Code Book
After the execution of **run_analysis.R**, we obtain two dataframes: *LabeledData* and *SummarizedData*.

The variables corresponding to both are the same subset of the original ones contained in [features.txt](https://github.com/antclaudia/Samsung-Wearable-Computing/blob/master/features.txt), 
but in the case of *SummarizedData* the mean grouped by subject and activity has been computed.

The *SummarizedData* dataframe is written to the file **AverageBySubjectActivity.txt**.

The subset of variables corresponds to those that were means and standard deviations originally, keeping the same units and scale.

The names of the variables have been slightly modified to improve readability; dashes were changed by underscores, and parentheses were removed.

The *activity* variable has been labeled with the string corresponding to the activity as defined in [activity_labels.txt](https://github.com/antclaudia/Samsung-Wearable-Computing/blob/master/activity_labels.txt).

A variable named *indicator* takes the values "test" or "train" depending on whether the corresponding subject was selected for testing o training.

A detalied description of the variables can be found in [features_info.txt](https://github.com/antclaudia/Samsung-Wearable-Computing/blob/master/features_info.txt) as well as
in the [Original README.txt](https://github.com/antclaudia/Samsung-Wearable-Computing/blob/master/Original%20README.txt) file.

The new variable names and their corresponding original names can be found in the following table.

||oldName|newName|
|---|----|-------|
|1|tBodyAcc-mean()-X|tBodyAcc_mean_X|
|2|tBodyAcc-mean()-Y|tBodyAcc_mean_Y|
|3|tBodyAcc-mean()-Z|tBodyAcc_mean_Z|
|4|tGravityAcc-mean()-X|tGravityAcc_mean_X|
|5|tGravityAcc-mean()-Y|tGravityAcc_mean_Y|
|6|tGravityAcc-mean()-Z|tGravityAcc_mean_Z|
|7|tBodyAccJerk-mean()-X|tBodyAccJerk_mean_X|
|8|tBodyAccJerk-mean()-Y|tBodyAccJerk_mean_Y|
|9|tBodyAccJerk-mean()-Z|tBodyAccJerk_mean_Z|
|10|tBodyGyro-mean()-X|tBodyGyro_mean_X|
|11|tBodyGyro-mean()-Y|tBodyGyro_mean_Y|
|12|tBodyGyro-mean()-Z|tBodyGyro_mean_Z|
|13|tBodyGyroJerk-mean()-X|tBodyGyroJerk_mean_X|
|14|tBodyGyroJerk-mean()-Y|tBodyGyroJerk_mean_Y|
|15|tBodyGyroJerk-mean()-Z|tBodyGyroJerk_mean_Z|
|16|tBodyAccMag-mean()|tBodyAccMag_mean|
|17|tGravityAccMag-mean()|tGravityAccMag_mean|
|18|tBodyAccJerkMag-mean()|tBodyAccJerkMag_mean|
|19|tBodyGyroMag-mean()|tBodyGyroMag_mean|
|20|tBodyGyroJerkMag-mean()|tBodyGyroJerkMag_mean|
|21|fBodyAcc-mean()-X|fBodyAcc_mean_X|
|22|fBodyAcc-mean()-Y|fBodyAcc_mean_Y|
|23|fBodyAcc-mean()-Z|fBodyAcc_mean_Z|
|24|fBodyAcc-meanFreq()-X|fBodyAcc_meanFreq_X|
|25|fBodyAcc-meanFreq()-Y|fBodyAcc_meanFreq_Y|
|26|fBodyAcc-meanFreq()-Z|fBodyAcc_meanFreq_Z|
|27|fBodyAccJerk-mean()-X|fBodyAccJerk_mean_X|
|28|fBodyAccJerk-mean()-Y|fBodyAccJerk_mean_Y|
|29|fBodyAccJerk-mean()-Z|fBodyAccJerk_mean_Z|
|30|fBodyAccJerk-meanFreq()-X|fBodyAccJerk_meanFreq_X|
|31|fBodyAccJerk-meanFreq()-Y|fBodyAccJerk_meanFreq_Y|
|32|fBodyAccJerk-meanFreq()-Z|fBodyAccJerk_meanFreq_Z|
|33|fBodyGyro-mean()-X|fBodyGyro_mean_X|
|34|fBodyGyro-mean()-Y|fBodyGyro_mean_Y|
|35|fBodyGyro-mean()-Z|fBodyGyro_mean_Z|
|36|fBodyGyro-meanFreq()-X|fBodyGyro_meanFreq_X|
|37|fBodyGyro-meanFreq()-Y|fBodyGyro_meanFreq_Y|
|38|fBodyGyro-meanFreq()-Z|fBodyGyro_meanFreq_Z|
|39|fBodyAccMag-mean()|fBodyAccMag_mean|
|40|fBodyAccMag-meanFreq()|fBodyAccMag_meanFreq|
|41|fBodyBodyAccJerkMag-mean()|fBodyBodyAccJerkMag_mean|
|42|fBodyBodyAccJerkMag-meanFreq()|fBodyBodyAccJerkMag_meanFreq|
|43|fBodyBodyGyroMag-mean()|fBodyBodyGyroMag_mean|
|44|fBodyBodyGyroMag-meanFreq()|fBodyBodyGyroMag_meanFreq|
|45|fBodyBodyGyroJerkMag-mean()|fBodyBodyGyroJerkMag_mean|
|46|fBodyBodyGyroJerkMag-meanFreq()|fBodyBodyGyroJerkMag_meanFreq|
|47|tBodyAcc-std()-X|tBodyAcc_std_X|
|48|tBodyAcc-std()-Y|tBodyAcc_std_Y|
|49|tBodyAcc-std()-Z|tBodyAcc_std_Z|
|50|tGravityAcc-std()-X|tGravityAcc_std_X|
|51|tGravityAcc-std()-Y|tGravityAcc_std_Y|
|52|tGravityAcc-std()-Z|tGravityAcc_std_Z|
|53|tBodyAccJerk-std()-X|tBodyAccJerk_std_X|
|54|tBodyAccJerk-std()-Y|tBodyAccJerk_std_Y|
|55|tBodyAccJerk-std()-Z|tBodyAccJerk_std_Z|
|56|tBodyGyro-std()-X|tBodyGyro_std_X|
|57|tBodyGyro-std()-Y|tBodyGyro_std_Y|
|58|tBodyGyro-std()-Z|tBodyGyro_std_Z|
|59|tBodyGyroJerk-std()-X|tBodyGyroJerk_std_X|
|60|tBodyGyroJerk-std()-Y|tBodyGyroJerk_std_Y|
|61|tBodyGyroJerk-std()-Z|tBodyGyroJerk_std_Z|
|62|tBodyAccMag-std()|tBodyAccMag_std|
|63|tGravityAccMag-std()|tGravityAccMag_std|
|64|tBodyAccJerkMag-std()|tBodyAccJerkMag_std|
|65|tBodyGyroMag-std()|tBodyGyroMag_std|
|66|tBodyGyroJerkMag-std()|tBodyGyroJerkMag_std|
|67|fBodyAcc-std()-X|fBodyAcc_std_X|
|68|fBodyAcc-std()-Y|fBodyAcc_std_Y|
|69|fBodyAcc-std()-Z|fBodyAcc_std_Z|
|70|fBodyAccJerk-std()-X|fBodyAccJerk_std_X|
|71|fBodyAccJerk-std()-Y|fBodyAccJerk_std_Y|
|72|fBodyAccJerk-std()-Z|fBodyAccJerk_std_Z|
|73|fBodyGyro-std()-X|fBodyGyro_std_X|
|74|fBodyGyro-std()-Y|fBodyGyro_std_Y|
|75|fBodyGyro-std()-Z|fBodyGyro_std_Z|
|76|fBodyAccMag-std()|fBodyAccMag_std|
|77|fBodyBodyAccJerkMag-std()|fBodyBodyAccJerkMag_std|
|78|fBodyBodyGyroMag-std()|fBodyBodyGyroMag_std|
|79|fBodyBodyGyroJerkMag-std()|fBodyBodyGyroJerkMag_std
