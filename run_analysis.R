
## ----libraries-----------------------------------------------------------
library(data.table)  # used instead of the native data.frame for speed
library(reshape2)  # used to melt() the tidy dataset


## ----globals-------------------------------------------------------------
BASE_DIR = 'UCI HAR Dataset'
TEST_DIR = file.path(BASE_DIR, 'test')
TRAIN_DIR = file.path(BASE_DIR, 'train')

DATA_URL = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
DATA_FILE = 'getdata-projectfiles-UCI HAR Dataset.zip'
DATA_DIR = file.path('.', 'data')
MERGED_DATA = file.path(DATA_DIR, 'full_data.Rdata')
MERGED_DATA_TXT = file.path(DATA_DIR, 'full_data.csv')
TIDY_DATA = file.path(DATA_DIR, 'tidy_data.Rdata')
TIDY_DATA_TXT = file.path(DATA_DIR, 'tidy_data.csv')


## ----prepare_data--------------------------------------------------------
# function to download to destination file with or without replacement
safe.download = function(url, dest, replace=FALSE, method='auto') {
  # @ url: of file to download  
  # @ dest: pathname to destination file  
  # @ replace: set to TRUE if to over-write existing file  
  # @ method: can also be 'curl', 'wget', or 'lynx'
  if (!replace & file.exists(dest)) {
    return(TRUE)
  }
  download.file(url, dest, method)
}

# ensure we have data here
if(!file.exists(file.path('.', DATA_FILE))){
  safe.download(DATA_URL, DATA_FILE, method='curl')
}

# and ensure data folder for our results
if(!file.exists(DATA_DIR)){
  dir.create(DATA_DIR)
}


## ----prep_features_and_activity_labels-----------------------------------
features = read.table(unz(DATA_FILE, 
                          file.path(BASE_DIR, 'features.txt')))
mean_std_cols = as.character(features$V2[grep(pattern='mean()|std()',features$V2)])
activity_labels = read.table(unz(DATA_FILE, 
                                 file.path(BASE_DIR, 'activity_labels.txt')))


## ----data_extraction-----------------------------------------------------
extract = function(set='test') {
    subject_filename = paste0('subject_', set, '.txt')
    X_filename = paste0('X_', set, '.txt')
    y_filename = paste0('y_', set, '.txt')
    
    if (set=='test') {
      DIR = TEST_DIR
    } else {
      DIR = TRAIN_DIR
    }
    
    subject = read.table(unz(DATA_FILE, 
                             file.path(DIR, subject_filename)))
    
    X = read.table(unz(DATA_FILE, 
                       file.path(DIR, X_filename)))
    names(X) = features[,2]
    X = X[,mean_std_cols]
    
    y = read.table(unz(DATA_FILE, 
                       file.path(DIR, y_filename)))
    y$activity = sapply(y$V1, function(x) activity_labels[x,'V2'])
    
    data = data.table(subject = subject$V1,
                      activity = y$activity,
                      set = set)
    data = cbind(data, X)
    return(data)
}


## ----extract_two_datasets------------------------------------------------
test_data = extract(set='test')
train_data = extract(set='train')


## ----merge_datasets------------------------------------------------------
full_data = rbind(test_data, train_data)

save(full_data, file=MERGED_DATA)
write.table(full_data, file=MERGED_DATA_TXT, sep=',', row.names = FALSE)


## ----extract_mean_columns------------------------------------------------
mean_cols = names(full_data)
mean_cols = as.character(mean_cols[grep(pattern='mean()',mean_cols)])


## ----prep_and_save_tidy_dataset------------------------------------------
tidy_data = full_data[,c('subject', 'activity', mean_cols), with=FALSE]
tidy_data = melt(tidy_data, id=c('subject', 'activity'))
save(tidy_data, file=TIDY_DATA)
write.table(tidy_data, file=TIDY_DATA_TXT, sep=',', row.names = FALSE)


