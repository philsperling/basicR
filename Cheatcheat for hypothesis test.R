# The cheatsheat of tests: 
library(survival)
library(wooldridge)

# Paired t-test (difference in time at recurrence and death in colon cancer patients) ----
data <- colon
group_a <- data[data$etype==1,]
group_b <- data[data$etype==2,]
t.test(group_a$time,group_b$time,paired = TRUE)

## Wilcoxon signed rank test 
wilcox.test(group_a$time,group_b$time, paired = TRUE)

# independent t-test (difference in education between abusers and non-abusers) ----
data<- alcohol
group_a <- data[data$abuse==0,]
group_b <- data[data$abuse==1,]
t.test(group_a$educ,group_b$educ)

## Wilcoxon rank-sum test ----
wilcox.test(group_a$educ,group_b$educ, paired = FALSE)
# Same result as the parametric test (in this case)

#Anova (difference between treatment groups in survival time) ----
anova_test <-  aov(time ~ rx,
                   data = colon)
summary(anova_test)

## Kruskal-wallis----
kruskal.test(time ~ rx, data = colon)

# Pearson' correlation ----
cor.test(alcohol$educ, alcohol$famsize, method = 'pearson')

## Spearmans correlation ----
cor.test(alcohol$educ, alcohol$famsize, method = 'spearman')
