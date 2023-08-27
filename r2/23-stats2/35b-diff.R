#Diff


x=mtcars$mpg
x

#manually

x[2]-x[1];x[3]-x[2]
#using Loop
for(i in 1:length(x)) {
  print(x[i+1]-x[i])
}
diff(x)
?diff

diff(x, lag=1, differences=1)
diff(x, lag=1, differences=2)


