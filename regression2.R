library(boot) 
library(car)
library(QuantPsyc)
library(lmtest)
library(sandwich)
library(vars)
library(nortest)
library(MASS)

#setwd("C:\\Users\\Subhojit\\Desktop\\IVY R\\Linear Regression\\sunny")

data<- read.csv("dataivy1.csv")
str(data)
summary(data)


boxplot(data$sales)
quantile(data$sales, c(0,0.05,0.1,0.25,0.5,0.75,0.90,0.95,0.99,0.995,1))

data2 <- data[data$sales <8200, ]
boxplot(data2$sales)

quantile(data2$sales, c(0,0.05,0.1,0.25,0.5,0.75,0.90,0.95,0.97,0.98,0.985,0.99,0.995,1))


nrow(data)-nrow(data2)

data3 <- data[data$sales <6300, ]

nrow(data)-nrow(data3)

boxplot(data3$sales)

data <- data3


## Check the missing value (if any)
sapply(data, function(x) sum(is.na(x)))

data <- na.omit(data)

nrow(data)
names(data)

fit<- lm(sales ~ Item_Weight+	Item_Fat_Content +	Item_Visibility +	Item_Type+	Item_MRP +	
Outlet_Identifier +	Yrs_since_inception +	Outlet_Size +	Outlet_Location_Type +	
Outlet_Type, data=data)
summary(fit)


fit<- lm(sales ~ Item_Weight+	Item_Fat_Content +	Item_Visibility +	Item_Type+	Item_MRP +	
Outlet_Identifier , data=data)
summary(fit)

fit<- lm(sales ~ 		Item_Type+	Item_MRP +	
Outlet_Identifier , data=data)
summary(fit)

##Final model 
fit<- lm(sales ~ 		I(Item_Type == "Seafood")+I(Item_Type == "Dairy")+	Item_MRP +	
Outlet_Identifier , data=data)
summary(fit)



#Check Vif, vif>2 means presence of multicollinearity
vif(fit)



## Get the predicted or fitted values
fitted(fit)

## MAPE
data$pred <- fitted(fit)

#Calculating MAPE
attach(data)
(sum((abs(sales-pred))/sales))/nrow(data)


##################################### Checking of Assumption ############################################

# residuals should be uncorrelated ##Autocorrelation
# Null H0: residuals from a linear regression are uncorrelated. Value should be close to 2. 
#Less than 1 and greater than 3 -> concern
## Should get a high p value

dwt(fit)

# Checking multicollinearity
vif(fit) # should be within 2. If it is greater than 10 then serious problem

################ Constant error variance ##########Heteroscedasticity


# Breusch-Pagan test
bptest(fit)  # Null hypothesis -> error is homogenious (p value should be more than 0.05)



## Normality testing Null hypothesis is data is normal.

resids <- fit$residuals


ad.test(resids) #get Anderson-Darling test for normality 

