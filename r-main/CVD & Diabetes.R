library(tidyverse)
library(readr)

#load data
hispanic_df <- read_csv("Hispanic.csv")
white_df <- read_csv("Non_hispanic_white.csv")
black_df <- read_csv("Non_hispanic_black.csv")
asian_df <- read_csv("Asians.csv")

#add id column, strip to only question and mean column
clean_hispanic_df <- hispanic_df %>%
  rename(Question = ...1, Mean_Hispanic = Mean) %>%
  select(c(1,2)) %>%
  filter(Question %in% c("Diagnosed with any CVD",
                         "Ever diagnosed with diabetes W5"))

clean_white_df <- white_df %>%
  rename(Question = ...1, Mean_White = Mean) %>%
  select(c(1,2)) %>%
  filter(Question %in% c("Diagnosed with any CVD",
                         "Ever diagnosed with diabetes W5"))

clean_black_df <- black_df %>%
  rename(Question = ...1, Mean_Black = Mean) %>%
  select(c(1,2)) %>%
  filter(Question %in% c("Diagnosed with any CVD",
                         "Ever diagnosed with diabetes W5"))

clean_asian_df <- asian_df %>%
  rename(Question = ...1, Mean_Asian = Mean) %>%
  select(c(1,2)) %>%
  filter(Question %in% c("Diagnosed with any CVD",
                         "Ever diagnosed with diabetes W5"))

#join dfs together by questions column 
white_and_hispanic_df <- inner_join(clean_white_df,clean_hispanic_df, 
                                    by = "Question" ) 
black_and_asian_df <- inner_join(clean_asian_df, clean_black_df,
                                 by = "Question")
all_races_df <- inner_join(white_and_hispanic_df, black_and_asian_df, 
                           by = "Question")
#visualize 

