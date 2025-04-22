library(summarytools)
view(dfSummary(diabetes))

#Mac alternative: 
library(Publish)

vars <- colnames(diabetes)
vars_formated1 <- paste(vars, collapse = "+")
vars_formated2 <- paste("~",vars_formated1)
vars_formated <- as.formula(vars_formated2)

tab1 <- univariateTable(vars_formated, diabetes, summary.format = "mean(x) (sd(x)) median(x) [iqr(x)]")
tab1
