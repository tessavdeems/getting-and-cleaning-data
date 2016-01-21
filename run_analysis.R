# Load train datasets
x_train <- read.table("UCI HAR Dataset\\train\\X_train.txt")
y_train <- read.table("UCI HAR Dataset\\train\\y_train.txt")
subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt")

# Load test datasets

x_test <- read.table("UCI HAR Dataset\\test\\X_test.txt")
y_test <- read.table("UCI HAR Dataset\\test\\y_test.txt")
subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt")


# 1. Merges the training and test sets to create one data set 

x_data <- rbind(x_train, x_test) 
y_data <- rbind(y_train, y_test) 
subject_data <- rbind(subject_train, subject_test) 

rm(x_train, y_train, subject_train, x_test, y_test, subject_test)

data <- cbind(subject_data, y_data, x_data)
colnames(data)[1] <- "subject"
colnames(data)[2] <- "y"

rm(x_data, y_data, subject_data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement (mean/std)

features <- read.table("UCI HAR Dataset\\features.txt",stringsAsFactors = FALSE)
features_wanted <- grepl("mean\\(\\)|std\\(\\)",features$V2)

data <- data[,c(TRUE,TRUE,features_wanted)]

# 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("UCI HAR Dataset\\activity_labels.txt",stringsAsFactors = FALSE)
names(activities) <- c("y","activity")
data <- merge(data,activities,by=c("y"),all=TRUE)

# 4. Appropriately labels the data set with descriptive variable names

colnames(data) <- c("y","subject",features[features_wanted,2],"activity")
data <- tbl_df(data)
data <- select(data, -y)
data <- select(data, subject, activity, 2:67)

# 5. From the data set in step 4, create a second, independent tidy data set with the average 
# of each variable for each activity and each subject

data_average <- data
data_average <- group_by(data_average, activity, subject) 
data_average <- summarize_each(data_average, funs(mean))

data_average
