# Human Activity Recognition Using Smartphones - Tidy Dataset

This repository contains the scripts and files necessary to perform data cleaning and produce a tidy dataset for the Human Activity Recognition Using Smartphones project.

---

## Project Description

The original dataset was collected from the accelerometers of Samsung Galaxy S smartphones. The purpose of this project is to process and clean the data to create a tidy dataset containing the average of selected measurements for each activity and each subject.

### Files in the Repository

1. **`run_analysis.py`**: The main Python script that performs the following:
   - Merges training and test datasets.
   - Extracts mean and standard deviation measurements.
   - Replaces activity IDs with descriptive activity names.
   - Labels variables with descriptive names.
   - Creates a tidy dataset with averages for each variable by subject and activity.
   - Outputs the tidy dataset as `tidy_data.csv`.

2. **`CodeBook.md`**: A codebook describing the variables in the dataset, the transformations performed, and the units of measurement.

3. **`tidy_data.csv`**: The final output tidy dataset.

---

## How to Run the Analysis

1. Ensure you have Python installed along with the required libraries:
