#Panel Data


library(foreign)
Panel <- read.dta("http://dss.princeton.edu/training/Panel101.dta")
Panel
str(Panel)
head(Panel)
coplot(y ~ year|country, type="l", data=Panel) # Lines
coplot(y ~ year|country, type="b", data=Panel) # Points and lines

## Bars at top indicates corresponding graph (i.e. countries)from left to right starting on the bottom row

#Explore Data
library(car)
summary(Panel)
scatterplot(y~year|country, boxplots=FALSE, smooth=TRUE, reg.line=FALSE, data=Panel)
