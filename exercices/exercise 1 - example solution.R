### Defining things ### 
# Task 1: Define a variable called 'patient_age' and assign a value. This is the most simple way to create a variable
patient_age <- 32

# Task 2: Create a 4x8 matrix of patient blood pressure readings
matrix_for_students <- matrix(1:patient_age, nrow = 4,ncol = 8)

# Task 3: Convert the matrix to a data frame
df_from_matrix <- data.frame(matrix_for_students)

# Task 4: Load the public R data set 'infert'
infert <- infert

# Task 5: Find the mean age of the participants in the infert data set 
## Hint: Use ?infert to get an overview of the data set
mean(infert$age) #/31.5

# Task 6: How many have had one or more spontaneous abortions? 
nrow(infert[infert$spontaneous>0,])

# Task 7: Define a subset of those who had an abortion
infertile <- infert[infert$spontaneous>0,]

# Task 8: Find the average age of those who had an abortion.
mean(infertile$age) #/ 30.6

# Task 9: Clean the environment. This becomes important when working with larger scripts, where you're more prone to working on the wrong data set.
rm(list=ls())

# Task 10: Load the diabetes data set from Excel 
library(readxl)
data <- read.csv("diabetes.csv")