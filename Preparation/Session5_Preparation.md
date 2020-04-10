Making beautiful plots with ggplot
==================================

In the fifth session, we will learn how to use [ggplot](https://ggplot2.tidyverse.org/) for plotting data in R
-------------------------------------------------------------------------------------

### Step 1: Install ggplot2 package using the following command: 

```r
install.packages("ggplot2")
```

We will be plotting the trend of coronavirus cases in different countries around the world.
For this, we will download [a daily updated dataset of coronavirus cases](https://github.com/RamiKrispin/coronavirus), courtsey of [Rami Krispin](https://github.com/RamiKrispin) and [Johns Hopkins](https://github.com/CSSEGISandData/COVID-19).

#### Note: If devtools installation (Step 2) does not work, skip to Step 3b

### Step 2: Install devtools 

```r
install.packages("devtools")
```

### Step 3: Install [coronavirus R package](https://github.com/RamiKrispin/coronavirus) 

```r
devtools::install_github("covid19r/coronavirus")
```

#### In case Step 2 (installation of devtools) does not work, install the CRAN version of coronavirus package. It is not updated daily, but has sufficient data for plotting

### Step 3b: Install CRAN coronavirus R package (Only if Step 2 failed)

```r
install.packages("coronavirus")
```

### Bonus Step 4: Install [gganimate](https://github.com/thomasp85/gganimate) to make dynamic plots!
If Step 2 (installation of devtools was successful)
```r
devtools::install_github('thomasp85/gganimate')
```
or

```r
install.packages("gganimate")
```

### Step 5: Test all the installations
```r
library(ggplot2)
library(coronavirus)
## If gganimate (Step 4) was installed 
library(gganimate)
```
If everything loads without issues, you are ready for fifth session!
