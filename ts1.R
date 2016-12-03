# Time Series ts1
#https://www.analyticsvidhya.com/blog/2015/12/complete-tutorial-time-series-modeling/

data(AirPassengers)
class(AirPassengers)
#This tells you that the data series is in a time series format
str(AirPassengers)
head(AirPassengers); tail(AirPassengers)
start(AirPassengers)
#This is the start of the time series
end(AirPassengers)
#[1] 1960 12
#This is the end of the time series
frequency(AirPassengers)  # $[1] 12
#The cycle of this time series is 12months in a year
summary(AirPassengers)


# Sec 2 -------------------------------------------------------------------

#The number of passengers are distributed across the spectrum
plot(AirPassengers)
#This will plot the time series
abline(reg=lm(AirPassengers~time(AirPassengers)))
# This will fit in a line


# Sec3 --------------------------------------------------------------------

cycle(AirPassengers)
#This will print the cycle across years.
plot(aggregate(AirPassengers,FUN=mean))
#This will aggregate the cycles and display a year on year trend
boxplot(AirPassengers~cycle(AirPassengers))
#Box plot across months will give us a sense on seasonal effect
