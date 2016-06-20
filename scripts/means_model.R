# Checking if data is present.
if(!file.exists("./data/data.RData")){
    print("No data present, preparing data-set")
    source("data_check.R")
}else{
    print("Reading in data")
    load("./data/data.RData")
}

# Dependencies.

library(reshape2)


# Building a submission file using the means of the coordinates.

pred <- matrix(data = colMeans(training_set, na.rm = TRUE),
               nrow = nrow(test_set),
               ncol = ncol(training_set),
               byrow = TRUE)

colnames(pred) <- names(training_set)

predictions <- data.frame(ImageId = 1:nrow(test_set), pred)


# Changing to submission format.

submission <- melt(predictions, 
                   id.vars = "ImageId",
                   variable.name = "FeatureName",
                   value.name = "Location")

rm(image_test, image_training, test_set, training_set)
gc()

# Saving it to csv.

names <- colnames(lookup_table)
lookup_table$Location <- NULL

final_sub <- merge(x = lookup_table,
                   y = submission,
                   all.x = TRUE,
                   sort = FALSE)

write.csv(final_sub, file = "final_sub.csv", quote = FALSE, row.names = FALSE)
