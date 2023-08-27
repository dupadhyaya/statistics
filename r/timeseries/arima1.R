# ARIMA Forecasting
# http://ucanalytics.com/blogs/step-by-step-graphic-guide-to-forecasting-through-arima-modeling-in-r-manufacturing-case-study-example/
#sales forecasting for them to manage their inventories and suppliers

# Step 1: Plot tractor sales data as time series --------------------------

data<-read.csv('Tractor-Sales.csv')
str(data)
head(data)
data<-ts(data[,2],start = c(2003,1),frequency = 12)
plot(data, xlab='Years', ylab = 'Tractor Sales')

# Clearly the above chart has an upward trend for tractors sales and there is also a seasonal component 


# Step 2: Difference data to make data stationary on mean (remove  --------
#The next thing to do is to make the series stationary(previous article).
#This to remove the upward trend through 1st order differencing the series using the following formula
#diff(data)
plot(diff(data),ylab='Differenced Tractor Sales')

# above series is not stationary on variance i.e. variation in the plot is increasing as we move towards the right of the chart. 
#We need to make the series stationary on variance to produce reliable forecasts through ARIMA models.


# Step 3: log transform data to make data stationary on variance ----------
#One of the best ways to make a series stationary on variance is through transforming the original series through log transform.
#We will go back to our original tractor sales series and log transform it to make it stationary on variance. The following equation represents the process of log transformation mathematically:
plot(log10(data),ylab='Log (Tractor Sales)')
#Now the series looks stationary on variance.

# Step 4: Difference log transform data to make data stationary on --------
#look at the differenced plot for log transformed series to reconfirm if the series is actually stationary on both mean and variance.
plot(diff(log10(data)),ylab='Differenced Log (Tractor Sales)')
#now this series looks stationary on both mean and variance. This also gives us the clue that I or integrated part of our ARIMA model will be equal to 1 as 1st difference is making the series stationary.


# Step 5: Plot ACF and PACF to identify potential AR and MA model ---------
#create autocorrelation factor (ACF) and partial autocorrelation factor (PACF) plots to identify patterns in the above data which is stationary on both mean and variance. The idea is to identify presence of AR and MA components in the residuals.

par(mfrow = c(1,2))
acf(ts(diff(log10(data))),main='ACF Tractor Sales')
pacf(ts(diff(log10(data))),main='PACF Tractor Sales')

#Since, there are enough spikes in the plots outside the insignificant zone (dotted horizontal lines) we can conclude that the residuals are not random. 
#This implies that there is juice or information available in residuals to be extracted by AR and MA models. Also, there is a seasonal component available in the residuals at the lag 12 (represented by spikes at lag 12). 
#This makes sense since we are analyzing monthly data that tends to have seasonality of 12 months because of patterns in tractor sales.


# Step 6: Identification of best fit ARIMA model --------------------------

#Auto arima function in forecast package in R helps us identify the best fit ARIMA model on the fly. 

require(forecast)
ARIMAfit <- auto.arima(log10(data), approximation=FALSE,trace=FALSE)
summary(ARIMAfit)

#The best fit model is selected based on Akaike Information Criterion (AIC) , and Bayesian Information Criterion (BIC) values. The idea is to choose a model with minimum AIC and BIC values. 
#Explore more about AIC and BIC in the later. 

#As expected, our model has I (or integrated) component equal to 1. This represents differencing of order 1. There is additional differencing of lag 12 in the above best fit model. Moreover, the best fit model has MA value of order 1. Also, there is seasonal MA with lag 12 of order 1.


# Step 6: Forecast sales using the best fit ARIMA model -------------------

#The next step is to predict tractor sales for next 3 years i.e. for 2015, 2016, and 2017 through the above model.
par(mfrow = c(1,1))
pred <- predict(ARIMAfit, n.ahead = 36)
pred
plot(data,type='l',xlim=c(2004,2018),ylim=c(1,1600),xlab = 'Year',ylab = 'Tractor Sales')
lines(10^(pred$pred),col='blue')
lines(10^(pred$pred+2*pred$se),col='orange')
lines(10^(pred$pred-2*pred$se),col='orange')

#  forecasts for a long period like 3 years is an ambitious task. The major assumption here is that the underlining patterns in the time series will continue to stay the same as predicted in the model. A short term forecasting model, say a couple of business quarters or a year, is usually a good idea to forecast with reasonable accuracy. A long term model like the one above needs to evaluated on a regular interval of time (say 6 months). The idea is to incorporate the new information available with the passage of time in the model.


# Step 7: Plot ACF and PACF for residuals of ARIMA model to ensure --------


#Finally, let’s create an ACF and PACF plot of the residuals of our best fit ARIMA model i.e. ARIMA(0,1,1)(0,1,1)[12]. 
par(mfrow=c(1,2))
acf(ts(ARIMAfit$residuals),main='ACF Residual') # Not Working
pacf(ts(ARIMAfit$residuals),main='PACF Residual')

#no spikes outside the insignificant zone for both ACF and PACF plots we can conclude that residuals are random with no information or juice in them. Hence our ARIMA model is working fine.

