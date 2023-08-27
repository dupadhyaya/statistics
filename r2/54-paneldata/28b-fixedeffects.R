#Panel

#Fixed effects using Least squares dummy variable mode

library(foreign)
Panel <- read.dta("http://dss.princeton.edu/training/Panel101.dta")
fixed.dum <-lm(y ~ x1 + factor(country) - 1, data=Panel)
summary(fixed.dum)

#https://dss.princeton.edu/training/Panel101.pdf

#Least squares dummy variable model
yhat <- fixed.dum$fitted
library(car)
scatterplot(yhat~Panel$x1|Panel$country, boxplots=FALSE, xlab="x1", ylab="yhat",smooth=FALSE)
abline(lm(Panel$y~Panel$x1),lwd=3, col="red")

#comparison OLS with LSDV
head(Panel)
#each component of factor variable(country) is absorbing the effects particular to each country. Predictor x1 was not significant in OLS model, once controlling for differences across countries, x1 became significant in OLS_DUM (LSDV model)

library(apsrtable)
apsrtable(ols, fixed.dum, model.names = c("OLS", "OLS_DUM"))
#x1 significant in OLS_DUM

#export table to text file (Latex code)
cat(apsrtable(ols, fixed.dum, model.names = c("OLS", "OLS_DUM"), Sweave=F), file="./54-paneldata/ols_fixed1.txt")
