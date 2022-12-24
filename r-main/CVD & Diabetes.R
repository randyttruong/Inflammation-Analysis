library(tidyverse)
library(readr)

#load data
hispanic_df <- read_csv("Hispanic.csv")
white_df <- read_csv("Non_hispanic_white.csv")
black_df <- read_csv("Non_hispanic_black.csv")
asian_df <- read_csv("Asians.csv")

#define a race column to be added when data is cleaned
race_column_asian <- c("Asian", "Asian")
race_column_black <- c("Black", "Black")
race_column_hispanic <- c("Hispanic", "Hispanic")
race_column_white <- c("White","White")


#rename variables, select question and mean columns, filter CVD and 
#Diabetes row, add a column for race, and rename that column 
clean_hispanic_df <- hispanic_df %>%
  rename(Question = ...1) %>%
  select(c(1,2)) %>%
  filter(Question %in% c("Diagnosed with any CVD",
                         "Ever diagnosed with diabetes W5")) %>%
  cbind(race_column_hispanic) %>%
  rename(Race = race_column_hispanic)
  
clean_white_df <- white_df %>%
  rename(Question = ...1) %>%
  select(c(1,2)) %>%
  filter(Question %in% c("Diagnosed with any CVD",
                         "Ever diagnosed with diabetes W5")) %>%
  cbind(race_column_white) %>%
  rename(Race = race_column_white)

clean_black_df <- black_df %>%
  rename(Question = ...1) %>%
  select(c(1,2)) %>%
  filter(Question %in% c("Diagnosed with any CVD",
                         "Ever diagnosed with diabetes W5")) %>%
  cbind(race_column_black) %>%
  rename(Race = race_column_black)

clean_asian_df <- asian_df %>%
  rename(Question = ...1) %>%
  select(c(1,2)) %>%
  filter(Question %in% c("Diagnosed with any CVD",
                         "Ever diagnosed with diabetes W5")) %>%
  cbind(race_column_hispanic) %>%
  rename(Race = race_column_hispanic)



#join dfs together by questions column 
white_and_hispanic_df %>%
  inner_join(clean_white_df,clean_hispanic_df, 
                                    by = "Question" )
 # pivot_longer(
 #   cols = -Question,
 #   names_to = "Race.x",
 #   values_to = "Mean.x" 
 # )

black_and_asian_df <- inner_join(clean_asian_df, clean_black_df,
                                 by = "Question")
all_races_df <- inner_join(white_and_hispanic_df, black_and_asian_df, 
                           by = "Question")
#visualize 

