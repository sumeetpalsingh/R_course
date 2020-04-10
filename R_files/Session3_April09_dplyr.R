mtcars

## Explore
?mtcars
summary(mtcars)
View(mtcars)
str(mtcars)
head(mtcars)
tail(mtcars)
plot(mtcars)


## Size of dataset
dim(mtcars)
ncol(mtcars) ## Number of feature
nrow(mtcars) ## Number of observations

## Parameters
colnames(mtcars)
rownames(mtcars)

## Subsetting
mtcars[c("Mazda RX4", "Mazda RX4 Wag"), c("mpg", "hp")]

## Single column, a vector
mtcars$mpg

## Specific Rows and columns
mtcars[c("Mazda RX4", "Mazda RX4 Wag"), c("mpg", "hp")]

## Horsepower vs. Engine shape
boxplot(hp ~ vs, data = mtcars)

t.test(hp ~ vs, data = mtcars)

## Horsepower vs. gear
boxplot(hp ~ gear, data = mtcars)

hp.gear.model <- aov(hp ~ gear, data = mtcars)
summary(hp.gear.model)

TukeyHSD(hp.gear.model)

## gear is not defined as a factor, but a number
hp.gear.model <- aov(hp ~ as.factor(gear), data = mtcars)
summary(hp.gear.model)

TukeyHSD(hp.gear.model)

## Correlation
cor(mtcars$hp, mtcars$mpg)

plot(hp ~ mpg, data = mtcars, 
     col = gear, pch = 19)


## Average hp for each gear
aggregate(formula = hp ~ gear, data = mtcars, FUN = mean)

## Sort 
mtcars[order(-mtcars$cyl, mtcars$mpg),]

## What is the average mpg of cars that have hp > 80

ishpgrt80 <- mtcars$hp > 80
mtcars.selected <- mtcars[ishpgrt80, ]
mean(mtcars.selected$mpg)

mean(mtcars[mtcars$hp > 80,]$mpg)


##
library(dplyr)

##

## View the data
glimpse(mtcars)

## sort the data
arrange(mtcars, desc(cyl), mpg)

## Keep desired columns
select(mtcars, mpg, cyl)

## Keep selected cases (samples)
filter(mtcars, hp > 80)

## get aggregate statistics
summarise(mtcars, meanMPG = mean(mpg))

## Pipe operator %>% (Command + Shift + m) (Control + Shift + m)

## Mean mpg for cars with hp > 80

## Base R
mean(mtcars[mtcars$hp > 80,]$mpg)

## dplyr
mtcars %>% 
  filter(hp > 80) %>% 
  select(mpg) %>% 
  summarise(mean = mean(mpg))


## Get mean hp for cars with single gear

## group_by()

mtcars %>%
  group_by(gear) %>%
  summarise(meanHP = mean(hp))

## group_by()
mtcars %>%
  group_by(gear) %>%
  summarise_all(mean)

## mutate -- Add a new column

## Option # 1 (Pipe)
mtcars %>% 
  ## generate the ratio of hp to mpg
  mutate(hp_mpg = hp / mpg) %>%
  ## Keep values with hp to mpg ratio of 9
  filter(hp_mpg > 9) %>%
  ## Count the number of gears 
  select(gear) %>%
  table %>%
  ## Make a pie chart
  pie

dev.off()

## Option # 2: Intermediate variables
mtcars$hp_mpg <- mtcars$hp / mtcars$mpg
mtcars.selected <- mtcars[mtcars$hp_mpg > 9, "gear"]
pie(table(mtcars.selected))

dev.off()

## Option #3: One line
pie(table(mtcars[(mtcars$hp / mtcars$mpg) >9,]$gear))
