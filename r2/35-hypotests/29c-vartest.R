#Variance Test

set.seed(123)
class1 = rnorm(30, 60, 10)
set.seed(1)
class2 = rnorm(25, 65, 8)
var(class1); var(class2)

var.test(class1, class2)
