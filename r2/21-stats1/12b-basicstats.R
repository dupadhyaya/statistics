# Basics Statistics

head(mtcars)

mean(mtcars$mpg)
?mean
sort(mtcars$mpg)
sort(mtcars$mpg)[16]
mean(mtcars$mpg, trim=.49)
mean(mtcars$mpg, trim=.4)
mean(sort(mtcars$mpg)[14:18])

#median
median(mtcars$mpg)
sort(mtcars$mpg)
sort(mtcars$mpg)[length(mtcars$mpg)/2]

#mode
mtcars$gear
table(mtcars$gear)
sort(table(mtcars$gear), decreasing=T)

library(modeest)
mlv(mtcars$gear, method="mfv")


#Std Deviation
sd(mtcars$mpg)
var(mtcars$mpg)
