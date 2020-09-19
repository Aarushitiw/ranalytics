library(dplyr)
mtcars
names(mtcars)
colnames(mtcars)
head(mtcars)
tail(mtcars)
summary(mtcars)
hist(mtcars$mpg)# fro histogram it can be seen , bwteen 15 & 20
head(mtcars)
nrow(mtcars)
dim(mtcars)
# summarY
mtcars
mtcars%>%filter(mpg>25)
mtcars%>%filter(mpg>25&gear==5)
mtcars%>%group_by(gear)%>%summarise(n=n(),mean(mpg))#first groupby , groups it into gear
mtcars%>%group_by(gear)%>%tally()
