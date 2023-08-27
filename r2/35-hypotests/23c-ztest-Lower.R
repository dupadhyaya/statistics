#Z Test - Finance
#Lower Tail

#Investor assumses mean of daily return of stock > $10. Avg of 30 days daily return sample is $9.9. Assume population sd = 0.001.
#can we reject Ho at .05 signficance level

xbar = 9.9
mu = 10
stdev = 1.1
n=30
#Ho : MU >= 10
#Ha : MU < 10 (if z < z.alpha)

(z = (xbar - mu)/(stdev / sqrt(n)))
(9.9 - 10)/(1.1 /sqrt(30))

#table values
alpha = 0.05
(z.alpha = qnorm(1 - alpha))

#compare values
z > -z.alpha
#