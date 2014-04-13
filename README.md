# Human Activity Recognition Using Smartphones: A Tidy Dataset

Author: **ggData**  
Date: **13 April 2014**

This project is presented as a personal project in partial fulfillment of the Coursera course on [Getting and Cleaning Data](https://class.coursera.org/getdata-002).

**This README file describes solely how to run the script and the file structure. The details of the analysis are documented in the `run_analysis.Rmd` file.** 

## Quick Start

The script has two dependencies -- on the `data.table` and `reshape2` packages. If these are not present on your system, run the following commands in R:

    install.packages('data.table')
    install.packages('reshape2')

Now, in order to get it working, one need only run the script: `run_analysis.R`. This can be done in base R by running this command from the same directory as the script:

    source('run_analysis.R')

The script will perform the following broad actions:

1. It will check for the existence of the dataset in the same directory (by looking for a file called `getdata-projectfiles-UCI HAR Dataset.zip`). If this is not found, then it will load the 59Mb archive first. This may take a few minutes;
2. It will check if there is a `data` directory. If this is absent, it will create this directory as it will be the destination for the output files;
3. Finally it will extract the required data and produce two datasets: (a) `full_data.Rdata` containing all the combined values of the test and training data and (b) `tidy_data.Rdata` containing a subset of indices in tidy format.

Both of the output data files are saved in native `R` format and as a `.csv` file. The second file (`tidy_data`) is the target file requested in the assignment.

## Files

- `CodeBook.md` and `CodeBook.pdf`: data dictionary for the tidy dataset
- `data/full_data.csv` and `data/full_data.Rdata`: comma-separated and native R forms of the complete merged dataset from the training and test datasets.
- `data/tidy_data.csv` and `data/tidy_data.Rdata`: comma-separated and native R forms of the tidy dataset extracted from the full dataset.
- `run_analysis.Rmd`: the full annotated analysis documenting the process of data download, extraction, merging, and tidying
- `run_analysis.R`: the active code from `run_analysis.Rmd` -- extracted automatically using the `knitr` package. If the `.Rmd` code is edited, the script can be re-generated as follow:

```
    # if knitr is not on the system yet
    install.packages("knitr")  
    library("knitr")
    purl("run_analysis.Rmd")
    
    # to run the full script
    source('run_analysis.R')  
```

## Note

- When first run, the source dataset may be absent; it is downloaded if absent
- When first run, the `data` folder may be absent too. It is created together with its contents by the script.
