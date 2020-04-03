## Perform calculations

# variables -- store information 
# prefer assignment operator '<-' when assigning variable
a <- 2 + 2

## Type assignment operator with Alt + -
MySum <- 2 + 2

# assign a value. But looks like '3 = 4'
mySum = 5
# assignment <- or ->
5 -> mySum
## Error, fixed value cannor change
5 -> 4
5 = 4

## Multiple assignment at same time
mySum1 <- mySum2 <- 6
# confusing
mySum1 <- 6 -> mySum2

## variable can store a group of values (vector)
## c() means concatenate -- combine them
## vector
myNumbers <- c(2, 3, 4, 5, 6, 10, 13) 


# Transformation on every number
myNumbers + 1
myNumbers - 1

## Character (char) variable
## Characters are enclosed in ""
myChar <- c("M","F","F","F","F","F","M","M","M")

## Mathematical operations cannot be done on char 
# Error
"Abc" +1

## Grouping variable
## Factor
Genders <- factor(c("M","F","F","F","F","F","M","M","M"))

## Logical variable: TRUE or T, and FALSE or F
myLogical <- (5 > 4)
myLogical1 <- (5 < 4)
myLogical2 <- (5 == 4)

myLogical3 <- myNumbers > 6

## AND - &, OR - |
myNumbers
## Greater than 3 and less than 10
comp1 <- (myNumbers > 3) & (myNumbers < 10)
## Less than 3 or greater than 10
comp2 <- (myNumbers < 3) | (myNumbers > 10)

## Logicals are stored as 1 / 0
## TRUE equals 1
## FALSE equals 0
comp1
sum(comp1)

comp2
sum(comp2)


############################################################
## Types of vectors
## Numeric, character, logical and factor
############################################################
## Functions
# functions -- apply transformation (on variables)
# input -- transformation -- output
# name_of_function(inputs) # value returned is output

mode(myNumbers)
mode(myChar)
mode(myLogical)
mode(Genders)
?mode

as.numeric(Genders)
Genders


## Length
length(myNumbers)
length(Genders)

## Helpful functions for Factor variable
## To see the groups of a factor variable
levels(Genders)
## To see number of samples in each group
table(Genders)

## Square root
## Function: sqrt()
sqrt(myNumbers)
mySqrt <- sqrt(myNumbers)

## Logarithm: log2, log10, log
myLog <- log10(myNumbers)
?log10
myNumbers
log(myNumbers, base = 10)
log(myNumbers, base = 2)
log(myNumbers, base = 3)

log(x = myNumbers, base = 10)
## Argument matching by position
log(myNumbers, 10)

## Average of numbers
myAvg <- mean(myNumbers)

## Standard deviation
myStd <- sd(myNumbers)

###########################################################
## myNumbers has seven numbers
myNumbers
## g is positional
# extract a specific position from myNumbers
# 'Subsetting' []
myNumbers[1]

## subset first and third element of first dimension
myNumbers[c(1,3)] ## one-dimensional vector / array

## Negative subsetting
myNumbers[-c(1)]

## specify a range
myNumbers[c(1:3)]
myNumbers[c(5:3)]

## Error
myNumbers[1,3] ## First element of first dimension, and third element of second dimension

## Greater than 3 and less than 10
comp1 <- (myNumbers > 3) & (myNumbers < 10)
comp1

myNumbers[comp1]

## Less than 3 or greater than 10
comp2 <- (myNumbers < 3) | (myNumbers > 10)
comp2

myNumbers[comp2]


## Inversion -- !
## !TRUE equals FALSE
## !FALSE equals TRUE

myNumbers
## Greater than 3 and less than 10
comp1

## Less than or equal to 3 and greater than or equal to 10
!comp1
myNumbers[!comp1]
## The opposite of 
myNumbers[comp1]

## What is the proportion of numbers in myNumbers 
## that are greater than 3 and less than 10
## Hint: use length()





length(myNumbers[comp1]) / length(myNumbers)

