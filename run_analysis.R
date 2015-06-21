#!/usr/bin/Rscript

library(utils)
library(reshape2)

dir.sep <- "/"
path.join <- function (...) {
    paste(..., sep = dir.sep)
}

dir <- tempdir()

cat(paste0("Working in ", dir))

data.zip.name <- path.join(dir, "getdata-projectfiles-UCI HAR Dataset.zip")
data.zip.url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists(data.zip.name)) {
  download.file(url=data.zip.url, destfile=data.zip.name, method="auto")
}

data.unzip.dir <- path.join(dir, "unzipped")

if (!file.exists(data.unzip.dir)) {
  unzip(data.zip.name, exdir=data.unzip.dir)
}

activity.labels.file <- path.join(data.unzip.dir, "UCI HAR Dataset", "activity_labels.txt")
activity.labels <- read.table(activity.labels.file, col.names=c("id", "label"), colClasses=c("integer", "factor"))

feature.labels.file <- path.join(data.unzip.dir, "UCI HAR Dataset", "features.txt")
feature.labels <- read.table(feature.labels.file, col.names=c("id", "label"), colClasses=c("integer", "factor"))
interesting.cols <- grepl("(mean\\(\\)|std\\(\\))", as.character(feature.labels$label))

load.data <- function (dir) {
    subject.file <- path.join(data.unzip.dir, "UCI HAR Dataset", dir, paste("subject_", dir, ".txt", sep=""))
    subject <- read.table(subject.file, col.names=c("id"), colClasses=c("integer"))

    data.file <- path.join(data.unzip.dir, "UCI HAR Dataset", dir, paste("X_", dir, ".txt", sep=""))
    data <- read.table(data.file, col.names=feature.labels$label, colClasses="numeric")

    data <- data[,interesting.cols]
    data$subject <- subject$id

    labels.file <- path.join(data.unzip.dir, "UCI HAR Dataset", dir, paste("y_", dir, ".txt", sep=""))
    labels <- read.table(labels.file, col.names=c("id"), colClasses=c("integer"))
    data$label <- activity.labels$label[labels$id]

    data
}

test <- load.data("test")
train <- load.data("train")
data <- rbind(test, train)

melted <- melt(data, id=c("label", "subject"))
groupped <- dcast(melted, formula=label+subject~variable, fun.aggregate=mean)
write.table(groupped, "groupped.txt", row.names=FALSE)
