## Calculations

myVariable <- 4 + 4
myVariable

## Vectors

myNumbers <- c(2, 5, 8, 10, 56)

??Random

RndNumber <- sample.int(n = 100, size = 10, replace = TRUE)
RndNumber

??NormalDistribution
?Normal

set.seed(123)
NormRanNumbers <- rnorm(10)
NormRanNumbers


###
myChars <- c("Hello", "Hi", "Bojour", "Hallo")
## Each element is called a string

myChars + 1

## Addition for character vector is paste

?paste
## We want to add "World" to each greeting

paste(myChars, "World", sep = "_")

paste(myChars, 1:4, sep = ".")

paste(myChars, 1:2, sep = ".")

myChars1 <- c(myChars, 
              "Namaste", "Konnichiwa","Mochi Mochi")

## Logical Vector
## TRUE and FALSE

myLogical <- NormRanNumbers > 0

## TRUE = 1
## FALSE = 0

sum(myLogical)

## Percentage of success 

(sum(myLogical) / length(myLogical))*100


## Factor vector
## Define grouping (Control vs. Drug)

## Bag of Red, Green and Blue balls
## Remove 10 balls
## 3 X Red, 3 X Blue, 2 X Green, Red, Green

myFactor <- factor(c(rep("Red", 3),
                     rep("Blue", 3),
                     rep("Green", 2), "Red", "Green"))
?rep

myFactor

table(myFactor)

## Proportions of elements in each group

table(myFactor) / length(myFactor)

## Pie chart

pie(table(myFactor))
###

## Make a boxplot for Sepal length vs Species

?boxplot
boxplot(formula = Sepal.Length ~ Species, data = iris)

## Make a boxplot for Petal Length vs Species
boxplot(formula = Petal.Length ~ Species, data = iris)

## Ratio of Sepal Length to Petal Length, plotted vs Species

## Subsetting: extract a part of data structure

## []

RndNumber[c(1:5)]

# Subsetting for df: data.frame[ row, column]

## If you do not specify, give all 
getSepalLenght <- iris[ , 1]
getSepalLenght
length(getSepalLenght)

getPetalLenght <- iris[,3]

ratioSepal_Peta_Length <- getSepalLenght / getPetalLenght

## Subset a column with a shortcut

iris$Sepal.Length is exactly same as iris[ ,1]

ratio_Sepal_Petal_Length_2 <- iris$Sepal.Length / iris$Petal.Length

iris[,1]
iris[,"Sepal.Length"]
iris$Sepal.Length

iris$RatioS_P_Len <- ratio_Sepal_Petal_Length_2

iris$RatioS_P_Len <- iris$Sepal.Length / iris$Petal.Length

head(iris)

boxplot(RatioS_P_Len ~ Species, data = iris)

### Statistical Analysis
## Sepal Length is statistically different between species
anova.model <- aov(Sepal.Length ~ Species, data = iris)

summary(anova.model)

TukeyHSD(x = anova.model)

#### 
## df[row, column] ## By number or "name"
## Only columns df$column

## First three rows and first two columns
iris[1:3, 1:2] ## result be a dataframe

iris[1:3, ]

iris[ , 1:2]

## How to get multiple columns by name
iris[ ,c("Sepal.Length", "Sepal.Width")]

## Error!!
iris$c("Sepal.Length", "Sepal.Width")

colnames(iris)

rownames(iris)

rownames(iris) <- paste0("Row", 1:nrow(iris))

dim(iris)

ncol(iris)

nrow(iris)

1:nrow(iris)

head(iris)

iris[c("Row1", "Row9", "Row128"), ]

## Conditional subsetting

## Get all information for setosa plants
## Subset the rows for which the Species equates to setosa

is.setosa <- (iris$Species == "setosa")

iris$Species == "setosa"

is.setosa
mode(is.setosa)


iris[is.setosa, ] 

### Obtain all plants with Sepal.Length > 5
## Get the distribution of species

is.SepalLengthgr3 <- (iris$Sepal.Length > 5)

iris.select <- iris[is.SepalLengthgr3, ]

iris.select
dim(iris.select)

table(iris.select$Species)

pie(table(iris.select$Species))

pie(table(iris[iris$Sepal.Length > 5, ]$Species))





