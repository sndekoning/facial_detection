load("./data/data.RData")

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


# Saving it to csv.

names <- colnames(lookup_table)
lookup_table$Location <- NULL
