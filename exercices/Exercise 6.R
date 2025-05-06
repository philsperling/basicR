# Install packages if needed:
install.packages("ggplot2")
install.packages("readxl")

# Load libraries
library(ggplot2)
library(readxl)

# Load dataset
data <- read.csv("diabetes.csv")[1:1000,]  # Replace with the correct path to your file

# Task 1: Histogram of Age
# Create a histogram to show the distribution of patient age.
ggplot(data, aes(x = Age))+
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black")+
  labs(title = "Age Distribution of Patients", x = "Age", y = "Count")

# Task 2: Boxplot of BMI by Diabetes Status
# Visualize how BMI varies between patients with and without diabetes.
ggplot(data, aes(x = as.factor(Diabetes_012), y = BMI)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "BMI by Diabetes Status", x = "Diabetes (0 = No, 1 = Yes)", y = "BMI")

# Task 3: Scatterplot of Age vs Glucose
# Make a scatterplot of age and glucose level, colored by diabetes status.
plot_dm <- ggplot(data, aes(x = Age, y = BMI, color = as.factor(Diabetes_012))) +
  geom_point() +
  labs(title = "BMI vs Age", x = "Age", y = "BMI", color = "Diabetes")
plot_dm
# Task 4: Add a Trend Line
# Add a smoothing line (loess) to the previous scatterplot.
plot_dm +
  geom_smooth(method = "loess") +
  labs(title = "BMI vs Age with Trend Line", x = "Age", y = "BMI")

# Task 5: Facet by Sex
# Use facet_wrap() to create separate plots by sex
plot_dm +
  facet_wrap(~ Sex) +
  labs(title = "BMI vs Age Faceted by Sex", x = "Age", y = "BMI")

# Task 6: Histogram of BMI
# Create a histogram of BMI. Use an appropriate bin width.
 
# Task 7: Boxplot of Age by Smoking Status
# Make a boxplot of age, grouped by whether the patient smokes.
 
# Task 8: Scatterplot of BMI and Blood Pressure
# Plot BMI vs blood pressure. Color by diabetes status.
 
# Task 9: Add a Linear Regression Line
# Add a linear regression line to your BMI vs blood pressure plot.
 
# Task 10: Customize Your Plot
# Pick one of your plots and try changing the theme (e.g., theme_minimal()), add a title, and label the axes clearly.

