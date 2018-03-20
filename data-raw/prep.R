library(tidyverse)
library(stringr)
library(janitor)
df <- read_csv("country_coding.csv", col_names = FALSE)

df <- str_split(df$X1, pattern = "\\((?=[^(]*$)", simplify =TRUE) %>% as.tibble() 
names(df) <- c("country", "number")

df <-  df %>% 
  mutate(
    country = str_trim(country),
    number = str_extract(number, "\\d+")
)

write_csv(df, "cnt_code.csv")
