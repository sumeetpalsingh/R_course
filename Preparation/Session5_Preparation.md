Making beautiful plots with ggplot
==================================

In the fifth session, we will learn how to use [ggplot](https://ggplot2.tidyverse.org/) for plotting data in R
-------------------------------------------------------------------------------------

### Step 1: Install ggplot2 package using the following command: 

```r
install.packages("ggplot2")
```

### Step 2: Test if ggplot is properly installed 

```r
library(ggplot2)
```

We will be plotting the trend of coronavirus cases in different countries around the world.
For this, we will download [a daily updated dataset of coronavirus cases](https://github.com/RamiKrispin/coronavirus), courtsey of [Rami Krispin](https://github.com/RamiKrispin) and [Johns Hopkins](https://github.com/CSSEGISandData/COVID-19).

#### Note: If devtools installation (Step 3) does not work, skip to Step 3b

### Step 3: Install devtools 

```r
install.packages("devtools")
```

### Step 4: Install [coronavirus R package](https://github.com/RamiKrispin/coronavirus) 

```r
devtools::install_github("covid19r/coronavirus")
```

#### In case Step 3 (installation of devtools) does not work, install the CRAN version of coronavirus package. It is not updated daily, but has sufficient data for plotting

### Step 3b: Install CRAN coronavirus R package

```r
install.packages("coronavirus")
```

### Step 5: Test all the installations
```r
library(ggplot2)
library(coronavirus)
```
If everything loads without issues, you are ready for fifth session!
