###
# Titanic Data Aliasing and Wrangling
# @author Zane Billings
# @date 2019-11-26
###

library(tidyverse)
library(readxl)

titanic <- read_excel("titanic_data.xlsx")

# Make sure each variable is the correct type.
titanic <- titanic %>% 
  mutate(keyno = as.character(keyno),
         pclass = as.factor(pclass),
         survived = as.factor(survived),
         sex = as.factor(sex),
         embarked = as.factor(embarked))

# Relabel factors to make them more useful.
titanic <- titanic %>% 
  mutate(pclass = fct_recode(pclass, 
                             "First" = "1", 
                             "Second" = "2", 
                             "Third" = "3"),
         sex = fct_recode(sex,
                          "Male" = "male",
                          "Female" = "female"),
         survived = fct_recode(survived,
                               "Survived" = "1",
                               "Died" = "0"),
         embarked = fct_recode(embarked,
                               "Cherbourg" = "C",
                               "Queenstown" = "Q",
                               "Southampton" = "S"))

saveRDS(titanic, "titanic.Rda")
