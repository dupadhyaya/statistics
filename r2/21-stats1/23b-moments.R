#moment

library(e1071)

skewness(mtcars$mpg)
kurtosis(mtcars$mpg)
sd(mtcars$mpg)
var(mtcars$mpg)


#default is mean
moment(mtcars$mpg)
mean(mtcars$mpg)
moment(mtcars$mpg, order=1)

#order=0
moment(mtcars$mpg, order=0)
#total probability

#order=1 : mean
moment(mtcars$mpg, order=1)

#order=2 : var : square of order1
moment(mtcars$mpg, order=2)




moment(mtcars$mpg, order=3)
moment(mtcars$mpg, order=4)


#library(moments)
library(moments)
all.moments(mtcars$mpg,  order.max=4)
