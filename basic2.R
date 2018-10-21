#51
is.array(iris)
is.data.frame(iris)
r = c(1,2,3,5,4)
is.vector(r)
is.array(r)
r=as.array(r)
is.array(r)
is.vector(r)

#52
iris
names(iris)
dim(iris)
attr(iris,"names")
class(iris)
str(iris)
attributes(iris)

#53
M=matrix(1:12,3,4)
which( M %% 3 == 0)
which( M %% 3 == 0, arr.ind = T)

#54
r = c(1,45,89,78,23,8,4,35,4,8)
which.max(r)
which.min(r)

#練習5

#57
x=7
y=ifelse(x>10,1,2)
y

#58
x =10
if(x >5){
  print("x > 5")
}else{
  print("x <= 5")
}

#59
x =5
if(x >5){
  print("x > 5")
}else if(x == 5){
  print("x == 5")
}else{
  print("x < 5")}

#60
for(i in 1:10){
  print(i)
}

#61
sum=0
for(i in 1:10){
  sum=sum+i
}
print(sum)

#62
m=matrix(0,nrow=3,ncol=5)
m
for(i in 1:nrow(m) ) {
  for( j in 1:ncol(m) ){
    m[i, j]=i+j}}

#63
sum=0
cnt=0
while(cnt <= 10){
  sum=sum+cnt
  cnt=cnt+1
}
sum

#64
i=1
total=0
repeat{
  if(i > 10) break
  total=total+i
  i=i+1
}
total
i

#65
total = 0
for ( i in 1:100){
  if ( i %% 2 == 0) next
  total = total+i
}
total

x=1:100
sum(x[x%%2 == 1])

#練習6

#68
add1=function(a,b){
  c=a+b
  c
}
add1(10,5)

#69
f =function(a=2, b=3){
  a *2+b*2
}
f()

#70
f1 = function(x){
  if(x > 0 ) {
    y = x-1 
    return(x*f1(y))
  }else{
    return(1)
  }
}
f1(3)
f1(-1)

#練習7

#73
q = c(1,0,2,3,3,3,5,5)
tabulate(q)

y=c("A","B","C","D","E","A")
y=as.factor(y)
tabulate(y)

iris$Species
tabulate(iris$Species)

#74
table(iris$Species)
table(iris$Species,dnn = c("花種"))

#75
gender=c("女","男","男","女","男","女","男","女","女","女")
bloodtype=c("A","B","B","AB","O","O","O","A","A","O")
table(bloodtype,gender)
tab1=table( bloodtype, gender, dnn = c("血型","性別"))

#77
scores=c("G","B","G","B","G","B","G","G","B","G")
tab2=table(bloodtype,gender,scores,
           dnn = c("血型","性別","英文成績"))

#78
sco=c(78,85,98,65,25,65,85,87,98,85)
tab3=table(gender,sco,dnn = c("性別","成績"))
colMeans(tab3)
rowMeans(tab3)

#79
UCBAdmissions
df = as.data.frame(UCBAdmissions,responseName = "人數")
xtabs(人數~ Gender+Admit,data=df)
xtabs(人數~ Gender+Admit,data=df,subset = Dept %in% c("A","F"))

#81
install.packages("vcd")
data(Arthritis,package = "vcd")
Arthritis
ftable(Arthritis[,-c(1,4)])

#83
paste("H",1:12,sep = "_")
rep(1:4,2)
rep(1:4,2,each=3)
rep(1:4,2,each=3,len=10)

#84
substr("zxcvb",2,4)

h = c("中央大學","台灣大學","政治大學")
sub("大學","高中",h)










