### Between sessions tasks

# Task 1: Install and load the "survival" library
library(survival)

# Task 2: Define the "colon" dataset (directly availble from R). More info on the data at: https://vincentarelbundock.github.io/Rdatasets/doc/survival/colon.html 
data <- colon

# Task 3: Remove patient that are sensored, has perforations, or has spread to contiguous structures. And keep only death events.
selected_patients <- data[data$status==0 & data$perfor==0 & data$extent<4 & data$etype==2,]
#OR 
library(tidyverse)
selected_patients <- data %>%
  filter(status==0, perfor==0, extent<4, etype==2)
## The second one is a bit "longer", but is easier to read when you have many conditions. 
  
# Task 4: Remove the columns where you just removed all data 
cleaned_data <- subset(selected_patients, select = -c(status,perfor))

# Task 5: Make a neat summary of the data
## My new favorit: 
library(summarytools)
view(dfSummary(cleaned_data))

## For mac users (and my go-to previously): 
library(Publish)
table <- univariateTable(~rx+sex+age+obstruct+adhere+nodes+differ+extent+surg+node4+time+etype, cleaned_data)
summary(table)

# Task 6: Make a variable if they had a long or short time of death( long(>2000) or short (=>2000) )
cleaned_data$death <- ifelse(cleaned_data$time>2000,no="short",yes="long")
?ifelse
# Task 7: Make a boxplot of time to event, grouped by treatment group.
cleaned_data %>%
  ggplot(aes(x=time,fill = rx,colour = rx))+
  geom_boxplot()

# Task 8: Make a scatterplot of time to event compared to age, grouped by treatment group
cleaned_data %>%
  ggplot(aes(x=age,y=time,fill = rx,colour = rx))+
  geom_point()

# Task 9: Test if there is a difference in time to death between the observation group and the lev+5fu group. 
t.test(cleaned_data$time[cleaned_data$rx=="Obs"],cleaned_data$time[cleaned_data$rx=="Lev+5FU"])
#Returns a p-value of approx. 0.33

# Task 10: Make a new subset of the colon set, with recurrence events and not and 
#test there is a difference in time to event between the two treatment groups  
new_data <- data %>%
  filter(etype==1,rx!="Lev")
t.test(time~rx,new_data)
#Returns a very small p-value