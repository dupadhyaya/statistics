# Data Handling

# MTCARS R work
#http://www.theanalysisfactor.com/r-tutorial-part-13/
#http://www.r-tutor.com/r-introduction/data-frame/data-frame-column-slice

x = c(6,7,8,6,3,4,5)
y = c(3,8,5,6,NA,9,4)

length(x)
length(y)
mean(y)
mean(x)
mean(y,na.rm=T)

x=fix(x)
y=edit(x)

median(y)
sd(y)
boxplot(y)

table(x)

y[is.na(y)] = median(x,na.rm=T)
y

range(y)
IQR(y)
q1 = c(.1,.25,.5,.75,1)
quantile(x,q1)

stem(x)
hist(x)

cov(x,y)
cor(x,y)


x = round(x,2)
x

matxy = as.matrix(rbind(x,y))
matxy

mat2 = t(matxy)
mat2 = addmargins(mat2)
mat2

dfxy = as.data.frame(cbind(x,y))

dfxy$ser = 1:10
dfxy
apply(dfxy,2,mean)

sort(dfxy[,'y'])

write.csv(dfxy,'file1.csv')

# Data Handling with available Data Set


str(cars)
dim(cars)
data1 = cars

plot(data1$speed,data1$dist,pch=24)
abline(lm(speed~dist),data=data1)

title("Regression of Speed & Distance")

data1
hist(data1$dist)
data1$cat[data1$speed < 12] = c('cat1')
data1$cat[data1$speed >= 12] = c('cat2')

data1$cat
data1$cat = factor(data1$cat)

str(data1)
data1[1,2] 

nrow(data1)

ncol(data1)

apply(cars[,c(1,2)],2,mean)

boxplot(speed~cat, data=data1, xlab="Cat", ylab="Speed", font.lab=3, col="darkgreen")


data1[1]

data1[5:10,2:3]

data1[data1$cat=='cat1',c('speed','dist')]






library(MASS)

duration = faithful$eruptions
range(duration)

breaks = seq(1.5,5.5,by=0.5)
breaks
duration.cut = cut(duration,breaks, right=F)
duration.cut
duration.freq = table(duration.cut)
cbind(duration.freq)

pie(duration.freq)

