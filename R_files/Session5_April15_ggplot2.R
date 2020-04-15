library(ggplot2)
library(readxl)
library(tibble)
library(tidyverse)
library(ggpubr)

##########
Expe <- read_xls(path = "Session4 Files/ExperimentTwoDrugs.xls")
library(readxl)
getwd()
list.files()

setwd("Desktop/R/")

Expe <- read_xls(path = "Session4 Files/ExperimentTwoDrugs.xls")

glimpse(Expe)
library(tibble)
View(Expe)

Expe %>%
  pivot_longer(cols = , everything(), 
               names_to = "Treatment", 
               values_to = "Cells") %>%
  drop_na %>%
  arrange(Treatment) ->
  Expe
library(tidyr)
library(dplyr)

library(ggplot2)
p.2Drug <- ggplot(data = Expe, mapping = aes(x = Treatment, y = Cells))
p.2Drug + geom_boxplot() 


p.2Drug + geom_boxplot() + geom_jitter() 

p.2Drug + geom_boxplot() + geom_jitter(mapping = aes(color = Treatment), size = 2)

p.2Drug + 
  geom_boxplot(color = "grey", outlier.shape = NA) + 
  geom_jitter(mapping = aes(color = Treatment)) -> p.final

p.final

ggsave(filename = "myPlot.svg")

library(ggpubr)

p.final + theme_classic() + 
  stat_compare_means(method = "anova")

p.final + theme_classic() + 
  stat_compare_means(method = "anova", label.y = 19) +
  stat_compare_means(ref.group = "Control", 
                     label.y = 18, 
                     label = "p.signif", 
                     cex = 10) +
  theme(legend.position = "top")


my_comparisons <- list(c("Control", "Drug1"),
                       c("Drug1", "Drug2"),
                       c("Control", "Drug2"))

# ## Put the first one in the middle
# my_comparisons <- combn(x = c("Drug1","Control",  "Drug2"), m = 2, simplify = F)
# 
# my_comparisons <- combn(x = unique(Expe$Treatment), m = 2, simplify = F)


p.final + theme_classic() + 
  stat_compare_means(method = "anova", label.y = 23) +
  stat_compare_means(comparisons = my_comparisons,
                     label = "p.signif", 
                     cex = 10, method = "t.test") +
  theme(legend.position = "top")

############################

Experiment <- read_xls(path = "Session4 Files/ExperimentWithFeatures.xls", 
                       sheet = 1)
glimpse(Experiment)

pivot_longer(data = Experiment, 
             cols = -Day, 
             names_to = c(".value", "Treatment"), 
             names_sep = "_") %>%
  drop_na %>%
  arrange(Treatment) -> Experiment

glimpse(Experiment)


## Plot cells against Treatment, separated by gender.
## Label them with age and day of collection
p <- ggplot(data = Experiment, mapping = aes(y = Cells, x = Treatment))
p + geom_boxplot() + 
  geom_jitter(aes(color = Treatment))


p + geom_boxplot() + 
  geom_jitter(aes(color = Gender, shape = Day), size = 3)


p + geom_boxplot() + 
  geom_jitter(aes(color = Age, shape = Day), size = 3)


## Facet
p + geom_boxplot() + 
  geom_jitter(aes(color = Age, shape = Day)) + 
  facet_grid(~Gender)


## Plot of Cells vs. Gender, colored by Day of sample collection, and separated by Treatment
p <- ggplot(data = Experiment, mapping = aes(y = Cells, x = Gender))
p + geom_boxplot() + geom_jitter(aes(color = Day)) + facet_grid(~Treatment)


## Plot cells vs age, colored by Treatment, separated by gender, shaped by Day
p <- ggplot(data = Experiment, mapping = aes(y = Cells, x = Age))
p + geom_point(aes(color = Treatment, shape = Day), size = 3, alpha = 0.8) + 
  facet_grid(~Gender)


## Plot data with significance labels
p <- ggplot(data = Experiment, mapping = aes(y = Cells, x = Treatment))
p + geom_boxplot() + stat_compare_means(method = "t.test", 
                                        label = "p.signif", 
                                        ref.group = "Control", 
                                        label.y = 16.5, cex = 10) 


p + geom_boxplot() + stat_compare_means(method = "t.test", 
                                        label = "p.signif", 
                                        ref.group = "Control", 
                                        label.y = 16.5, cex = 10) + 
  geom_jitter(aes(color = Age, shape = Day)) + 
  facet_grid(~Gender)



## END
