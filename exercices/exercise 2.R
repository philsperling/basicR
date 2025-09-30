### Cleaning up data
#If you have issues with exercise 1, use this command: 
library(readxl)
data <- read.csv("diabetes.csv")

# Task 1: set all colnames to lower case 
# (Tip: use colnames() or names() with tolower() and consider using dplyr)

# Task 2: Get an overview of the dataset
library(summarytools)
view(dfSummary(data))

# Task 3: Remove patients who smoke, have a BMI > 30, or have heart disease.
# Then, remove the columns used for filtering.

# Task 4: Make new binary variables for the following variables:
# - genhlth: 1 if <= 4, 0 otherwise
# - income: 1 if equal to 8, 0 otherwise
# - age: 1 if age is above the median, 0 otherwise

# Task 5: make diabetes_012 into a factor: 

### Visualization 
# Task 6: Make a histogram of age

# Task 7: Make a boxplot of age grouped by diabetes status 

# Task 8: make a scatterplot of age and parity, grouped by case status from the infert data set


