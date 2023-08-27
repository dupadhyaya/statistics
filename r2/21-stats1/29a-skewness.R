#skewness
#the skewness is a measure of symmetry. As a rule, negative skewness indicates that the mean of the data values is less than the median, and the data distribution is left-skewed. Positive skewness would indicate that the mean of the data values is larger than the median, and the data distribution is right-skewed.

library(e1071)
skewness(mtcars$mpg)
(modeMPG = mlv(mtcars$mpg, method='mfv'))
(statsvalues = c(mean(mtcars$mpg)-2, median(mtcars$mpg), modeMPG$M))
names(statsvalues) = c('mean', 'median', 'mode')
names(statsvalues)
plot(density(mtcars$mpg))
abline(v=statsvalues, col=c('red','green','violet'), lwd=c(3,4,1))
text(x=statsvalues+c(-2,-2,1), y=0.02+c(.01,.03,.02), labels = names(statsvalues), srt=90, col=c('red','green','violet'))


library(e1071)                    # load e1071 
duration = faithful$eruptions     # eruption durations 
plot(density(duration))
e1071::skewness(duration)                # apply the skewness 
#function #[1] -0.41355

#Answer-The skewness of eruption duration is -0.41355. It indicates that the eruption duration distribution is skewed towards the left.
