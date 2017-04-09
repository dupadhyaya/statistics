# Statistics Practise
# Statistical Analysis ----------------------------------------------------

# Hypothesis Testing ---------------

# Chi Square Tests : Data set survey(MASS). Smoking and Exercise Level. 
# Test the hypothesis whether the students smoking habit is
#indepdent of their exercises level at .05 level.

x = c(1,2,3,4,5,6,7)
y = c(10,20,30,40,55,65,75)
tbl = table(x,y)
tbl
chisq.test(tbl)

# Simple Linear Regression

lm1 = lm(y ~ x)
coeffs = coefficients(lm1) 
coeffs
x1 = 9
y1 = coeffs[1] + coeffs[2]* 9
y1  

predict(lm1, data.frame(x=9)) # predict

lm1.stdres = rstandard(lm1)
qqnorm(lm1.stdres)


# t tests
s1 = c(6, 2, 2, 2, 3, 2, 7, 5, 7, 8)
s2 = c(9, 2, 4, 4, 5, 5, 6, 6, 8, 2)
t.test(s1,s2,alternative="greater", paired=TRUE)
# Interpret the results p values, t statistics


# Time Series
library(TTR)
data(ttrc)
str(ttrc)
head(ttrc)


sma.3 = SMA(ttrc[,'Close'],3) # 10 period
head(sma.3,n=10)

wma.30 = WMA(ttrc[,'Close'],wts=c(1:30),30)
head(wma.30,n=31)

ema.25 = EMA(ttrc[,'Open'],n=25)
head(ema.25,n=26)

library(TTR)
x=1:20
# Simple 3 pd Moving Average
sma.3 = SMA(x,3)
head(sma.3)

# Weighted Mean 3 day 
wma.3 = WMA(x,wts=c(.2,.3,.5),n=3)
head(x)
head(wma.3)
# Exponential Weighted Mean
ema.2 = EMA(x,wilder=T,2)
head(ema.2)
?EMA

library(xts)
temp = ts(x,start = c(2000),end=c(2011),  frequency = 1)
#temp = ts(x,start = c(2000,1),end=c(2012,3),  frequency = 12)

temp
?ts
plot(temp)
print(temp)

