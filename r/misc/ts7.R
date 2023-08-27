# Time Series : Conversion from DF to Time series
#http://stackoverflow.com/questions/29046311/how-to-convert-data-frame-into-time-series-in-r

library(zoo)
# Enter data a text
Lines <- "Dates   Bajaj_close Hero_close
3/14/2013   1854.8  1669.1
3/15/2013   1850.3  1684.45
3/18/2013   1812.1  1690.5
3/19/2013   1835.9  1645.6
3/20/2013   1840    1651.15
3/21/2013   1755.3  1623.3
3/22/2013   1820.65 1659.6
3/25/2013   1802.5  1617.7
3/26/2013   1801.25 1571.85
3/28/2013   1799.55 1542"

z1 <- read.zoo(text = Lines, header = TRUE, format = "%m/%d/%Y")
z1

# Convert first two DF and then to TS
DF <- read.table(text = Lines, header = TRUE)
class(DF)
z2 <- read.zoo(DF, format = "%m/%d/%Y")
z2

#In either case above z ia a zoo series with a "Date" class time index. One could also create the zoo series, zz, which uses 1, 2, 3, ... as the time index:
  
zz <- z
time(zz) <- 1:nrow(zz)
#ts. Either of these could be converted to a "ts" class series:
z
zz  
as.ts(z)
#The first has a time index which is the number of days since the Epoch (January 1, 1970) and will have NAs for missing days and the second will have 1, 2, 3, ... as the time index and no NAs.

as.ts(zz)


#Monthly series. Typically "ts" series are used for monthly, quarterly or yearly series. 
#Thus we if we were to aggregate the input into months we could reasonably represent it as a "ts" series:
  
z.m <- as.zooreg(aggregate(z, as.yearmon, mean), freq = 12)
as.ts(z.m)
