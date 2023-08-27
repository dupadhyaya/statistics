# T- Test

#t.test(x, y = NULL, alternative = c("two.sided", "less", "greater"), mu = 0, paired = FALSE, var.equal = FALSE,conf.level = 0.95, ...)

set.seed(123)
x = ceiling(rnorm(30, 75, 10))
x; mean(x)

t.test(x, mu=70, alternative='two.sided')
# pvalue < 0.05 : reject Ho that mu=70, it is (75) > 70

t.test(x, mu=75)
#pvalue > 0.05 : accept Ho that mu=75 (population mean)

#Ha : mu < 70
t.test(x, mu=70, alternative='less')
#accept Ho that mu >= 70 as pvalue is > 0.05

#Ha : mu > 70
t.test(x, mu=70, alternative='greater')
#reject Ho that mu <= 70 as pvalue is < 0.05

