#Regression Model-Mutiple Regression and Logistic Regression 20180514

data(mtcars)
str(mtcars)
help("mtcars")

install.packages("corrplot")
library("corrplot")
mtcar_df=mtcars[,1:7]
cor(mtcar_df[,-1])
corrplot(cor(mtcar_df[,-1]),method=c("ellipse"))

model=lm(mpg~cyl+drat+wt+qsec,data=mtcar_df)


library(car)
vif(model)

summary(model)

#par(mfrow=c(2,2))
plot(model)

model = lm(mpg~.,data=mtcar_df)
model_stepwise=step(model)
summary(model_stepwise)
?step


install.packages("AER")
library(AER)
data(CreditCard)
str(CreditCard)

card_df=subset(CreditCard,select=c(card,reports,income,owner))
card_df$card=ifelse(card_df$card=="yes",1,0)

card.model=glm(formula=card~. ,data=card_df, family=binomial,maxit = 100)

library(car)
vif(card.model)

summary(card.model)

pred=round(predict(card.model, newdata = card_df, type ="response"))
(tab=table(pred,card_df$card))
(rate=sum(diag(tab))/sum(tab))

install.packages("dummies")
library("dummies")
dummy = dummy.data.frame(CreditCard[ ,-1])

