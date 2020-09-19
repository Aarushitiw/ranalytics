#topics ----
#factors, env, import/export. package install
#rep, recode, split, partition, subset, loops, cast & melt
#missing values. duplicates, apply
#graphs - bar, multiple line, pie, box, corrgram
# predict weight for certain height

women
head(women)
dim(women)
plot(women)
cor(women)# strength and direction of relationship -1 to 0 to +1# if your height increase your weight increases
cor(women$height,women$weight)#shows that they have strong correlation
plot(mtcars$wt,mtcars$mpg)#negative correlation
cov(women)# tells you direction of relation and not the strength
cov(women$height,women$weight)
#is height the cause of change in weight??-linear regression
fit = lm(weight ~ height,data = women)
summary(fit)
y=mx+c     
weight=height*m+c
weight=3.45*height+(-87.51667)


# rsquare is calledx the coefficient of determination, 0% means none of the variability is round the mean # in simple linaer regresiion u use multiple r sqaure value# 99% of the variation in wieght is due to height or .119 % change in weight we dont know why it is
range(women$height)# can olnly predict height between 58 and 72 as specified by the range# the single * also means that the independent variable will have impact on dependen variable
(ndata = data.frame(height = c(60.5, 70.5, 71.5)))
(predictedwt = predict(fit, newdata = ndata))
cbind(ndata, predictedwt)

resid(fit)
fitted(fit)
cbind(women, fitted(fit), resid(fit))
#assumptions
plot(fit)
#multiple linear regression
head(mtcars)
df <-mtacrs %>% select(mpg,wt,hp)
head(df)
fit2=lm(mpg~ wt+hp,data=df)
summary(fit2)
mpg=37+ -3.87 *wt+-.03*hp
resid(fit2)
df$mpg
fitted(fit2)
cbind(df$mpg,fitted(fit2),resid(fit2))
#Adjusted r square 81.48% of the vraiation in milegae is using weight and horsepower
# p value tells u wether the model exists
# should we keep weight in the model is determined by the stars if there is a single star it means that it should be taken into consideration
# assumptions of linear regression go through
# residuals are the gap between predicted and the actual values
residuals(fit2)
df$mpg-fitted(fit2)#predicted values
resid(fit2)==residuals(fit2)
plot(fit2)
women
df2=women
df3=rbind(df2,c(73,500))
fit2b=lm(weight~height,data=df3)
summary(fit2b)
# now it has one star and not 3 stars , its dependece on height has decreased tremendously
plot(fit2b)
# see the 16th row , becase of the outlier 16 th
