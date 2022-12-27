library(tidyverse)
library(readr)

#load data
hispanic_df <- read_csv("Hispanic.csv")
white_df <- read_csv("Non_hispanic_white.csv")
black_df <- read_csv("Non_hispanic_black.csv")
asian_df <- read_csv("Asians.csv")

#create race column
race_column_asian <- c("Asian")
race_column_black <- c("Black")
race_column_hispanic <- c("Hispanic")
race_column_white <- c("White")

#clean df
clean_hispanic_df <- hispanic_df %>%
  rename(Question = ...1) %>%
  select(c(1,2)) %>%
  filter(Question %in% c("Diagnosed with any CVD",
                         "Ever diagnosed with diabetes W5")) %>%
  pivot_wider(names_from = Question, 
              values_from = Mean ) %>%
  cbind(race_column_hispanic) %>%
  rename(Race = race_column_hispanic,
         Mean_CVD_Diagnosis = "Diagnosed with any CVD",
         Mean_Diabetes_Diagnosis = "Ever diagnosed with diabetes W5") 

clean_white_df <- white_df %>%
  rename(Question = ...1) %>%
  select(c(1,2)) %>%
  filter(Question %in% c("Diagnosed with any CVD",
                         "Ever diagnosed with diabetes W5")) %>%
  pivot_wider(names_from = Question, 
              values_from = Mean ) %>%
  cbind(race_column_white) %>%
  rename(Race = race_column_white,
         Mean_CVD_Diagnosis = "Diagnosed with any CVD",
         Mean_Diabetes_Diagnosis = "Ever diagnosed with diabetes W5")

clean_asian_df <- asian_df %>%
  rename(Question = ...1) %>%
  select(c(1,2)) %>%
  filter(Question %in% c("Diagnosed with any CVD",
                         "Ever diagnosed with diabetes W5")) %>%
  pivot_wider(names_from = Question, 
              values_from = Mean ) %>%
  cbind(race_column_asian) %>%
  rename(Race = race_column_asian,
         Mean_CVD_Diagnosis = "Diagnosed with any CVD",
         Mean_Diabetes_Diagnosis = "Ever diagnosed with diabetes W5")

clean_black_df <- black_df %>%
  rename(Question = ...1) %>%
  select(c(1,2)) %>%
  filter(Question %in% c("Diagnosed with any CVD",
                         "Ever diagnosed with diabetes W5")) %>%
  pivot_wider(names_from = Question, 
              values_from = Mean ) %>%
  cbind(race_column_black) %>%
  rename(Race = race_column_black,
         Mean_CVD_Diagnosis = "Diagnosed with any CVD",
         Mean_Diabetes_Diagnosis = "Ever diagnosed with diabetes W5")

#join dfs together 
white_and_hispanic_df <- full_join(clean_white_df,clean_hispanic_df, 
                                    by = "Race" ) %>%
   pivot_longer(
     cols = c(Mean_CVD_Diagnosis.x,Mean_CVD_Diagnosis.y),
     names_to = "Mean_CVD_Diagnosis.x",
     values_to = "Mean_CVD_Diagnosis"
   ) %>%
   pivot_longer(
    cols = c(Mean_Diabetes_Diagnosis.x,Mean_Diabetes_Diagnosis.y),
    names_to = "Mean_Diabetes_Diagnosis.x",
    values_to = "Mean_Diabetes_Diagnosis"
   ) %>%
   select(c(Mean_CVD_Diagnosis, Mean_Diabetes_Diagnosis, Race)) %>%
   filter(!is.na(Mean_CVD_Diagnosis), !is.na(Mean_Diabetes_Diagnosis))

black_and_asian_df <- full_join(clean_black_df,clean_asian_df, 
                                by = "Race" ) %>%
  pivot_longer(
    cols = c(Mean_CVD_Diagnosis.x,Mean_CVD_Diagnosis.y),
    names_to = "Mean_CVD_Diagnosis.x",
    values_to = "Mean_CVD_Diagnosis"
  ) %>%
  pivot_longer(
    cols = c(Mean_Diabetes_Diagnosis.x,Mean_Diabetes_Diagnosis.y),
    names_to = "Mean_Diabetes_Diagnosis.x",
    values_to = "Mean_Diabetes_Diagnosis"
  ) %>%
  select(c(Mean_CVD_Diagnosis, Mean_Diabetes_Diagnosis, Race)) %>%
  filter(!is.na(Mean_CVD_Diagnosis), !is.na(Mean_Diabetes_Diagnosis))   

#join all dfs together 
all_races_df <- full_join(white_and_hispanic_df, black_and_asian_df, 
                          by = "Race") %>%
  pivot_longer(
    cols = c(Mean_CVD_Diagnosis.x,Mean_CVD_Diagnosis.y),
    names_to = "Mean_CVD_Diagnosis.x",
    values_to = "Mean_CVD_Diagnosis"
  ) %>%
  pivot_longer(
    cols = c(Mean_Diabetes_Diagnosis.x,Mean_Diabetes_Diagnosis.y),
    names_to = "Mean_Diabetes_Diagnosis.x",
    values_to = "Mean_Diabetes_Diagnosis"
  ) %>%
  select(c(Mean_CVD_Diagnosis, Mean_Diabetes_Diagnosis, Race)) %>%
  filter(!is.na(Mean_CVD_Diagnosis), !is.na(Mean_Diabetes_Diagnosis))

#visualize
ggplot(all_races_df, aes(x = Mean_CVD_Diagnosis, y = Mean_Diabetes_Diagnosis,
                         color = Race)) +
  geom_point()

ggplot(all_races_df, aes(x= Mean_CVD_Diagnosis, fill = Question)) +
  geom_histogram(bins = 10) + 
  facet_wrap(~ Race)

  

  
