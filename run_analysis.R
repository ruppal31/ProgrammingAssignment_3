# Load necessary libraries
library(dplyr)

# Step 1: Download and unzip the dataset
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file_url, destfile = "dataset.zip")
unzip("dataset.zip")

# Step 2: Load the datasets
# Load activity labels and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityID", "Activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("FeatureID", "FeatureName"))

# Load training data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "ActivityID")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")

# Load test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "ActivityID")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")

# Step 3: Merge the training and test sets to create one dataset
# Combine training and test datasets
X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Assign column names to X_data
colnames(X_data) <- features$FeatureName

# Combine all data into one dataset
combined_data <- cbind(subject_data, y_data, X_data)

# Step 4: Extract measurements on mean and standard deviation
# Identify columns with mean() or std()
selected_columns <- grepl("mean\\(\\)|std\\(\\)", features$FeatureName)
selected_data <- combined_data[, c(TRUE, TRUE, selected_columns)]  # Keep Subject, ActivityID, and selected columns

# Step 5: Use descriptive activity names
# Merge with activity labels to replace ActivityID with descriptive activity names
selected_data <- merge(selected_data, activity_labels, by = "ActivityID")
selected_data <- selected_data %>% select(-ActivityID)  # Remove ActivityID column

# Step 6: Appropriately label the dataset with descriptive variable names
names(selected_data) <- gsub("^t", "Time", names(selected_data))
names(selected_data) <- gsub("^f", "Frequency", names(selected_data))
names(selected_data) <- gsub("Acc", "Accelerometer", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyroscope", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitude", names(selected_data))
names(selected_data) <- gsub("BodyBody", "Body", names(selected_data))
names(selected_data) <- gsub("-mean\\(\\)", "Mean", names(selected_data))
names(selected_data) <- gsub("-std\\(\\)", "STD", names(selected_data))
names(selected_data) <- gsub("-", "_", names(selected_data))

# Step 7: Create a second, independent tidy dataset
# Group by Subject and Activity, then calculate the mean for each variable
tidy_data <- selected_data %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)

# Step 8: Write the tidy dataset to a file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
