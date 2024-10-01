#This exercise uses the diabetes data set: 
library(readxl)
data <- read.csv("diabetes.csv")

#With a dicotomous outcome: 
data$diabetes_01 <- ifelse(data$Diabetes_012==0,0,1)

# Task 1: Make table1 with age, bmi, Stroke and veggies grouped on diabetic status (dichotomous)
library(Publish)
table1 <- univariateTable(diabetes_01 ~ Age+BMI+Stroke+Veggies,data = data)

# Task 2:Export table 1 to excel
library(writexl)
write_xlsx(table1, "table1.xlsx") #Exporting tables as excel


# Task 3: Test the following questions of the dataset: 
## Are there differences in BMI, Age or income between diabetics and non diabetics? 
diabetics <- data[data$diabetes_01 ==1,]
nondiabetics <- data[data$diabetes_01 ==0,]

hist(diabetics$BMI)
hist(nondiabetics$BMI)

hist(diabetics$Age)
hist(nondiabetics$Age)

hist(diabetics$Income)
hist(nondiabetics$Income)

wilcox.test(diabetics$BMI,nondiabetics$BMI, paired = FALSE)
wilcox.test(diabetics$Age,nondiabetics$Age, paired = FALSE)
wilcox.test(diabetics$Income,nondiabetics$Income, paired = FALSE)

#Does diabetic status (including prediabetics) affect BMI?
kruskal.test(BMI ~ Diabetes_012, data = data)


# Is Income and bmi korrelated? 
cor.test(data$BMI, data$Income, method = 'spearman')

