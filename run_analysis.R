#1. Merges the training and the test sets to create one data set.

X_test <- read.table("test/X_test.txt")
X_train <- read.table("train/X_train.txt")
general_data <- rbind(X_test,X_train)

subtrain <- read.table("train/subject_train.txt")
subtest <- read.table("test/subject_test.txt")
subdata <- rbind(subtest,subtrain)

y_test <- read.table("test/y_test.txt")
y_train <- read.table("train/subject_train.txt")
activities <- rbind(y_test,y_train)

big_data <- cbind(general_data,activities) 
#thus the activity data is now column 562

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 


#well we need the variable names first so we know what we're doing
the_names <- read.table("features.txt", quote="\"", stringsAsFactors=FALSE)

#check for which indices are going to contain the relevant data and then subset accordingly
 the_index <- grep('-mean\\(\\)| -std\\(\\)',the_names[,2])
 big_data <- big_data[,the_index]

#V1/V2/etc aren't very useful, lets add the column names
names(big_data) <- the_names[the_index,2]

#3&4. Uses descriptive activity names to name the activities in the data set. 
#Appropriately labels the data set with descriptive variable names. 

#import the activity label file and clean up how its presented so we can add it to our dataset
activity_labels <- read.table('activity_labels.txt')
activity_labels[, 2] = gsub("_", "", tolower(as.character(activity_labels[, 2])))

#replace the numeric number indicating the activity with actual words to describe it 
#also add a name to the subject data before we forget
activities[,1]=activity_labels[activities[,1],2]
names(activities) <- 'activity'
names(subdata)<-'subject id'

#and finally stick all of the data together to make our clean set of all data

clean_data <- cbind(subdata,activities,big_data)

write.table(clean_data,'cleandata.txt') #this isn't necessary but i wanted to make sure it worked

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#first we need to subset out the id and the activity column
#as averaging those is completely nonsensical

clean_subset <- clean_data[,3:length(clean_data)]

#calculate our means/sd and store it into vectors
column_sd <- apply(clean_subset,2,sd)
column_means <- apply(clean_subset,2,mean)

#merge them together and then add appropriate labels
col_data<- merge(column_means,column_sd)
name_vector <- colnames(clean_subset)

tidy_data <- cbind(name_vector,col_data)
names(tidy_data) <- c('Variable','Mean', 'Standard Deviation')

#and finally write our table to its own file
write.table(tidy_data,'Tidy Data.txt',row.name=FALSE)
                   
