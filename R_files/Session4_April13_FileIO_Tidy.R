setwd("Desktop/R/")

library(dplyr)
library(readxl)
library(tibble)
library(tidyr)
library(stringr)

## Read files
Expe <- read_xls(path = "Session4 Files/ExperimentTwoDrugs.xls")
glimpse(Expe)

##
Expe %>%
  pivot_longer(cols = , everything(), 
               names_to = "Treatment", 
               values_to = "Cells") %>%
  drop_na %>%
  arrange(Treatment) %>%
  print(n = 40) ->
  Expe

## Find mean
Expe %>%
  group_by(Treatment) %>%
  summarise(MeanCells = mean(Cells))

## Find standard deviation
Expe %>%
  group_by(Treatment) %>%
  summarise(SdCells = sd(Cells))


## Coefficient of variation
Expe %>%
  group_by(Treatment) %>%
  summarise(Mean.Cells = mean(Cells), Sd.Cells = sd(Cells)) %>%
  mutate(CV.Cells = SdCells/MeanCells)

cv <- function(data){
  mean.data <- mean(data)
  sd.data <- sd(data)
  cv.data <- sd.data / mean.data
  return(cv.data)
}

source("myFunctions.R")

Expe %>%
  group_by(Treatment) %>%
  summarise(CV = cv(Cells))

Expe %>%
  group_by(Treatment) %>%
  summarise(Mean.Cells = mean(Cells), Sd.Cells = sd(Cells), CV.cells = cv(Cells))

## Standard error of mean
Expe %>%
  group_by(Treatment) %>%
  summarise(Mean.Cells = mean(Cells), Sd.Cells = sd(Cells), Number.Obs = n()) %>%
  mutate(SEM.Cells = Sd.Cells/sqrt(Number.Obs))

sem <- function(data){
  sd.data <- sd(data)
  number.data <- length(data)
  sem.data <- sd.data / sqrt(number.data)
  return(sem.data)
}

Expe %>%
  group_by(Treatment) %>%
  summarise(Mean.Cells = mean(Cells), 
            Sd.Cells = sd(Cells), 
            Number.Obs = n(), 
            SEM.Cells = sem(Cells))

### Efficiency: variance / mean^2. Variance sd^2.
## Efficiency = sd^2 / mean^2

Expe %>%
  group_by(Treatment) %>%
  summarise(Mean.Cells = mean(Cells), 
            Sd.Cells = sd(Cells),
            Numeber.Obs = n()) %>%
  mutate(Efficiency.Treatment = Sd.Cells^2 / Mean.Cells^2)

#######################################################################
Experiment <- read_xls(path = "Session4 Files/ExperimentWithFeatures.xls", 
                       sheet = 1)
glimpse(Experiment)

pivot_longer(data = Experiment, 
             cols = -Day, 
             names_to = c(".value", "Treatment"), 
             names_sep = "_") %>%
  drop_na() %>%
  arrange(Treatment) ->
  Experiment


Experiment2 <- read_xls(path = "Session4 Files/ExperimentWithFeatures.xls", 
                        sheet = 2)
Experiment2 <- read_xls(path = "Session4 Files/ExperimentWithFeatures.xls", 
                        sheet = "BadNaming")
glimpse(Experiment2)

Experiment2 %>%
  rename(Cells_Control = Control,
        Age_Control = Age...2,
        Gender_Control = Gender...3,
        Cells_Drug = Drug,
        Age_Drug = Age...5,
        Gender_Drug = Gender...6) ->
  Experiment2
glimpse(Experiment2)

# ## reshape is base R
# reshape(data = Experiment2,
#         ## Wide to Long
#         direction = "long",
#         ## Specify Observations
#         ## Whatever is not specified is not unique Observation
#         varying = list(c(1,4), c(2,5), c(3,6)),
#         ## Names of final observation column
#         v.names=c("Cells","Age","Gender"),
#         ## Name of Groups
#         times = c("Control","Drug"),
#         ## Name of the column which will have groups (time)
#         timevar = "Treatment") %>%
#   ## Remove rows with missing variable
#   drop_na() %>%
#   ## Remove id column
#   select(-id)

glimpse(Experiment)
## Are # cells significantly different based on Treatment
Drug.Model.1 <- aov(formula = Cells ~ Treatment, data = Experiment)
plot(Drug.Model.1)
summary(Drug.Model.1)

## What if we control for Gender
Drug.Model.2 <- aov(formula = Cells ~ Treatment+Age, data = Experiment)
summary(Drug.Model.2)

TukeyHSD(Drug.Model)

anova(Drug.Model.1, Drug.Model.2)

## Interacting variable
Drug.Model.3 <- aov(formula = Cells ~ Treatment*Age, data = Experiment)
summary(Drug.Model.3)

TukeyHSD(Drug.Model)

anova(Drug.Model.1, Drug.Model.2, Drug.Model.3)
