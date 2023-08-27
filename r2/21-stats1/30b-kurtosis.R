# kurtosis

# kurtosis describes the tail shape of the data distribution.
library(e1071)     
kurtosis(mtcars$mpg)
# + 2.7
#-ve (Plato) : 0 (Meso) : +ve (Lepto)
# Peak
plot(density(mtcars$mpg))
