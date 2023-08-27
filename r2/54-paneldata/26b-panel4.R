#Panel

#FIXED-EFFECTS MODEL(Covariance Model, Within Estimator, Individual Dummy Variable Model, Least  Squares Dummy Variable Model)

#Fixed effects: Heterogeneity across countries (or entities)


library(foreign)
Panel <- read.dta("http://dss.princeton.edu/training/Panel101.dta")
library(gplots)

plotmeans(mpg ~ cyl, data=mtcars)

plotmeans(y ~ country, main="Heterogeineity across countries", data=Panel)


