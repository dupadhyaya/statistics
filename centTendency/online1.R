#Online Class in R : 03 Dec 16
# average is the best model
#advertisement vs Sales 
#line passing through closest to each point

library(boot)
libary(car)
#libary(Quant)
library(lmtest)
library(sandwich)
library(vars)
library(nortest)
library(MASS)





# Model -------------------------------------------------------------------
# Stepwise Regression ?

nrow(data)
names(data)
# DV - sales , IVs ---
fit = lm(sales ~ Item_Weight + Item_Fact_Content, Outler_Identifie, data = data)
summary(fit)


