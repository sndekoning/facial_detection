# Checking if data is present.
if(!file.exists("./data/data.RData")){
    print("No data present, preparing data-set")
    source("data_check.R")
}else{
    print("Reading in data")
    load("./data/data.RData")
}

load("./data/data.RData")

# Visualizing the first image.

img <- matrix(data = rev(image_training[1 ,]), nrow = 96, ncol = 96)
image(1:96, 1:96, img, col = gray((0:255)/255))

points(96-training_set$nose_tip_x[1], 96-training_set$nose_tip_y[1], col="red")
points(96-training_set$left_eye_center_x[1], 96-training_set$left_eye_center_y[1],  col="blue")
points(96-training_set$right_eye_center_x[1], 96-training_set$right_eye_center_y[1], col="green")

# Checking the variability of the nose_tip variable.

for (i in 1:nrow(training_set)) {
    points(96-training_set$nose_tip_x[i], 96-training_set$nose_tip_y[i], col = "red")
}

# Tracking outliers.

idx <- which.max(training_set$nose_tip_x)
img <- matrix(data = rev(image_training[idx ,]), nrow = 96, ncol = 96)
image(1:96, 1:96, img, col = gray((0:255)/255))

points(96-training_set$nose_tip_x[idx], 96-training_set$nose_tip_y[idx], col = "red")