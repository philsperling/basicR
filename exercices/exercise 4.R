#Distributions 
# In this exercise we will use three datasets and three samples: 
## Datasets
set.seed(123) #This gives everyone the same result to work with
normal_data <- rnorm(5000, 0, 10)
set.seed(123)
poisson_data <- rpois(5000, 15)
set.seed(123)
binorm_data <- rbinom(5000, size = 400, prob = 0.01)

## Samples 
set.seed(123)
normal_sample <- sample(normal_data, 100, replace = FALSE)
set.seed(123)
poisson_sample <- sample(poisson_data, 100, replace = FALSE)
set.seed(123)
binorm_sample <- sample(binorm_data, 100, replace = FALSE)


# Task 1: For each sample and dataset, make a histogram ad see if you can guess the distribution


# Task 2: Make a qqplot of each set and see if they are normal distributed


# Task 3: Test for normality with shapiro wilks test
