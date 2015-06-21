# CodeBook
This is a code book for Coursera _Getting and cleaning data_ course project.

## Data set
Resulting data set contains means of all relevent statistics
(mean and standard deviation) of readings from wearable devices.
The means are groupped by subject (the person performing task)
and label (kind of task performed). Variables:

- label is one of the tasks that was performed by subject, possible values (factor):
  - WALKING
  - WALKING\_UPSTAIRS
  - WALKING\_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
- subject is the identifier of person performing the activities, it's an integer
  between 1 and 30.

The names of remaining variables correspond to the variables
representing interesting meter reading statistics (mean, stddev).
- tBodyAcc.mean...X
- tBodyAcc.mean...Y
- tBodyAcc.mean...Z
- tBodyAcc.std...X
- tBodyAcc.std...Y
- tBodyAcc.std...Z
- tGravityAcc.mean...X
- tGravityAcc.mean...Y
- tGravityAcc.mean...Z
- tGravityAcc.std...X
- tGravityAcc.std...Y
- tGravityAcc.std...Z
- tBodyAccJerk.mean...X
- tBodyAccJerk.mean...Y
- tBodyAccJerk.mean...Z
- tBodyAccJerk.std...X
- tBodyAccJerk.std...Y
- tBodyAccJerk.std...Z
- tBodyGyro.mean...X
- tBodyGyro.mean...Y
- tBodyGyro.mean...Z
- tBodyGyro.std...X
- tBodyGyro.std...Y
- tBodyGyro.std...Z
- tBodyGyroJerk.mean...X
- tBodyGyroJerk.mean...Y
- tBodyGyroJerk.mean...Z
- tBodyGyroJerk.std...X
- tBodyGyroJerk.std...Y
- tBodyGyroJerk.std...Z
- tBodyAccMag.mean..
- tBodyAccMag.std..
- tGravityAccMag.mean..
- tGravityAccMag.std..
- tBodyAccJerkMag.mean..
- tBodyAccJerkMag.std..
- tBodyGyroMag.mean..
- tBodyGyroMag.std..
- tBodyGyroJerkMag.mean..
- tBodyGyroJerkMag.std..
- fBodyAcc.mean...X
- fBodyAcc.mean...Y
- fBodyAcc.mean...Z
- fBodyAcc.std...X
- fBodyAcc.std...Y
- fBodyAcc.std...Z
- fBodyAccJerk.mean...X
- fBodyAccJerk.mean...Y
- fBodyAccJerk.mean...Z
- fBodyAccJerk.std...X
- fBodyAccJerk.std...Y
- fBodyAccJerk.std...Z
- fBodyGyro.mean...X
- fBodyGyro.mean...Y
- fBodyGyro.mean...Z
- fBodyGyro.std...X
- fBodyGyro.std...Y
- fBodyGyro.std...Z
- fBodyAccMag.mean..
- fBodyAccMag.std..
- fBodyBodyAccJerkMag.mean..
- fBodyBodyAccJerkMag.std..
- fBodyBodyGyroMag.mean..
- fBodyBodyGyroMag.std..
- fBodyBodyGyroJerkMag.mean..
- fBodyBodyGyroJerkMag.std..

## Transformations
The following bullet points describe getting and cleaning data steps:

(in a temporary directory)

- Fetch data from the remote service, if not already fetched.
- Extract data, if not already extracted.
- Read activity labels from activity\_labels.txt.
- Read feature labels from feature\_labels.txt.
- Select only interesting feature labels (containing mean, std in their name).
- For each of the sets (training, test):
  - Read subject, data and label files.
  - Merge these into single data frame with labels mapped by activity names fetched before.
- Union two sets together.
- With label, subject as key, average all other variable in such groups.
- Write data file out.
