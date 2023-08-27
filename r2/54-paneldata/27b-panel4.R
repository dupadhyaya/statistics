#Panel 
#https://www.princeton.edu/~otorres/Panel101R.pdf

#OLS Regression


library(foreign)
Panel <- read.dta("http://dss.princeton.edu/training/Panel101.dta")
ols <-lm(y ~ x1, data=Panel)
summary(ols)
#Regular OLS regression does not consider heterogeneity across groups or time
yhat <- ols$fitted

plot(Panel$x1, Panel$y, pch=19, xlab="x1", ylab="y")

abline(lm(Panel$y~Panel$x1),lwd=3, col="red")
