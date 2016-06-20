# === Data Check & Transformations ===

# Checking if data is present.
if(!file.exists("./data/test.csv")){
    print("No data present, Please retrieve data from https://www.kaggle.com/c/facial-keypoints-detection/data")
}else{
    print("Reading in data")
    lookup_table <- read.csv("./data/IdLookupTable.csv")
    sample_submission <- read.csv("./data/SampleSubmission.csv")
    test_set <- read.csv("./data/test.csv", stringsAsFactors = FALSE)
    training_set <- read.csv("./data/training.csv", stringsAsFactors = FALSE)
}


# Dependencies.
library(doSNOW)
library(foreach)

# Setting the amount of cores for parallel processing.
cl <- makeCluster(4) # Change to amount of cores to be used.
registerDoSNOW(cl)


# Seperating the image column from the training dataframe for readability.
image_training <- training_set$Image
training_set$Image <- NULL


# Parallel converting strings to integers by splitting them and converting the result to integer.
image_training <- foreach(im = image_training, .combine=rbind) %dopar% {
    as.integer(unlist(strsplit(im, " ")))
}

# Same for test set.
image_test <- foreach(im = test_set$Image, .combine = rbind) %dopar% {
    as.integer(unlist(strsplit(im, " ")))
}
test_set$Image <- NULL

stopCluster(cl) #shutting down de clusters

# Saving the objects for future use.
rm(im)

save(list = ls(), file = "./data/data.RData")
