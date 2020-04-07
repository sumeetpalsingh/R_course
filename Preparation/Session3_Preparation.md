### For the third session, we will learn how to manipulate data.frames using dplyr

#### There is no *additional* preparation for Session 3. If you followed the preparation for Session 2, skip to Step 2.


For manipulating data.frames, we will use [Tidyverse](https://www.tidyverse.org/)

#### Step 1: Install tidyverse using the following command:

```r
install.packages("tidyverse")
```

#### If you encounter issues during the installation of Tidyverse (Suggestions by Yura Song)

One of the major errors occurring while starting tidyverse package is **"xcrun: error: invalid active developer path, missing xcrun”**.

1. Open the terminal and run the command:  xcode-select --install
2. Re-install the tidyverse on R (Step 1 Above)
3. If the same error occurs although running 1, return to the terminal and run: sudo xcode-select --reset
4. If 3 fails again, go to the [Apple developer download section](https://developer.apple.com/download/more/) and download Xcode manually.

Once tidyverse is installed, load the library (Step 2 Below) using:
```r
library(tidyverse)
```
If Rstudio return the error message: "there is no package called ‘fs’ “, install fs package by running: 
```r
install.packages(“fs”)
```

Additionally, it is highly recommended to check R community since lots of people have discussed about several topics regarding R packages and errors. 

https://community.rstudio.com


#### Step 2: Load tidyverse packages into the R session using the command:

```r
library(tidyverse)
```

Tidyverse is a collection of packages that help with data manipulation. To see, which packages come with the installtion, use the following command

```r
tidyverse_packages()
```

You should see the following image on your R console. Check that **dplyr** package is included in the installation. 

![alt text](https://github.com/sumeetpalsingh/R_course/blob/master/images/Tidyverse_load.png "Tidyverse Load")

