library(tidyverse)
library(readr)

# Load data ---------------------------------------------------------------------
hispanic_df <- read_csv("Hispanic.csv")
white_df <- read_csv("Non_hispanic_white.csv")
black_df <- read_csv("Non_hispanic_black.csv")
asian_df <- read_csv("Asians.csv")

# Tidy dataframes ---------------------------------------------------------------

# The original CSVs do not include a key for race because each CSV is 
# seperated by race. So, I am creating a column for race here to be 
# added to each dataframe later in the code.

race_column_asian <- c("Asian")
race_column_black <- c("Black")
race_column_hispanic <- c("Hispanic")
race_column_white <- c("White")

tidy_hispanic_df <- hispanic_df %>%
  rename(Question = ...1) %>% 
  # Column ...1 contains the descriptor questions of the data
  select(c(Question,Mean)) %>%  
  filter(
    Question %in% 
    c("Diagnosed with any CVD",
        "Ever diagnosed with diabetes W5")
    ) %>%
  pivot_wider(names_from = Question, values_from = Mean) %>% 
  # Seperate CVD and Diagnosis mean into their own columns
  cbind(race_column_hispanic) %>%
  rename(
    Race = race_column_hispanic,
    Mean_CVD_Diagnosis = "Diagnosed with any CVD",
    Mean_Diabetes_Diagnosis = "Ever diagnosed with diabetes W5"
    ) 

tidy_white_df <- white_df %>%
  rename(Question = ...1) %>%
  select(c(Question,Mean)) %>%
  filter(
    Question %in% 
      c("Diagnosed with any CVD",
        "Ever diagnosed with diabetes W5")
    ) %>%
  pivot_wider(names_from = Question, values_from = Mean) %>%
  cbind(race_column_white) %>%
  rename(
    Race = race_column_white,
    Mean_CVD_Diagnosis = "Diagnosed with any CVD",
    Mean_Diabetes_Diagnosis = "Ever diagnosed with diabetes W5"
    )

tidy_asian_df <- asian_df %>%
  rename(Question = ...1) %>%
  select(c(Question,Mean)) %>%
  filter(
    Question %in% 
    c("Diagnosed with any CVD",
      "Ever diagnosed with diabetes W5")
    ) %>%
  pivot_wider(names_from = Question, values_from = Mean) %>%
  cbind(race_column_asian) %>%
  rename(
    Race = race_column_asian,
    Mean_CVD_Diagnosis = "Diagnosed with any CVD",
    Mean_Diabetes_Diagnosis = "Ever diagnosed with diabetes W5"
    )

tidy_black_df <- black_df %>%
  rename(Question = ...1) %>%
  select(c(Question,Mean)) %>%
  filter(
    Question %in% 
      c("Diagnosed with any CVD",
        "Ever diagnosed with diabetes W5")) %>%
  pivot_wider(names_from = Question, values_from = Mean ) %>%
  cbind(race_column_black) %>%
  rename(
    Race = race_column_black,
    Mean_CVD_Diagnosis = "Diagnosed with any CVD",
    Mean_Diabetes_Diagnosis = "Ever diagnosed with diabetes W5"
    )

# Join dataframes ---------------------------------------------------------------

# Since full_join() only works for two dfs, I joined white & hispanic, 
# black & asian, then joined those two together

white_and_hispanic_df <- full_join(
                                   tidy_white_df,
                                   tidy_hispanic_df, 
                                   by = "Race" 
                                   ) %>%
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
   # pivot_longer() changed the values of Mean_CVD_Diagnosis.x and 
   # Mean_Diabetes_Diagnosis.x to the titles of the two columns tidied.
   # So, here I leave those columns out of selection.
   filter(!is.na(Mean_CVD_Diagnosis), !is.na(Mean_Diabetes_Diagnosis))
   # pivot_longer() created missing values 

black_and_asian_df <- full_join(
                                tidy_black_df,
                                tidy_asian_df, 
                                by = "Race" 
                                ) %>%
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

all_races_df <- full_join(
                          white_and_hispanic_df, 
                          black_and_asian_df, 
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

#Visualize data ----------------------------------------------------------------
ggplot(
  all_races_df, 
  aes(x = Mean_CVD_Diagnosis, y = Mean_Diabetes_Diagnosis,color = Race)) +
  geom_point()

ggplot(all_races_df, aes(x= Mean_CVD_Diagnosis, fill = Question)) +
  geom_histogram(bins = 10) + 
  facet_wrap(~ Race)

  

  
