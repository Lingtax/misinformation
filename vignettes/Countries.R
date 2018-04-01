## ----include=FALSE-------------------------------------------------------
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

## ------------------------------------------------------------------------
# obtain the frequency of each country
freq <- a %>% group_by(country) %>% count() 
a <- a %>% left_join(freq)

# bind to country data
b <- joinCountryData2Map(a, joinCode = "ISO3", nameJoinColumn = "alpha_3")

# plot graph
par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
mapBubbles(dF=b,
           nameZSize="n",
           nameZColour = "region",
           oceanCol="lightblue",
           landCol="wheat")

## ---- fig.show='hold'----------------------------------------------------
CreateTableOne("sub_region", data = a)
ggplot(a, aes(region)) + geom_bar()

