### For the third session, we will learn how to manipulate data.frames using dplyr

#### There is no *additional* preparation for Session 3. If you followed the preparation for Session 2, skip to Step 2.


For manipulating data.frames, we will use [Tidyverse](https://www.tidyverse.org/)

#### Step 1: Install tidyverse using the following command:

```r
install.packages("tidyverse")
```

#### If you encounter issues during the installation of Tidyverse on Mac (Suggestions by Yura Song and Benoît Haerlingen)

One of the major errors occurring while starting tidyverse package is **"xcrun: error: invalid active developer path, missing xcrun”**.

1. Open the Terminal (Go > Utilities > Terminal)

2. In Terminal, run the command:  
```bash
xcode-select --install
```

3. Re-install the tidyverse on R (Step 1 Above)

4. If the same error occurs although running 1, return to the Terminal and run: 
```bash
sudo xcode-select --reset
```

5. If 4 fails again, go to the [Apple developer download section](https://developer.apple.com/download/more/) and download Xcode manually. After manual installation try tidyverse installation (Step 1 Above)

Once tidyverse is installed, load the library (Step 2 Below) using:
```r
library(tidyverse)
```
If Rstudio return the error message: "there is no package called ‘fs’ “, install fs package by running: 
```r
install.packages(“fs”)
```

[The issue is also addressed on Stack Overflow.](https://stackoverflow.com/questions/52522565/git-is-not-working-after-macos-update-xcrun-error-invalid-active-developer-pa)

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

