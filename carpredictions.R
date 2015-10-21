# Eric Yablunosky
# 10/21/2015
#
# getCarData.R
#
# predicting transmission type for the MTcars dataset.

# Load the car data.
source("./getCarData.R")

# Create a classification tree to model the data
modelFit <- train(am ~ ., method = "rpart", data = training)

# Generate probabilities.
probs <- predict(modelFit, newdata = testing, type = "prob")
# Outcomes:
#
#                    automatic     manual
#Datsun 710          0.1818182 0.81818182
#Hornet 4 Drive      0.9285714 0.07142857
#Duster 360          0.9285714 0.07142857
#Merc 450SE          0.9285714 0.07142857
#Lincoln Continental 0.9285714 0.07142857
#Fiat 128            0.1818182 0.81818182
#Ferrari Dino        0.1818182 0.81818182

# Predict transmission type.
predictions <- predict(modelFit, newdata = testing, type = "raw")
# Outcomes:
#
#     predictions am 
# [1,]           2 2
# [2,]           1 1
# [3,]           1 1
# [4,]           1 1
# [5,]           1 1
# [6,]           2 2
# [7,]           2 2


confusionMatrix(data = predictions , reference = testing$am)
# Outcomes:
#             
# Prediction  automatic manual
# automatic         4      0
# manual            0      3
# Sensitivity : 1.0000     
# Specificity : 1.0000     
# Pos Pred Value : 1.0000     
# Neg Pred Value : 1.0000 
