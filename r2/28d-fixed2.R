#Panel

#Fixed effects n entity specific intercepts using plm)

library(foreign)
Panel <- read.dta("http://dss.princeton.edu/training/Panel101.dta")

library(plm)

fixed = plm(y ~ x1, data = Panel, index=c("country","year"), model="within")
#y -outcome, x-predictor, index - panel setting, model (within)- fixed effects option

summary(fixed)
#n-no of gps/panels, T-no of years, N-total no observations
#x1 is significant, #F stats - model exists

fixef(fixed)

#Ho : ols is better than fixed
pFtest(fixed, ols)
#pvalue < 0.05 : fixed effects is better otherwise ols