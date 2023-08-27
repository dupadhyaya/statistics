#panel data
#https://rpubs.com/mhanauer/278903

library(reshape)

dataLong = data.frame(a1 = c(rnorm(10)), a2 = c(rnorm(10)))
head(dataLong)

dataLongLong = reshape(dataLong, varying = list(c("a1", "a2")), v.names = "dependent", times = c(1,2), direction = "long")

head(dataLongLong)
dataLongLong
#panel data

library(foreign)
library(plm)
Panel <-read.dta("http://dss.princeton.edu/training/Panel101.dta")
head(Panel)

fixed = plm(y ~ x1, data = Panel, index = c("country", "year"), model = "within")
summary(fixed)


random = plm(y ~ x1, data = Panel, index = c("country", "year"), model = "random")
summary(random)

phtest(random, fixed)

library(lavaan)
head(Demo.growth)
model = "i =~ 1*t1 + 1*t2 + 1*t3 + 1*t4 
s =~ 0*t1 + 1*t2 + 2*t3 + 3*t4"

fit = growth(model, data = Demo.growth)
summary(fit)
