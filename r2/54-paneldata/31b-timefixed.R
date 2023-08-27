#Panel Data

# Testing for time fixed effects

library(plm)

fixed = plm(y ~ x1, data = Panel, index=c("country","year"), model="within")

fixed.time = plm(y ~ x1 + factor(year), data = Panel, index=c("country","year"), model="within")

summary(fixed.time)


#testing
pFtest(fixed.time, fixed)
#Ho : fixed.time effect to be used
#Ha : fixed effect to be used

plmtest(fixed, c('time'), type=("bp"))
#Ho : fixed
#Ha : fixed.time

library(plm)

