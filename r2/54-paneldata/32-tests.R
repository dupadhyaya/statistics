# Testing for Random Effects

#decide between random effects regression and simple OLS regression
#Ho : LM test : variances across entities is 0 : no significant difference across units (ie no panel effect)

pool = plm(y ~ x1, data= Panel, index= c("country", "year"), model="pooling")

summary(pool)

plmtest(pool, type=c('bp'))
#Failed to reject Ho 
#Random effect is not appropriate(Ha)
#No evidence of significant difference across countries. Run Simple OLS Regression


#Test for X section dep/ contemporance correlation

fixed = plm( y ~ x1, data=Panel, index=c("country", "year"), model="within")
pcdtest(fixed, test=c("lm"))
#No X section dependence

#Testing for Serial Correlation

pbgtest(fixed)
#applies to macropanels with long time series.
#Ho not a serial correlation


#Testing for Unit Roots / stationary
#Ho : series has a unit root (non-stationary)

Panel.set = pdata.frame(Panel, index=c("country", "year"))
library(tseries)
adf.test(Panel.set$y, k=2)

#Ho accept : non-stationary

#Testing for Heteroskedasticity

library(lmtest)

bptest(y ~ x1 + factor(country), data=Panel, studentize = F)
#Ho : presence of Hetereoskedascity (unequal variance)
#use covariance matrix

