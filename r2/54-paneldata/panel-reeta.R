#Ms Reeta Tomar

library(foreign)
#http://www.milanor.net/blog/how-to-open-an-spss-file-into-r/
data = read.spss("./data/reeta.sav", to.data.frame=TRUE)
data = read.spss(file.choose(), to.data.frame=TRUE)
head(data)
dim(data)
summary(data)
unique(data$Year)

names(data)
library(plm)
data=data[complete.cases(data),]
sum(!complete.cases(data))

#Model1
#logIMR ~  logKOFGI : logU5MR ~  logKOFGI :loglife ~  logKOFGI 

fixed1a = plm(logIMR ~  logKOFGI, data = data, index=c("Year"), model="within")
summary(fixed1a)
#if logKOFGI increases, logIMR decreases

fixed1b = plm(logU5MR ~  logKOFGI, data = data, index=c("Year"), model="within")
summary(fixed1b)
#if logKOFGI increases, logU5MR decreases

fixed1c = plm(loglife ~  logKOFGI , data = data, index=c("Year"), model="within")
summary(fixed1c)
#if logKOFGI increases, loglife increases


#Model2
#logIMR ~  TGDPRatio +  SGDPRatio : logU5MR ~  TGDPRatio +  SGDPRatio : loglife ~  TGDPRatio +  SGDPRatio

fixed2a = plm(logIMR ~  TGDPRatio +  SGDPRatio, data = data, index=c("Year"), model="within")
summary(fixed2a)
#if TGDPRatio / SGDPRatio increases, logIMR decreases

fixed2b = plm(logU5MR ~  TGDPRatio +  SGDPRatio, data = data, index=c("Year"), model="within")
summary(fixed2b)
#if TGDPRatio / SGDPRatio increases, logU5MR decreases

fixed2c = plm(loglife ~  TGDPRatio +  SGDPRatio, data = data, index=c("Year"), model="within")
summary(fixed2c)
#if TGDPRatio / SGDPRatio increases, loglife increases

#Final Conclusions
#Globalisation has negative effect on Mortality while it has positive effect on Life Expectancy
# International trade in goods and in services has similar effect on the health status; has negative effect with Mortality while having positive effect on Life Expectancy


#Part-3

# logIMR ~  logKOFGI + KOFEcGI + KOFSoGI + KOFPoGI
# logU5MR ~  logKOFGI + KOFEcGI + KOFSoGI + KOFPoGI
# loglife ~  logKOFGI + KOFEcGI + KOFSoGI + KOFPoGI
#----------------
fixed3a1 = plm(logIMR ~  logKOFGI + KOFEcGI + KOFSoGI + KOFPoGI, data = data, index=c("Year"), model="within")
summary(fixed3a1)
#only Social Status is significant; KOFEcGI increases, IMR decreases
#------------
fixed3a2 = plm(logIMR ~  KOFEcGI + KOFSoGI + KOFPoGI, data = data, index=c("Year"), model="within")
summary(fixed3a2)
#Eco,Social & Political Status are significant; All increases, IMR decreases

#--------
#-------------------

fixed3b1 = plm(logU5MR ~  logKOFGI + KOFEcGI + KOFSoGI + KOFPoGI, data = data, index=c("Year"), model="within")
summary(fixed3b1)
# only Global & Social is significant; logKOFGI/ KOFEcGI increases, U5IMR decreases


fixed3b2 = plm(logU5MR ~  KOFEcGI + KOFSoGI + KOFPoGI, data = data, index=c("Year"), model="within")
summary(fixed3b2)
#Eco,Social & Political Status are significant; All increases, U5IMR decreases


#-------------------
## loglife ~  logKOFGI + KOFEcGI + KOFSoGI + KOFPoGI
fixed3c1 = plm(loglife ~  logKOFGI + KOFEcGI + KOFSoGI + KOFPoGI, data = data, index=c("Year"), model="within")
summary(fixed3c1)
# only Global & Social are significant; logKOFGI/ KOFEcGI increases, loglife decreases


fixed3c2 = plm(loglife ~  KOFEcGI + KOFSoGI + KOFPoGI, data = data, index=c("Year"), model="within")
summary(fixed3c2)
# Only Social & Political Status are significant; As they increases, loglife increase

#-----------------

