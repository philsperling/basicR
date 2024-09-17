### Cleaning up data
#If you have issues with exercise 1, use this command: 
library(readxl)
data <- read.csv("diabetes.csv")

# Task 1: set all colnames to lower case 
library(dplyr)
data <- data %>%
  rename_all(tolower)

# Task 2: Get an overview of the dataset
library(summarytools)
view(dfSummary(data))

# Task 3: Remove patients who smoke, have a BMI>30, or has hearth disease and remove the columns you just removed data from
healthy <- data[data$smoker==0 & data$bmi<=30 & data$heartdiseaseorattack==0,]
healthy <- subset(healthy, select = -c(smoker,heartdiseaseorattack))

# Task 4: change genhlth(<=4),income(=8), and age(median split) to binary
healthy$genhlth_binary <- ifelse(healthy$genhlth<=4,0,1)
healthy$rich <- ifelse(healthy$income==8,1,0)
median_age <- median(healthy$age)
healthy$old <- ifelse(healthy$age<=median_age,0,1)

# Task 5: make diabetes into a factor: 
healthy$diabetes_012 <- as.factor(healthy$diabetes_012)

### Visualization 
# Task 6: Make a histogram of age
hist(healthy$age)

# Task 7: Make a boxplot of age grouped by diabetes status 
healthy %>%
  ggplot(aes(x=age,fill = diabetes_012))+
  geom_boxplot()

# Task 8: make a scatterplot of age and parity, grouped by case status from the infert data set
infert %>% 
  ggplot(aes(x=parity,y=age,color = case))+
  geom_point()
