library(tidyverse)
library(stringr)
library(janitor)
library(here)
df <- read_csv(here("data-raw", "all.csv"), col_names = TRUE)

qtr <- str_split(df$Qualtrics, pattern = "\\((?=[^(]*$)", simplify = TRUE) %>% as.tibble()
names(qtr) <- c("country", "number")

qtr <-  qtr %>%
  mutate(
    country = str_trim(country),
    number = str_extract(number, "\\d+")
)
df <- df %>% mutate(Qualtrics = qtr$number)
write_csv(df, here("data", "countries.csv"))
