# Panel Data Analysis
# video lecture

library(plm)
d = read.csv("./data/panel1.csv")
d
#pool =plm(dep ~ indep, data = d, model='pooling')
names(d)
pool = plm(log_sal ~ expr + proj + educ, data = d, model='pooling')


