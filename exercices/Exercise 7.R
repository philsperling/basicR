# Install packages if needed:
install.packages("ggplot2")
install.packages("pROC")
install.packages("caret")

# Load libraries
library(ggplot2)
library(pROC)
library(caret)

# Load dataset
data <- read.csv("diabetes.csv")[1:1000,]  # Adjust path as needed

# Task 1: Linear Regression
# Predict BMI based on some variables 
model_lm <- lm(BMI ~ Age+DiffWalk+PhysHlth+GenHlth+Smoker+HighBP+Diabetes_012, data = data)
summary(model_lm)

# Task 2: Predicted vs Actual BMI
# Visualize model performance
data$predicted_bmi <- predict(model_lm)
ggplot(data, aes(x = BMI, y = predicted_bmi)) +
  geom_point() +
  geom_abline(slope = 1, intercept = 0, color = "red") +
  labs(title = "Predicted vs Actual BMI", x = "Actual", y = "Predicted")

# Task 3: Logistic Regression
# Predict diabetes using age and BMI
model_logit <- glm(as.factor(Diabetes_012) ~ Age + BMI + PhysHlth, data = data, family = "binomial")
summary(model_logit)

# Task 4: Confusion Matrix
# Classify patients as diabetic or not using a 0.5 threshold
predicted_prob <- predict(model_logit, type = "response")
predicted_class <- ifelse(predicted_prob > 0.5, 1, 0)
confusionMatrix(as.factor(predicted_class), as.factor(data$Diabetes_012))

# Task 5: ROC Curve
# Evaluate model with ROC and AUC
roc_obj <- roc(data$Diabetes_012, predicted_prob)
plot(roc_obj, col = "blue")
auc(roc_obj)

# Task 6: Predict Income
# Fit a linear regression predicting income using whatever variables you like.

# Task 7: Predicted vs Actual Income
# Visualize your prediction results with a scatterplot.

# Task 8: Logistic Regression
# Predict diabetes using using whatever variables you like.

# Task 9: Confusion Matrix
# Use a 0.4 threshold and compare it to 0.5. What changes?

# Task 10: Try a different model (e.g., KNN, Naive bayes, SVM, Decision Tree, Random Forrest, etc.)