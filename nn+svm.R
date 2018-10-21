install.packages("neuralnet")
library("neuralnet")
library("stringr")
Concrete = read.table("data/Concrete_Data.csv",sep = ",",stringsAsFactors = F,header = T)
str(Concrete)

normalize = funtion(x){
  return((x - min(x))/(max(x)-min(x)))
}
Concrete_norm = as.data.frame(lapply(Concrete,normalize))

names(Concrete_norm) = c("Cement","Blast","FlyAsh","Water","Superplasticizer","Coarse","FineAggregate","Age","MPa")

index = sample(1:nrow(Concrete_norm),ceiling(nrow(Concrete_norm)*0.8))
Concrete.train = Concrete_norm[index,]
Concrete.test = Concrete_norm[-index,]

str_c(names(Concrete.train),collapse = "+")

model = neuralnet(MPa~Cement+Blast+FlyAsh+Water+Superplasticizer+Coarse+FineAggregate+Age,data = Concrete.train)
plot(model)

model_results =compute(model,Concrete.test[1:8])
predicted_strength = model_results$net.result
cor(predicted_strength,Concrete.test$MPa)

model2 = neuralnet(MPa~Cement+Blast+FlyAsh+Water+Superplasticizer+Coarse+FineAggregate+Age,data = Concrete.train,hidden = 7)
plot(model2)

model2_results = compute(model2,Concrete.test[1:8])
predicted_strength2 = model2_results$net.result

cor(predicted_strength2,Concrete.test$MPa)

install.packages("kernlab")
library("kernlab")
letters = read.table("data/letterdata.csv",sep = ",",stringsAsFactors = F,header = T)
str(letters)

index = sample(1:nrow(letters),ceiling(nrow(letters)*0.8))
letters.train = letters[index,]
letters.test = letters[-index,]

letter_classifier = ksvm(letter~.,data = letters.train,kernel = "vanilladot",C=1)
letter_predictions = predict(letter_classifier,letters.test)

table(letter_predictions,letters.test$letter)
agreement = letter_predictions ==letters.test$letter
prop.table(table(agreement))
