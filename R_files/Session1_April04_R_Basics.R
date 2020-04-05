2 + 2

# Using R for simple calculations
a = 2 + 2
a

a + 2 ## Equates to 2 + 2 + 2

## Never names your in non-readable way
twoPlustwo = 2 + 2 

## Assignment operator <- <- 
twoPlustwo <- 2 + 2
mySum <- 4 + 5 

## 
mySum <- 2 + 5 ## This is convention. Assign from right to left
mySum = 2 + 5 ## 9 equals 7 

## To get value of variable
mySum3

## Assignment operator works in both directions

3 + 9 -> mySum

## Inductive
mySum1 <- mySum2 <- 5 + 10

## Don't advice
mySum3 <- 4 + 2 -> mySum4


# Command to write our first plot
plot(1)

## Vectors: collection of data
myNumber <- c(2, 3, 4, 5, 9, 15, 24, 78, 98)

c(myNumber, 34, 56, 73)

## Add 1 to all numbers
myNumber + 1

myNumber * 2

## Character vector

myChars <- c("Abc", "Bcd", "Mno", "xyz")

c(myChars, "DEF")

myChars1 <- c("DEF", myChars)

## Error
myChars + 1

## Logical vector
## TRUE, FALSE

mylogical <- myNumber < 15
mylogical

## TRUE: 1
## FALSE: 0

sum(myNumber)
sum(mylogical)

## Factor (groups) vector
myFactor <- factor(c("Red", "Green", "Red", "Blue", "Green"))
## levels are name of groups
myFactor

## Addition is not similar to other types
c(myFactor, "Cyan")

sum(myNumber)

?sum

??logarithm

myNumber
log10(x = myNumber)
log2(x = myNumber)
## Match by position. First input is first argument
log2(myNumber)

logb(x = myNumber, 
     base = 3)

## Match by postion
logb(myNumber, 3)
## Would not advice

## Match by name, position does not matter
logb(base = 3, x = myNumber)

## Partial matching ## Won't advice
logb(b = 3, x = myNumber)

myLogs <- logb(x = myNumber,
               base = 3)

logb(base = 3)

######################################
## mode()
## Tell you the type of vector you have

mode(myNumber)
?mode
mode(myChars)
mode(mylogical)
## Factors are considered as numerical
mode(myFactor)

mode(2+2)

mode(2 > 3)

###########################################
myFactor

table(myFactor)

?length
length(myFactor)

## Proportions for each group in a factor
myProportions <- table(myFactor) / length(myFactor)
myProportions


length(myNumber)

length(myChars)

#####
## Sum of all numbers
sum(myNumber)

## Average
mean(myNumber)

sum(myNumber) / length(myNumber)

## Square root
sqrt(myNumber)

###
mylogical

## Percentage of success (TRUE) in this logical vector
(sum(mylogical) / length(mylogical) ) * 100

### Invert a logical vector
## ! equals invert
## !TRUE = FALSE
## !FALSE = TRUE

!mylogical

!TRUE

## Not a good practice
TRU <- 4 > 5 

##################

## Vectors are 1-D objects
## Positional information

## First position
myNumber[1]

myNumber[3]

myNumber[c(1, 3, 5)]

myNumber[c(3, 1, 5)]

## Range
## x:y, give all number from x to y
1:3

## First five
myNumber[1:5]
myNumber[c(1:5)]
myNumber[c(1,2,3,4,5)]

myNumber[5:1]
5:1

## Last element of a vector
## Hint: length()
myNumber[length(myNumber)]

length(myNumber)

## Invert the vector
myNumber[length(myNumber):1]

## Negative subsetting

## Don't want the first element
## Looks like element at position -1
myNumber[-1]
myNumber[-c(1)]

myNumber[-c(1:5)]


## Conditional subsetting

## Logical vector
## vector[logical]
## TRUE positions are kept
## FALSE positions are removed

myNumber[c(TRUE, TRUE,TRUE,TRUE,TRUE,
           FALSE, FALSE,FALSE,FALSE)]

## Recycle
myNumber[c(TRUE, FALSE, FALSE)]

## Careful
## Get all odd position values
myNumber[c(TRUE, FALSE)]

## All the even position values
myNumber[c(FALSE, TRUE)]

## All the values less than 20 from myNumber

isLessThan20 <- myNumber < 20
isLessThan20

## Get the values
myNumber[isLessThan20]

## Have values less than 10

myNumber[myNumber < 10]

## Values greater than or equal to 10
## Values not less than 10
myNumber[!(myNumber < 10)]







