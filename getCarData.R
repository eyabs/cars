# Eric Yablunosky
# 10/21/2015
#
# getCarData.R
#
# Get Data for the MTcars dataset.

library("datasets")
library("caret")

# Load the Dataset.
data("mtcars")
for( i in c(2, 8, 9, 10, 11)){
    mtcars[,i] <- as.factor(mtcars[,i])
}
levels(mtcars$vs) <- c("V", "S")
levels(mtcars$am) <- c("automatic", "manual")

# Setting rng seed and creating training partition.
set.seed(42)
inTrain <- createDataPartition(y=mtcars$am,
                               p=0.75, list = FALSE)
training <- mtcars[inTrain, ]
testing <- mtcars[-inTrain, ]

featureCols <- (names(training) != "am")