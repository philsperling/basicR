### Defining things ### 

# Task 1: Define a variable with a name and a value
days_to_phd_done <- 288

# Task 2: create a 4x8 matrix
matrix_for_students <- matrix(1:days_to_phd_done, nrow = 48,ncol = 6)

# Task 3: Convert the matrix to a data frame
df_from_matrix <- data.frame(matrix_for_students)

# Task 4: Load the public R dataset infert
infert <- infert

# Task 5: Find the mean age of the participants in the infert data set 
## Hint: Use ?infert to find overview of the dataset
mean(infert$age) #/31.5

# Task 6: How many has had an spontanous abortion? 
nrow(infert[infert$spontaneous>0,])

# Task 7: Define a subset of those who had an abortion
infertile <- infert[infert$spontaneous>0,]

# Task 8: Find the average age of those who had an abortion.
mean(infertile$age) #/ 30.6

# Task 9: clean the environment
rm(list=ls())

# Task 10: Load the diabetes dataset from excel 
library(readxl)
data <- read.csv("diabetes.csv")