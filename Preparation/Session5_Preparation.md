Making beautiful plots with ggplot
==================================

In the fifth session, we will learn how to use [ggplot](https://ggplot2.tidyverse.org/) for plotting data in R and [ggpubr](https://rpkgs.datanovia.com/ggpubr/index.html) for adding significance statistics
-------------------------------------------------------------------------------------

### Step 1: Install ggplot2 and ggpubr package using the following command: 

```r
install.packages(c("ggplot2", "ggpubr"))
```
***
### Step 2: For the first part, we will use the data files from Session 4
#### If you successfully prepared for Session 4, then Skip this Step.
Download data file folder that was used for Session 4 (Click on link below).
[Download Data File Folder Link](https://github.com/sumeetpalsingh/R_course/raw/master/Preparation/Session4%20Files.zip)

The folder is zipped. Unzip the folder. It will contain three files.
***
### Step 3 - 4: Install new dataset for analysis
We will be plotting the trend of coronavirus cases in different countries around the world.
For this, we will download [a daily updated dataset of coronavirus cases](https://github.com/RamiKrispin/coronavirus), courtsey of [Rami Krispin](https://github.com/RamiKrispin) and [Johns Hopkins](https://github.com/CSSEGISandData/COVID-19).


### Step 3: Install devtools 
#### Note: If devtools installation (Step 3) does not work, skip to Step 3b

```r
install.packages("devtools")
```

### Step 4: Install [coronavirus R package](https://github.com/RamiKrispin/coronavirus) 

```r
devtools::install_github("covid19r/coronavirus")
```

#### In case Step 3 (installation of devtools) does not work, install the CRAN version of coronavirus package. It is not updated daily, but has sufficient data for plotting

### Step 4b: Install CRAN coronavirus R package (Only if Step 3 failed)

```r
install.packages("coronavirus")
```
***
#### Bonus installations to test additional features. Recommended, but can skip to Step 7

### Bonus Step 5: Install [gganimate](https://github.com/thomasp85/gganimate) to make dynamic plots!
If Step 2 (installation of devtools was successful)
```r
devtools::install_github('thomasp85/gganimate')
```
or

```r
install.packages("gganimate")
```

### Bonus Step 6: Install [ggforce](https://ggforce.data-imaginist.com/index.html) to zoom at parts of the plot.
If Step 2 (installation of devtools was successful)
```r
devtools::install_github("thomasp85/ggforce")
```
or

```r
install.packages("ggforce")
```
***
### Step 7: Test all the installations
```r
## From Session 3
library(dplyr)
## From Session4
library(readxl)
library(tibble)
library(tidyr)
## New Packages
library(ggplot2)
library(ggpubr)
library(coronavirus)
## If gganimate (Step 4) was installed 
library(gganimate)
library(ggforce)
```
If everything loads without issues, you are ready for fifth session!
