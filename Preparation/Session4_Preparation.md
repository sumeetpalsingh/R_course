### For the forth session, we will learn how to import and export data files and convert wide data to long for analysis

#### Step 1: Download data file folder that will be used for the session (Click on link below).

[Download Data File Folder Link](https://github.com/sumeetpalsingh/R_course/raw/master/Preparation/Session4%20Files.zip)

The folder is zipped. Unzip the folder. It will contain three files. 

***
#### If you successfully installed Tidyverse, no additional preparation is required! You are ready for the session. 
#### If you had trouble installing Tidyverse, continue to Step 2 - 5.
***
#### Step 2: Install readr and readxl packages for reading files: 

```r
install.packages(c("readr", "readxl"))
```

#### Step 3: Install tibble and tidyr packages for changing to tidy data: 

```r
install.packages(c("tibble", "tidyr"))
```

#### Step 4: Install stringr for string manipulation: 

```r
install.packages("stringr")
```

#### Step 5: Test if all packages are properly installed 

```r
library(dplyr)
library(readr)
library(readxl)
library(tibble)
library(tidyr)
library(stringr)
```
All libraries should load without any error.
