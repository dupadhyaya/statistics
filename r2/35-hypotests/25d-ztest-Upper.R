#Z Test - Finance
#Upper Tail with known variance

#Investor assumses mean of daily return of stock is at most  $5. Avg of 30 days daily return sample is $5.1. Assume population sd = 0.25.
#can we reject Ho at .05 signficance level

xbar = 5.1
mu = 5
stdev = 0.25
n=30
#Ho : MU <= 5
#Ha : MU > 5 (if z > z.alpha)

(z = (xbar - mu)/(stdev / sqrt(n)))
(5.1 - 5)/(.25 /sqrt(30))

#table values
alpha = 0.05
(z.alpha = qnorm(1 - alpha))

#compare values
z ; z.alpha
z < z.alpha  #Reject Ho
z > z.alpha  #Accept Ha
#
pnorm(z, lower.tail=F)
#less than 0.05 : Reject Ho