# Description

The slfjumps package identifies and analyzes the location of jump events in the invasion of the spotted lanternfly (Lycorma delicatula, hereafter SLF) in the United States. The SLF was first discovered in Berks County, PA, in 2014. 

## How to clone this project locally

If you have access to this GitLab repository, you can clone this project locally. To do so, opening your Terminal or git shell, and cd to the appropriate folder where you want the project to be stored. Then, type:

```
git clone git@gitlab.com:nbelouard/slfjumps.git
```

## How to prepare your R for the analyses

The slfjumps package relies on a variety of other packages to function. Those packages are specified as Imports in the DESCRIPTION, and will be automatically installed when the package is installed. If you wish to prepare the R enviroment for the lycormap package manually, you can do so by pasting this command into R or RStudio.

Before installing our package, please copy-paste the following in your R console.

```
install.packages(c('tidyverse', 'here', 'magrittr', 'rmarkdown', 'pkgdown', 'knitr'))
```


# How to reproduce this analysis

If you wish to reproduce the analyses, the first step to take is to install the package lycormap. Then you can render the package website and access it. There are several ways to do so, and here we present three. 

## Using RStudio Build tool and pkgdown::build_site()

The slfjumps package can be installed by accessing the omoniomous package folder, and opening the lycormap.Rproj file. This will prompt open RStudio. You can then find the Build tab (by default in the top right panel in RStudio), and click "Install and Restart". The package will be installed.
You can reproduce the analyses by typing in the console:

pkgdown::build_site()

This is a wrapper for a series of of functions that produce the package's documentation, renders the Rmarkdown files contained in the vignettes/ folder, and bundles everything in a site. You can access this site by opening the docs/ folder, and accessing the index.html file.


## Manually accessing the analyses
If you wish, instead, to manually run the analyses or render the Rmarkdown files, follow one of the previous steps to install the package (either through the Build tools in RStudio, or the make command). Then access the lycormap.Rproj file and open the .Rmd files in the vignettes/ folder. You can run them chunk by chunk, or render them all using the Knit button in RStudio.

# Data

The data contained in this package (tinyslf) is comprehensive account of surveys of SLF presence in the US. The data is created by a companion package lycordata, which compiles various sources into a single dataset. The data is sensitive and cannot be shared with others without prior authorization. Please contact @sebadebona for more information.

# References

For further information, contact @nbelouard
