## ------------------------------------------------------------------------
library(dplyr)
library(magrittr)
library(Qualtrics)
library(tableone)
library(rworldmap)
library(ggplot2)

## ----Chunk 1-------------------------------------------------------------
a <- tibble(qualtrics = sample(1:30, 60, replace=TRUE), id = 1:60)
countries <- countries

a <-  a %>% left_join(countries, by = "qualtrics")
CreateTableOne("country", data = a)

## ---- fig.show='hold'----------------------------------------------------
b <- joinCountryData2Map(a, joinCode = "ISO3", nameJoinColumn = "alpha_3")
#par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
#mapBubbles(dF=b,
#           oceanCol="lightblue",
#           landCol="wheat")

## ------------------------------------------------------------------------
CreateTableOne("region", data = a)

