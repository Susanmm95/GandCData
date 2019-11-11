library("dplyr")
library("reshape2")

features<-read.table("features.txt", header=FALSE)
activity_label <- read.table("activity_labels.txt", header=FALSE)

train <- read.table("X_train.txt", header=FALSE) 
train_label <- read.table("y_train.txt", header=FALSE) 
train_subject <- read.table("subject_train.txt")

test <- read.table("X_test.txt", header=FALSE) 
test_label <- read.table("y_test.txt", header=FALSE) 
test_subject <- read.table("subject_test.txt", header=FALSE) 

subject <- "Subject"
activity <- "Activity"

col_names <- gsub("-", "_", features$V2)
col_names <- gsub("[^a-zA-Z\\d_]", "", col_names)
names(train) <- make.names(names = col_names, unique = TRUE, allow_ = TRUE)
names(test)<- make.names(names = col_names, unique = TRUE, allow_ = TRUE)

names(test_label) <- activity  
names(test_subject) <- subject

names(train_label) <- activity  
names(train_subject) <- subject

merge<- rbind(cbind(train, train_label, train_subject), cbind(test, test_label, test_subject))

mergeMeanStd<-select(merge, matches("mean|std"), one_of(subject_col, activity_col)) 


ids<-c(subject_col, activity_col)
tidy_means <- melt(merge,id = ids, colnames(train)) 
tidy_means<-dcast(tidy_means, Subject + Activity ~ variable, fun.aggregate = mean, na.rm = TRUE)

write.table(tidy_means, file = "TidyMeans.csv", sep = ",", row.names = FALSE)