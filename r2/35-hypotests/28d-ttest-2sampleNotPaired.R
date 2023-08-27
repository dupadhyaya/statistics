# T Test - Paired  
# same number of observation in each set

#Test before and after training
#Test before and after medicine

set.seed(123)
before = rnorm(30, 60, 10)
set.seed(321)
after = rnorm(30, 65, 12)
mean(before); mean(after)

#test if before and after marks are equal 
t.test(x=before, y=after, paired=T)
#pvalue < 0.05, Reject Ho and accept Ha: means are not equal
