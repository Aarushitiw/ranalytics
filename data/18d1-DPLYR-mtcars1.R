#Data Summarisation using Dplyr 
#dataset - mtcars

#dplyr - mtcars
#install.packages('dplyr')
library(dplyr) #install this library


head(mtcars)# first 6 rows
names(mtcars)# column names

#Plan how would you like to summarise this dataset

#dplyr - mtcars
library(dplyr)
df = mtcars# creating copy of datset
df$carnames = rownames(mtcars)# creating row name with name carname
df = cbind(cars=rownames(mtcars), mtcars)
df %>% mutate(add_c)
head(df)
head(df)
#Filter----
filter(df, cyl == 8) %>% select(cars, mpg,cyl)# only 8 cylinder cars

filter(mtcars, cyl == 8)
filter(mtcars, cyl < 6)

# Multiple criteria
filter(mtcars, cyl < 6 & vs == 1)
filter(mtcars, cyl < 6 | vs == 1)# | or

# Multiple arguments are equivalent to and
filter(mtcars, cyl < 6, vs == 1)# comma is similar to and

#Select rows 
#by rownumber
filter(mtcars, row_number() == 1L)# 1 L means integer value 
filter(mtcars, row_number() == n())# last one will be displayed
filter(mtcars, between(row_number(), 5, n()))# from 5 th to the last row
filter(mtcars, between(row_number(), 5, n()-1))
#slice-----
slice(mtcars, 1L)# print first row
slice(mtcars, n())# print last row
slice(mtcars, 5:n())# print between 5 to last row
slice(mtcars, c(2,4,5,10))
dim(slice(mtcars, seq(1,nrow(mtcars),2)))
slice(mtcars, seq(1,nrow(mtcars),2))

#mutate----
#create new columns based on existing columns
mutate(mtcars,mpg_new=mpg*1.2)
mutate(mtcars, displ_l = disp / 61.0237) #keeps other col

#GroupBy summary

mtcars %>% group_by(am) %>% summarise(mean(mpg), max(wt))
mtcars %>% group_by(am) %>% summarise(MEANMPG = mean(mpg), MAXWT= max(wt))
mtcars %>% group_by(am, gear) %>% summarise_all(mean)# mean of all columns
mtcars %>% group_by(am, gear)%>% summarise_all(c("min", "max"))

#specific columns
mtcars %>% summarise_at(c("mpg", "wt"), mean, na.rm = TRUE)# na.rm means remove value
(x=c(5,6,7,NA))
mean(x,na.rm=TRUE)# removing values like NA by using rm
#select rows on the basis of sample

sample_frac(mtcars, 0.2, replace=F)
sample_n(mtcars, 5, replace=F) %>% select(mpg)# only 5 mileages will be printed# false helps in prevneting duplication of data
mtcars%>%sample_n(5,replace=T)%>%select(mpg,wt,gear)
mtcars%>%sample_n(10,replace=F)%>%select(mpg,wt,gear)%>%group_by(gear)%>%summarise(mean(mpg),min(hp),min_wt=min(wt))
mtcars %>% sample_n(10,replace=F) %>% select(mpg,wt,gear,hp) %>% group_by(gear) %>% summarise(mean(mpg), min(hp), min_wt=min(wt)) %>% arrange(-min_wt)


#Rows having least mpg (last 2)
top_n(mtcars,-2, mpg)
top_n(mtcars,5,mpg)
mtcars %>% arrange(-mpg)
select(mtcars, mpg) %>% arrange(desc(mpg))
mtcars %>% select(mpg)%>% hist(mpg)
library(ggplot2)
ggplot(mtcars, aes(x=mpg)) + geom_histogram(bins=10)
ggplot(data=mtcars, aes(x=gear)) +
  geom_bar(stat="count",color="red",fill="green")
ggplot(data=mtcars, aes(x=gear,fill=factor(gear))) +
  geom_bar(stat="count")
# hypothesis
x=rnorm(10)
y=rnorm(10)
x
y
t.test(x,y)
