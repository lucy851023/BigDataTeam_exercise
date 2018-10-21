#【讀入資料】

install.packages("xlsx")
library(xlsx)
brain <-read.xlsx(file ="data/brain.xlsx",sheetIndex = 1)

babies =read.csv(file="data/babies.txt",sep = " ")
cancer <- read.csv("data/cancer.csv", header=T, sep = ",")

#【相關常態判別】
#【plot】
plot(~perimeter_worst+area_worst,data = cancer)
plot(~perimeter_worst+area_worst+smoothness_worst,data = cancer)
plot(perimeter_mean~area_worst+smoothness_worst,data = cancer)

  
#p.10【pairs】

#【transform】----------------------------------------------------------
#【function】
std <- function(x) {x+1}
std(c(11,12,13,15))

----------------------------------------------------------------------
#【sapply】
x <- list(a = 1, b = 1:3, c = 10:100)
sapply(x, FUN = length)  
sapply(x, FUN = sum)  


#【lapply】
x <- list(a = 1, b = 1:3, c = 10:100) 
lapply(x, FUN = length) 
lapply(x, FUN = sum) 

#【apply】
M <- matrix(1:16, 4, 4)
apply(M, 1, min)
apply(M, 2, max)

M <- array( 1:32, dim = c(4,4,2))
apply(M, 1, sum)
apply(M,2,sum)
apply(M, c(1,2), sum)

-----------------------------------------------------------------------
#【log10】
ncol(cancer)
fun=function(x){log10(x+1)}
lapply(cancer[,3:ncol(cancer)],fun)
tra <- as.data.frame(lapply(cancer[,3:ncol(cancer)],fun))
cbind <-cbind(cancer[,1:2],tra)

qqnorm(cbind[,3],ylab = " ",main = " ")
qqline(cbind[,3])
hist(cbind[,3],breaks =5)

#【z score】
zscore<-function(x) {(x-mean(x))/sd(x)}
z1<-as.data.frame(lapply(cancer[,3:ncol(cancer)],zscore))

#exercise_1【range standardization】
cc = function(x){(x-min(x))/(max(x)-min(x))}
e1= as.data.frame(lapply(cancer[,3:ncol(cancer)],cc))

#【NA】
na <-c(1,2,NA)
is.na(na)

na1<-5
ifelse(na1>10, 1, 2)

#p.25【impute】
na_impute <- read.csv("data/na_cancer.csv",header = T)
na_f = function(x){ifelse(is.na(x),mean(x,na.rm = T),x)}
na_impute <-as.data.frame(lapply(na_impute[,c(1:ncol(na_impute))],na_f))
write.csv(na_impute, "data/na_cancer.csv",row.names = T)

#【dummy】
install.packages("dummies") 
library("dummies")
require("dummies")
Bdummy <-dummy.data.frame(cancer)

#【split】
spli<-split(cancer$dimension_worst,cancer$diagnosis,drop = F)

#p.30 exercise_2【split】
anova <- read.csv("data/anova.csv",header = T)
sp <-split(anova$Expression,anova$Gender)
length(sp$f)
length(sp$m)
#指標來切割資料
A = matrix(1:20,nrow =4, ncol =5);A
A1 = A[,c(2,4,5)];A1
A2 = A[1:3, c(2,4,5)];A2

#使用名稱指標作切割
colnames(A) = c("C1","C2","C3","C4","C5")
rownames(A) = c("R1","R2","R3","R4")
A3 = A[c("R1","R3"),c("C2","C5")];A3

#subset切割資料
head(iris)
factor(iris$Species)
subset(iris, Sepal.Length > 5) 
subset(iris, Sepal.Length > 5,select = Sepal.Length) 
subset(iris, Sepal.Length > 5,select = -Sepal.Length) 

#【training/test sample】
set.seed(323)
train_indx=sample(1:nrow(cancer),size=398)
train=cancer[train_indx,]
test=cancer[-train_indx,]

aggdata = aggregate(Bdummy,by=list(Bdummy$diagnosisB),FUN=mean,na.rm=TRUE)


#p.38【aggregate】

#exercise_3【na_iris】

