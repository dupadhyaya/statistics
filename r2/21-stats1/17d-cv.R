# Coefficient of Variance
#https://www.rdocumentation.org/packages/sjstats/versions/0.15.0/topics/cv

#The most common use of the coefficient of variation is to assess the precision of a technique. It is also used ass a measure of variability when the standard deviation is proportional to the mean, and as a means to compare variability of measurements made in different units.


#std Dev/ Mean

sd(mtcars$mpg)
mean(mtcars$mpg)

sd(mtcars$mpg)/ mean(mtcars$mpg)


library(sjstats)
cv(mtcars$mpg)

#used for comparing two variables
cv(mtcars$hp)
