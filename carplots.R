# Eric Yablunosky
# 10/21/2015
#
# getCarData.R
#
# Exploratory plot for the MTcars dataset.
library("reshape2")

# Load the car data.
source("./getCarData.R")


# Plot a histogram for each feature separated by transmission type.
training.m <- melt(data = training, id.var = "am")
plt <- ggplot(data = training.m, aes(x = value))
plt <- plt + geom_histogram(aes(fill=am))
plt + facet_wrap( ~ variable, scales = "free")