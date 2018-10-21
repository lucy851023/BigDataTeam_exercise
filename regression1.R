#Regression Model-Simple Linear Regression_05/08

data(cars)
str(cars)

plot(dist~speed,data=cars,xlab="Speed", ylab="Stopping distance")

install.packages("gpairs")
library(gpairs)
gpairs(cars)

model=lm(dist~speed,data=cars)
abline(model,lty=2)

summary(model)
sd(residuals(model))

#par(mfrow=c(2,2))
#par("mar")
#par(mar = c(4,4.1,2,2))
#par(mfrow = c(1,1))

plot(model)

speed_df=data.frame(speed=runif(10,min=min(cars$speed),max=max(cars$speed)))
(result=predict(model,speed_df))


