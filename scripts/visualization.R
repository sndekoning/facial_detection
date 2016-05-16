load("./data/data.RData")

# Visualizing the images.

img <- matrix(data = rev(image_training[1 ,]), nrow = 96, ncol = 96)
image(1:96, 1:96, img, col = gray((0:255)/255))

points(96-training_set$nose_tip_x[1], 96-training_set$nose_tip_y[1], col="red")
points(96-training_set$left_eye_center_x[1], 96-training_set$left_eye_center_y[1],  col="blue")
points(96-training_set$right_eye_center_x[1], 96-training_set$right_eye_center_y[1], col="green")