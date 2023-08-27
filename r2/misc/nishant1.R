#nishant

library(dplyr)
delay <-read.csv("D:\\Data Analytics\\IATA\\AirlineFlightsData\\delay.csv")
delay = read.csv(file.choose())
head(delay)

airline<-read.csv("D:\\Data Analytics\\IATA\\AirlineFlightsData\\Airline Flights Data.csv")
airline = read.csv(file.choose())
airline1 <- airline[1:1000,]
airline1 = airline
head(airline1)

#memory.limit(size = 5000)
data<-full_join(airline1,delay, by = c("Airline.code" = "carrier"))

write.csv(data, file = "data.csv")

data = airline1
str(data)
data$CANCELLED <- factor(data$CANCELLED)
#setwd("D:\\Data Analytics\\IATA\\AirlineFlightsData")
#Create user defined function for descriptive analysis

var_Summ=function(x){
  if(class(x)=="numeric"){
    Var_Type=class(x)
    n<-length(x)
    nmiss<-sum(is.na(x))
    mean<-mean(x,na.rm=T)
    std<-sd(x,na.rm=T)
    var<-var(x,na.rm=T)
    min<-min(x,na.rm=T)
    p1<-quantile(x,0.01,na.rm=T)
    p5<-quantile(x,0.05,na.rm=T)
    p10<-quantile(x,0.1,na.rm=T)
    q1<-quantile(x,0.25,na.rm=T)
    q2<-quantile(x,0.5,na.rm=T)
    q3<-quantile(x,0.75,na.rm=T)
    p90<-quantile(x,0.9,na.rm=T)
    p95<-quantile(x,0.95,na.rm=T)
    p99<-quantile(x,0.99,na.rm=T)
    max<-max(x,na.rm=T)
    UC1=mean(x,na.rm=T)+3*sd(x,na.rm=T)
    LC1=mean(x,na.rm=T)-3*sd(x,na.rm=T)
    UC2=quantile(x,0.99,na.rm=T)
    LC2=quantile(x,0.01,na.rm=T)
    iqr=IQR(x,na.rm=T)
    UC3=q3+1.5*iqr
    LC3=q1-1.5*iqr
    ot1<-max>UC1 | min<LC1 
    ot2<-max>UC2 | min<LC2 
    ot3<-max>UC3 | min<LC3
    return(c(Var_Type=Var_Type, n=n,nmiss=nmiss,mean=mean,std=std,var=var,min=min,p1=p1,p5=p5,p10=p10,q1=q1,q2=q2,q3=q3,p90=p90,p95=p95,p99=p99,max=max,ot_m1=ot1,ot_m2=ot2,ot_m2=ot3))
  }
  else{
    Var_Type=class(x)
    n<-length(x)
    nmiss<-sum(is.na(x))
    fre<-table(x)
    prop<-prop.table(table(x))
    #x[is.na(x)]<-x[which.max(prop.table(table(x)))]
    
    return(c(Var_Type=Var_Type, n=n,nmiss=nmiss,freq=fre,proportion=prop))
  }
}

#Vector of numaerical variables
num_var= sapply(data,is.numeric)
num_var
Other_var= !sapply(data,is.numeric)

#manual testing
apply(data[num_var],2, quantile)
apply(data[num_var],2, var_Summ)#works
t(apply(data[num_var],2, var_Summ)) #will not work


#Applying above defined function on numerical variables
my_num_data<-t(data.frame(apply(data[num_var], 2, var_Summ)))
my_cat_data<-data.frame(t(apply(data[Other_var], 2, var_Summ)))
View(my_num_data)
View(my_cat_data)
