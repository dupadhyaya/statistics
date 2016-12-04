library(boot) 
library(car)
library(QuantPsyc)
library(lmtest)
library(sandwich)
library(vars)
library(nortest)
library(MASS)

#setwd("C:\\Users\\Subhojit\\Desktop\\IVY R\\Linear Regression\\sunny")

data<- read.csv("dataivy2.csv")
str(data)
summary(data)
# Missing Values
sapply(data,function(x) sum(is.na(x)))
#data1 = complete.cases(data)
data1 = na.omit(data)
sapply(data1,function(x) sum(is.na(x)))
str(data1)
dim(data1)

boxplot(data1$Price_house)
quantile(data1$Price_house, c(0,0.05,0.1,0.25,0.5,0.75,0.90,0.95,0.99,0.995,1))
data2 <- data1[data1$Price_house < 11632000, ]
str(data2)
dim(data2)
boxplot(data2$Price_house)

quantile(data2$Price_house, c(0,0.05,0.1,0.25,0.5,0.75,0.90,0.95,0.97,0.98,0.985,0.99,0.995,1))


nrow(data)-nrow(data2)
#data <- data3

## Check the missing value (if any)
sapply(data2, function(x) sum(is.na(x)))

nrow(data2)
names(data2)
fit = lm( Price_house ~ Taxi_dist	+ Market_dist	+ Hospital_dist	+ Carpet_area	+ 
          Builtup_area + Parking_type	+ City_type	+ Rainfall,
          data = data2)
summary(fit)
# remove Builtup_area
fit2 = lm( Price_house ~ Taxi_dist	+ Market_dist	+ Hospital_dist	+ Carpet_area	+ 
          Parking_type	+ City_type	+ Rainfall,
          data = data2)
summary(fit2)

# Remove Market_dist

fit3 = lm( Price_house ~ Taxi_dist	+ Hospital_dist	+ Carpet_area	+ 
             Parking_type	+ City_type	+ Rainfall,
           data = data2)
summary(fit3)

# Remove Rainfall

fit4 = lm( Price_house ~ Taxi_dist	+ Hospital_dist	+ Carpet_area	+ 
             Parking_type	+ City_type	,
           data = data2)
summary(fit4)

##Final model 

#Check Vif, vif>2 means presence of multicollinearity
vif(fit4)

## Get the predicted or fitted values
fitted(fit4)

## MAPE
data2$pred <- fitted(fit4)

#Calculating MAPE
attach(data2)
(sum((abs(Price_house-pred))/Price_house))/nrow(data2)


##################################### Checking of Assumption ############################################

# residuals should be uncorrelated ##Autocorrelation
# Null H0: residuals from a linear regression are uncorrelated. Value should be close to 2. 
#Less than 1 and greater than 3 -> concern
## Should get a high p value

dwt(fit4) # High value found

# Checking multicollinearity
vif(fit4) # should be within 2. If it is greater than 10 then serious problem

################ Constant error variance ##########Heteroscedasticity

# Breusch-Pagan test
bptest(fit4)  # Null hypothesis -> error is homogenious (p value should be more than 0.05)

## Normality testing Null hypothesis is data is normal.

resids <- fit4$residuals


ad.test(resids) #get Anderson-Darling test for normality 

