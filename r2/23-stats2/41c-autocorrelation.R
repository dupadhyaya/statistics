#Auto Correlation
#mtcars$mpg is not the right eg but we use for testing only

x=mtcars$mpg
x1 = x[1+1:32]
x1
acf(x)
cor(x,x1, use='complete.obs')
x2 = x1[1+1:32]
cor(x,x2, use='complete.obs')
x3 = x1[1+1+1:32]
cor(x,x3, use='complete.obs')


acf(x, lag.max=4)
abline(h=cor(x,x1, use='complete.obs'))
abline(h=cor(x,x2, use='complete.obs'))
abline(h=cor(x,x3, use='complete.obs'))
