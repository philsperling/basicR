### Hypothesis test
#We will use the lung dataset from the survival package
library(survival)
data <- lung
# Task 1: explore the new dataset
view(dfSummary(data))

# Task 2: Is there a difference in age between dead and alive patients? (use the variable status to determin group)
t.test(data$age[data$status==1],data$age[data$status==2])

# Task 3: is there a difference in median survival time between male and female? 
t.test(data$time[data$sex==1],data$time[data$sex==2])

# Task 4: Is there a linear relationship between age and ecog score? 
fit <- lm(age~ph.ecog,data)
summary(fit)

# We will go into more depth on specific tests next time. 