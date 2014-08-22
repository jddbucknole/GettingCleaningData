Codebook
========

The data variables are all fairly intuitively names but they are listed below
* Subject: subject ID
* Activity: Activity performed (walking, walking upstairs, etc.)

Additionally, the following variables are included in the 561-length feature vector

# Time domain variables

* tBodyAccelerationMean[XYZ]
* tBodyAccelerationStandardDeviation[XYZ]
* tGravityAccelerationMean[XYZ]
* tGravityAccelerationStandardDeviation[XYZ]
* tBodyAccelerationJerkMean[XYZ]
* tBodyAccelerationJerkStandardDeviation[XYZ]
* tBodyGyroscopeMean[XYZ]
* tBodyGyroscopeStandardDeviation[XYZ]
* tBodyGyroscopeJerkMean[XYZ]
* tBodyGyroscopeJerkStandardDeviation[XYZ]
* tBodyAccelerationMagnitudeMean()
* tBodyAccelerationMagnitudeStandardDeviation()
* tGravityAccelerationMagnitudeMean()
* tGravityAccelerationMagnitudeStandardDeviation()
* tBodyAccelerationJerkMagnitudeMean()
* tBodyAccelerationJerkMagnitudeStandardDeviation()
* tBodyGyroscopeMagnitudeMean
* tBodyGyroscopeMagnitudeStandardDeviation
* tBodyGyroscopeJerkMagnitudeMean
* tBodyGyroscopeJerkMagnitudeStandardDeviation

#Frequency Domain variables

* fBodyAccelerationMean[XYZ]
* fBodyAccelerationStandardDeviation[XYZ]
* fBodyAccelerationJerkMean[XYZ]
* fBodyAccelerationJerkStandardDeviation[XYZ]
* fBodyGyroscopeMean[XYZ]
* fBodyGyroscopeStandardDeviation[XYZ]
* fBodyAccelerationMagnitudeMean
* fBodyAccelerationMagnitudeStandardDeviation
* fBodyAccelerationJerkMagnitudeMean
* fBodyAccelerationJerkMagnitudeStandardDeviation
* fBodyGyroscopeMagnitudeMean
* fBodyGyroscopeMagnitudeStandardDeviation
* fBodyGyroscopeJerkMagnitudeMean
* fBodyGyroscopeJerkMagnitudeStandardDeviation


#Angle variables

* angle(tBodyAccelerationMean,gravity)
* angle(tBodyAccelerationJerkMean),gravityMean)
* angle(tBodyGyroscopeMean,gravityMean)            
* angle(tBodyGyroscopeJerkMean,gravityMean)
* angle([XYZ],gravityMean)  


All variables are named specifically as the measurement taken ([XYZ] is simply an indicator of which axis the measurement is taken in).  Note that only Mean and StandardDeviation measurements are shown.  I didn't see the point of more clearly explicating the variable names as the variable title is EXACTLY what is being measured.