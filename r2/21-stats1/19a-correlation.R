#Correlation

cor(mtcars$mpg, mtcars$wt)

cor(mtcars$wt, mtcars$mpg)

#strength and direction of relationship

plot(mtcars$wt, mtcars$mpg)
abline(lm(mpg ~ wt, data=mtcars), lty=1, col='red')
