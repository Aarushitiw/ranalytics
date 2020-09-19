library(dplyr)
mtcars
head(mtcars)
mtcars %>% group_by(am)%>% summarise(n=n(),meanmpg=mean(mpg))# uget a resukt tha autonatic has 19 cars and their mileage is 17.1 whereas manual has 13 cars and their mileage is 24.4# automatic is 0 anf manual is 1
mtcars %>% group_by(am,cyl)%>% summarise(n=n(),meanmpg=mean(mpg))
mtcars %>% group_by(am,cyl)%>% summarise(n=n(),meanmpg=mean(mpg), maxhp=max(hp))
table(mtcars$cyl)# shows there are 4 cylinder, 6 cylinder and 8 cylinder cars
mtcars%>%filter(cyl%in%c(4,8))%>%group_by(cyl)%>% summarise(n=n(),meanmpg=mean(mpg), maxhp=max(hp))
