#Z Test - Finance
#Two Tail with known variance

#Investor assumses mean of daily return of stock is at most  $2 for last year. Avg of 30 days daily return sample is $1.5. Assume population sd = 0.2. #can we reject Ho that there is not much significant difference in returns this year at .05 signficance level

xbar = 1.5
mu = 2
stdev = 0.2
n=30
#Ho : MU = 5
#Ha : MU != 5 (if z > or < z.alpha)

(z = (xbar - mu)/(stdev / sqrt(n)))
(1.5 - 2)/(.2 /sqrt(30))

#table values
alpha = 0.05/2
(z.alpha.half = qnorm(1 - alpha))

#compare values
z ; z.alpha.half
abs(z) > abs(z.alpha.half)  #Reject Ho

#
2 * pnorm(z)
#less than 0.05 : Reject Ho