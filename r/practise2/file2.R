# File 2
# 
x <- data.frame(height = c(1.80, 1.62, 1.96),
                weight = c(89, 57, 82),
                gender = c("Male", "Female", "Male")
)
# view data frame
x
# dimensions
dim(x)

# structure
str(x)

# First row
x[1,]
# First Coln
x[,1]
x$height

# First 2 rows
x[1:2,]

# First 2 columns
x[,1:2]

#subset data : height > 1.75
subset(x, height > 1.75)


# Bar Plot
# Simple Bar Plot 
counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution", 
        xlab="Number of Gears")

# Simple Histogram
hist(mtcars$mpg)
