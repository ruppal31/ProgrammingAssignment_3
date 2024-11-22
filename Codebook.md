# CodeBook for Tidy Dataset

This CodeBook describes the variables, data, and transformations performed to clean the original dataset for the Human Activity Recognition Using Smartphones project.

---

## Original Data
The original data comes from the UCI Machine Learning Repository and represents data collected from the accelerometers of Samsung Galaxy S smartphones. The dataset contains the following files:
- `features.txt`: Names of features for the measurements.
- `activity_labels.txt`: Activity labels with corresponding IDs.
- Training and test datasets (`X_train.txt`, `y_train.txt`, `subject_train.txt`, etc.).

---

## Variables in the Tidy Dataset

### Identifiers
- `Subject`: Identifier for the subject who performed the activity (ranges from 1 to 30).
- `Activity`: The activity performed. Values are:
  - `WALKING`
  - `WALKING_UPSTAIRS`
  - `WALKING_DOWNSTAIRS`
  - `SITTING`
  - `STANDING`
  - `LAYING`

### Measurements
The tidy dataset includes the average of each measurement variable for each subject and activity. The measurements are selected based on "mean()" or "std()" in the original feature names, transformed for clarity:
- **TimeDomain_Accelerometer_Mean_X**: Mean of time-domain body acceleration in the X direction.
- **TimeDomain_Accelerometer_STD_Y**: Standard deviation of time-domain body acceleration in the Y direction.
- **FrequencyDomain_Gyroscope_Magnitude_STD**: Standard deviation of frequency-domain body gyroscope magnitude.

(Additional variables follow the same naming convention for other measurements.)

---

## Transformations Performed
1. **Merge Datasets**: Combined training and test datasets.
2. **Extract Mean and STD**: Selected columns with "mean()" or "std()" in their names.
3. **Descriptive Activity Names**: Mapped activity IDs to their descriptive labels.
4. **Descriptive Variable Names**: Replaced abbreviations with full descriptions:
   - `t` → `TimeDomain`
   - `f` → `FrequencyDomain`
   - `Acc` → `Accelerometer`
   - `Gyro` → `Gyroscope`
   - `Mag` → `Magnitude`
   - `-mean()` → `_Mean`
   - `-std()` → `_STD`
5. **Tidy Dataset Creation**: Aggregated data to compute the average of each variable for each subject and activity.

---

## Units
All measurement variables are normalized and unitless.

---

## Summary
The resulting tidy dataset contains 180 rows (30 subjects × 6 activities) and 68 columns (2 identifiers + 66 measurements).
