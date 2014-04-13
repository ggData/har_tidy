# Data Dictionary -- Tidied HAR Data

This describes the variables included in  the tidied version of the dataset from the "[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)" found here:

_Citation_

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

----

**Field**: `subject` -- Identifies one of the 30 subjects who participated in the study  
**Data type**: Integer  
**Values**: 1-30


**Field**: `activity` -- Descriptive label for the Activity of Daily Living (ADL) that the subject was performing when this measurement was taken  
**Data type**: Character  
**Values**:  

        WALKING
        WALKING_UPSTAIRS
        WALKING_DOWNSTAIRS
        SITTING
        STANDING
        LAYING


**Field**: `variable` -- Names an index extracted from the measurements on a given subject performing a given activity. The measurements represent the means of tri-axial linear acceleration and angular velocity data from the accelerator and gyroscope of a smartphone worn at waist level by the subject. The full description of each index is to be found in the original dataset.  
**Data type**: Character  
**Values**:

        tBodyAcc-mean()-X
        tBodyAcc-mean()-Y
        tBodyAcc-mean()-Z
        tGravityAcc-mean()-X
        tGravityAcc-mean()-Y
        tGravityAcc-mean()-Z
        tBodyAccJerk-mean()-X
        tBodyAccJerk-mean()-Y
        tBodyAccJerk-mean()-Z
        tBodyGyro-mean()-X
        tBodyGyro-mean()-Y
        tBodyGyro-mean()-Z
        tBodyGyroJerk-mean()-X
        tBodyGyroJerk-mean()-Y
        tBodyGyroJerk-mean()-Z
        tBodyAccMag-mean()
        tGravityAccMag-mean()
        tBodyAccJerkMag-mean()
        tBodyGyroMag-mean()
        tBodyGyroJerkMag-mean()
        fBodyAcc-mean()-X
        fBodyAcc-mean()-Y
        fBodyAcc-mean()-Z
        fBodyAcc-meanFreq()-X
        fBodyAcc-meanFreq()-Y
        fBodyAcc-meanFreq()-Z
        fBodyAccJerk-mean()-X
        fBodyAccJerk-mean()-Y
        fBodyAccJerk-mean()-Z
        fBodyAccJerk-meanFreq()-X
        fBodyAccJerk-meanFreq()-Y
        fBodyAccJerk-meanFreq()-Z
        fBodyGyro-mean()-X
        fBodyGyro-mean()-Y
        fBodyGyro-mean()-Z
        fBodyGyro-meanFreq()-X
        fBodyGyro-meanFreq()-Y
        fBodyGyro-meanFreq()-Z
        fBodyAccMag-mean()
        fBodyAccMag-meanFreq()
        fBodyBodyAccJerkMag-mean()
        fBodyBodyAccJerkMag-meanFreq()
        fBodyBodyGyroMag-mean()
        fBodyBodyGyroMag-meanFreq()
        fBodyBodyGyroJerkMag-mean()
        fBodyBodyGyroJerkMag-meanFreq()


**Field**: `value` -- The numerical value of the mean of a set of observations of a given index, for a given subject, performing a given activity.  
**Data type**: Floating point numerical value.  
**Values**: All values have been normalized between -1 and 1.  

