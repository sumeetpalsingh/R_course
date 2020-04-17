Sharing R codes using Markdown and Shiny
==================================

In the sixth session, we will learn how to use [R Markdown](https://rmarkdown.rstudio.com/) for generating shareable documents containing R code, and using [R Shiny](https://shiny.rstudio.com/) to make interactive websites
-------------------------------------------------------------------------------------

### Step 1: Test that all packages from previous sessions are properly installed.

```r
## From Session 3
library(dplyr)
## From Session4
library(readxl)
library(tibble)
library(tidyr)
## From Session 5
library(ggplot2)
library(ggpubr)
library(coronavirus)
```

### Step 2: Install R Shiny
```r
install.packages(c("shiny","shinydashboard"))
```

### Step 3: Test R Shiny installation worked
```r
library(shiny)
library(shinydashboard)
## Should run without any error. 
```

### Step 4: Download R Markdown Cheat Sheat
[R Markdown Cheat Sheat](https://github.com/sumeetpalsingh/R_course/blob/master/Preparation/rmarkdown-cheatsheet.pdf)

### Step 5: Download an image (or you could use an image file of your liking)
[R Logo](https://github.com/sumeetpalsingh/R_course/blob/master/Preparation/R_logo.png)

### You are ready for sixth session!
