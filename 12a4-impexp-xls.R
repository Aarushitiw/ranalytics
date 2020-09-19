# Read Data into R Environment - to/fro XLS

#Excel----
#Create a excel file with data in 2 sheets
# first row contains variable names
#C:\Program Files\Java\jre1.8.0_261
Sys.setenv(JAVA_HOME='C:\\Program Files (X86)\\Java\\jre1.8.0_261')
library(xlsx)
library(rJava)
write.xlsx2(mtcars, file='./data/mtcars.xlsx', sheetName = 'mtcars1', row.names=F, append=F)#append=T means yu ar copying in the same file as a new sheet , whereas append=F means you are creating  an new sheet in the environment
df_excel1 = read.xlsx( "./data/iimS.xlsx", 1)
df_excel1

write.xlsx2(iris, file='./data/mtcars.xlsx', sheetName = 'iris1', row.names=F, append=T)
df_excel2 = read.xlsx( "./data/mtcars.xlsx", 2)
df_excel2

write.xlsx2(iris, file='./data/mtcars.xlsx', sheetName = 'iris2', row.names=F, append=T)
df_excel2b = read.xlsx( "./data/mtcars.xlsx", 'iris2')
df_excel2b
#see the excel sheet in data folder: windows explorer

library(readxl)  #for reading only, faster

df_rxl1 <- readxl::read_excel( "./data/rdata.xlsx", 'college')
head(df_rxl1)
df_rxl2 <- readxl::read_excel( "./data/rdata.xlsx", 'name')
head(df_rxl2)
df_rxl2b <- readxl::read_excel( "./data/rdata.xlsx", 2)# instead of <- we can also use = and it wont impact anything
head(df_rxl2b)

readxl::excel_sheets("./data/rdata.xlsx")  #names of sheets
?`readxl-package`
#end here