# Cleaning-Data-Project
This submission modifies the UCI HAR Dataset (as described below)
The R script used to modify this dataset is:
### creates file directory ###
	if(!file.exists("./data")){dir.create("./data")}
### sets URL location  ###
	fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
### downloads the data ###
	download.file(fileUrl, destfile = "./data/galazy.zip")   
### unzips file into file directory ###
	unzip("./data/galazy.zip", exdir = "./data")    
### reads test data into a data frame ###
	testdf <- read.table("./data/UCI HAR Dataset/test/X_test.txt")  
### reads train data in a data frame ### 
	traindf <- read.table("./data/UCI HAR Dataset/train/X_train.txt")  
### merges the 2 data frames ### 
	galaxydf <- rbind(testdf, traindf)   
### selects only mean and std related columns into new data frame ###
	subgaldf <- subset(galaxydf, select = c(V1, V2, V3, V4, V5, V6, V41, V42, V43, V44, V45, V46, V81, V82, V83, V84, V85, V86, V121, V122, V123, 				V124, V125, V126, V161, V162, V163, V164, V165, V166, V201, V202, V214, V215, V227, V228, V240, V241, V253, V254, V266, V267, V268, V269, 		V270, V271, V294, V295, V296, V345, V346, V347, V348, V349, V350, V373, V374, V375, V424, V425, V426, V427, V428, V429, V452, V453, 				V454, V503, V504, V513, V516, V517, V526, V529, V530, V539, V542, V543, V552))  
### renames new data frame columns ###
 
	colnames(subgaldf) <- c("BodAccMnX", "BodAccMnY", "BodAccMnZ", "BodAccStdX", "BodAccStdY", "BodAccStdZ", "GravAccMnX", "GravAccMnY", 		"GravAccMnZ", "GravAccStdX",
                        "GravAccStdY", "GravAccStdZ", "BodAccJrkMnX", "BodAccJrkMnY", "BodAccJrkMnZ", "BodAccJrkStdX", "BodAccJrkStdY", "BodAccJrkStdZ", 		"BodGyroMnX", "BodGyroMnY", "BodGyroMnZ", 
                        "BodGyroStdX", "BodGyroSydY", "BodGyroStdZ", "BodGyJrkMnX", "BodGyJrkMnY", "BodGyJrkMnZ", "BodGyJrkStdX", "BodGyJrkStdY", 		"BodGyJrkStdZ", "BodAccMagMn", "BodAccMagStd", 
                        "GravAccMagMn", "GravAccMagStd", "BodAccJrkMagMn", "BodAccJrkMagStd", "BodGyMagMn", "BodGyMagStd", "BodGyJrkMagMn", 		"BodGyJrkMagStd", "fBodAccMnX", "fBodAccMnY", 
                        "fBodAccMnZ", "fBodAccStdX", "fBodAccStdY", "fBodAccStdZ", "fBodAccMnFreqX", "fBodAccMnFreqY", "fBodAccMnFreqZ", "fBodAccJrkMnX", 		"fBodAccJrkMnY", 
                        "fBodAccJrkMnZ", "fBodAccJrkStdX", "fBodAccJrkStdY", "fBodAccJrkStdZ", "fBodAccJrkMnFreqX", "fBodAccJrkMnFreqY", 		"fBodAccJrkMnFreqZ", "fBodGyroMnX", "fBodGyroMnY", "fBodGyroMnZ", 
                        "fBodGyroStdX", "fBodGyroStdY", "fBodGyroStdZ", "fBodGyroMnFreqX", "fBodGyroMnFreqY", "fBodGyroMnFreqZ", "fBodAccMagMn", 		"fBodAccMagStd", "fBodAccMagMnFreq", "fBodAccJrkMagMn",
                        "fBodAccJrkMagStd", "fBodAccJrkMagMnFreq", "fBodGyroMagMn", "fBodGyroMagStd", "fBodGyroMagMnFreq", "fBodGyroJrkMagMn", 		"fBodGyroJrkMagStd", "fBodGyroJrkMagMnFreq")    
### adds new row to top of data frame with mean of all rows in each column  ###
	subgalMeansdf <- rbind(colMeans(subgaldf, na.rm = TRUE), subgaldf)
### creates new data frame with only column names and mean of each column ###	
	MnStdMeans <- subgalMeansdf[1,]
### exports new data frame as a text file ###
	write.table(MnStdMeans, "./Getting and Cleaning/ProjectSubmission.txt", row.names = FALSE)




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

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
