# Chi Squared

# Q1 ----------------------------------------------------------------------
#http://www.r-tutor.com/elementary-statistics/goodness-fit/chi-squared-test-independence

#In the built-in data set survey, the Smoke column records the students smoking habit, 
#while the Exer column records their exercise level. 
#The allowed values in Smoke are "Heavy", "Regul" (regularly), "Occas" (occasionally) and "Never". 
#As for Exer, they are "Freq" (frequently), "Some" and "None".
#We can tally the students smoking habit against the exercise level with the table function in R. 
#The result is called the contingency table of the two variables.
library(MASS)       # load the MASS package 
tbl = table(survey$Smoke, survey$Exer) 
tbl                 # the contingency table 
#Test the hypothesis whether the students smoking habit is independent of their exercise level at .05 significance level.
#We apply the chisq.test function to the contingency table tbl, and found the p-value to be 0.4828.
chisq.test(tbl)
#as the p-value 0.4828 is greater than the .05 significance level, we do not reject the null hypothesis that the smoking habit is independent of the exercise level of the students.

#The warning message found in the solution above is due to the small cell values in the contingency table. To avoid such warning, we combine the second and third columns of tbl, and save it in a new table named ctbl. Then we apply the chisq.test function against ctbl instead.

ctbl = cbind(tbl[,"Freq"], tbl[,"None"] + tbl[,"Some"]) 
ctbl 
chisq.test(ctbl)


# Q2 ----------------------------------------------------------------------

#http://courses.statistics.com/software/R/Rchisq.htm




# Q3 ----------------------------------------------------------------------

#https://ww2.coastal.edu/kingw/statistics/R-tutorials/independ.html

row1 = c(91,90,51)                   # or col1 = c(91,150,109)
row2 = c(150,200,155)                # and col2 = c(90,200,198)
row3 = c(109,198,172)                # and col3 = c(51,155,172)
data.table = rbind(row1,row2,row3)   # and data.table = cbind(col1,col2,col3)
data.table
chisq.test(data.table)

#If the data are available in an electronic document, like this one, it can be entered into R using the scan() function.
ls()  # list all current objects
rm(list=ls())                             # Clean up a bit first!
the.data = scan()   # input from scan
#1:   91            90             51
#4:  150           200            155
#7:  109           198            172
#10: 
#  Read 9 items
the.data                                  # scan produces a vector
#[1]  91  90  51 150 200 155 109 198 172
data.matrix = matrix(the.data, byrow=T, nrow=3)
data.matrix                               # which we convert to a matrix
chisq.test(data.matrix)$statistic         # keeping the output brief

#X-squared  25.08597

dimnames(data.matrix) = list(Age=c("lt.45","45.to.59","ge.60"), Freq=c("Monthly","Occasionally","Never"))


