install.packages("DBI")
install.packages("RMySQL")

library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")
dbListTables(MyDataBase)
dbListFields(MyDataBase, 'CountryLanguage')
DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")

head(DataDB)


library(dplyr)
esp <-  DataDB %>% filter(Language == "Spanish") 
head(esp)

install.packages("ggplot2")
library(ggplot2)

ggplot(esp, aes( x = CountryCode, y=Percentage, fill = IsOfficial )) + 
  geom_bar (stat="identity")  +
  coord_flip()


#cambio prueba
