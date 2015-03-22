if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/galazy.zip")
unzip("./data/galazy.zip", exdir = "./data")
testdf <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
traindf <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
galaxydf <- rbind(testdf, traindf)
subgaldf <- subset(galaxydf, select = c(V1, V2, V3, V4, V5, V6, V41, V42, V43, V44, V45, V46, V81, V82, V83, V84, V85, V86, V121, V122, V123, V124, V125, V126, V161, V162, V163, V164, V165, V166, V201, V202, V214, V215, V227, V228, V240, V241, V253, V254, V266, V267, V268, V269, V270, V271, V294, V295, V296, V345, V346, V347, V348, V349, V350, V373, V374, V375, V424, V425, V426, V427, V428, V429, V452, V453, V454, V503, V504, V513, V516, V517, V526, V529, V530, V539, V542, V543, V552))
colnames(subgaldf) <- c("BodAccMnX", "BodAccMnY", "BodAccMnZ", "BodAccStdX", "BodAccStdY", "BodAccStdZ", "GravAccMnX", "GravAccMnY", "GravAccMnZ", "GravAccStdX",
                        "GravAccStdY", "GravAccStdZ", "BodAccJrkMnX", "BodAccJrkMnY", "BodAccJrkMnZ", "BodAccJrkStdX", "BodAccJrkStdY", "BodAccJrkStdZ", "BodGyroMnX", "BodGyroMnY", "BodGyroMnZ", 
                        "BodGyroStdX", "BodGyroSydY", "BodGyroStdZ", "BodGyJrkMnX", "BodGyJrkMnY", "BodGyJrkMnZ", "BodGyJrkStdX", "BodGyJrkStdY", "BodGyJrkStdZ", "BodAccMagMn", "BodAccMagStd", 
                        "GravAccMagMn", "GravAccMagStd", "BodAccJrkMagMn", "BodAccJrkMagStd", "BodGyMagMn", "BodGyMagStd", "BodGyJrkMagMn", "BodGyJrkMagStd", "fBodAccMnX", "fBodAccMnY", 
                        "fBodAccMnZ", "fBodAccStdX", "fBodAccStdY", "fBodAccStdZ", "fBodAccMnFreqX", "fBodAccMnFreqY", "fBodAccMnFreqZ", "fBodAccJrkMnX", "fBodAccJrkMnY", 
                        "fBodAccJrkMnZ", "fBodAccJrkStdX", "fBodAccJrkStdY", "fBodAccJrkStdZ", "fBodAccJrkMnFreqX", "fBodAccJrkMnFreqY", "fBodAccJrkMnFreqZ", "fBodGyroMnX", "fBodGyroMnY", "fBodGyroMnZ", 
                        "fBodGyroStdX", "fBodGyroStdY", "fBodGyroStdZ", "fBodGyroMnFreqX", "fBodGyroMnFreqY", "fBodGyroMnFreqZ", "fBodAccMagMn", "fBodAccMagStd", "fBodAccMagMnFreq", "fBodAccJrkMagMn",
                        "fBodAccJrkMagStd", "fBodAccJrkMagMnFreq", "fBodGyroMagMn", "fBodGyroMagStd", "fBodGyroMagMnFreq", "fBodGyroJrkMagMn", "fBodGyroJrkMagStd", "fBodGyroJrkMagMnFreq")

subgalMeansdf <- rbind(colMeans(subgaldf, na.rm = TRUE), subgaldf)
MnStdMeans <- subgalMeansdf[1,]
write.table(MnStdMeans, "./Getting and Cleaning/ProjectSubmission.txt", row.names = FALSE)
