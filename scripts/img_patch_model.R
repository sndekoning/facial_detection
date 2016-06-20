# Checking if data is present.
if(!file.exists("./data/data.RData")){
    print("No data present, preparing data-set")
    source("data_check.R")
}else{
    print("Reading in data")
    load("./data/data.RData")
}

# Dependencies.

# Defining parameters.

coords <- "left_eye_center"
patch_size <- 10

