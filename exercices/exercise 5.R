#This exercise uses the diabetes data set: 
library(readxl)
data <- read.csv("diabetes.csv")

#With a dicotomous outcome: 
data$diabetes_01 <- ifelse(data$Diabetes_012==0,0,1)

# Task 1: Make table1 with age, bmi, Stroke and veggies grouped on diabetic status (dichotomous)
library(Publish)
table1 <- univariateTable(diabetes_01 ~ Age+BMI+Stroke+Veggies,data = data)

# Task 2:Export table 1 to excel

# Task 3: Test the following questions of the dataset: 

## Are there differences in BMI, Age or income between diabetics and non diabetics? 

## Does diabetic status (including prediabetics) affect BMI?

## Is Income and bmi korrelated? 
