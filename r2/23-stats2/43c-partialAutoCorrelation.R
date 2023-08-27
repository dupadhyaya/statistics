#Partial Autocorrelation
#More notes on Partial Auto Correlation ????

x=mtcars$mpg
pacf(x)
?pacf


# sample data
x <- diff(x)
# autocorrelations
sacf <- acf(x, lag.max = 10, plot = FALSE)$acf[,,1]
# solve the system of equations
res1 <- solve(toeplitz(sacf[1:5]), sacf[2:6])
res1
# benchmark result
res2 <- pacf(x, lag.max = 5, plot = FALSE)$acf[,,1]
res2
# [1]  0.30285526 -0.21344644 -0.16044680 -0.22163003  0.01008379
all.equal(res1[5], res2[5])
# [1] TRUE

#https://onlinecourses.science.psu.edu/stat510/node/62/
