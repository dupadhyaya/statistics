#Random Effects Model

library(foreign)
Panel <- read.dta("http://dss.princeton.edu/training/Panel101.dta")

library(plm)
random = plm(y ~ x1, data=Panel, index=c("country","year"), model='random')

summary(random)
#x1 is not signficant

#Alt way 
#Panel.set = plm.data(Panel, index = c("country","year"))

Panel.set = pdata.frame(Panel, index = c("country","year"))

random.set = plm(y ~ x1, data = Panel.set, mode="random")

summary(random.set)

