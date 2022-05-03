# Description

The ```slfjumps``` package is a tool to identify, analyze and predict the location of dispersal jumps in recent biological invasions. It is presented as an open access package applied to the example of the invasion of the spotted lanternfly (Lycorma delicatula, hereafter SLF) in the United States. 

You can use this package to identify and analyze jump dispersal on another biological invasion with the following steps:

## Clone this project locally

If you have access to this GitLab repository, you can clone this project locally. To do so, open your Terminal or git shell, and set the working directory to the folder where you want the project to be stored using cd. Then, type:

```
git clone git@gitlab.com:nbelouard/slfjumps.git
```

## (optional) Prepare your R for the analyses

The slfjumps package relies on a variety of other packages to function. They are specified as Imports in the DESCRIPTION, and will be automatically installed with the slfjumps package. If you wish to prepare the R environment for the slfjumps package manually, you can do so by pasting this command into R or RStudio.

```
install.packages(c('tidyverse', 'here', 'magrittr', 'rmarkdown', 'ggplot2', 'pkgdown', 'knitr', 'sf', 'maps', 'DescTools', 'geosphere', 'leaflet', 'dplyr', 'gridExtra', 'ape', 'spdep', 'roxygen2'))
```

## Access and reproduce this analysis

If you wish to reproduce the analyses, once the project is cloned locally:
- access the folder and open the slfjumps.Rproj file to open the project in Rstudio
- install the package using the R button "install and restart" in the Build tab of Rstudio. 

We do not offer the possibility to execute all vignettes and render a site using pkgdown since (1) most analyses require a long computation (e.g. distances calculation), and (2) you will need to modify the vignettes with your own data.

You can manually access the analyses by opening the vignettes (folder vignettes/), modifying the code and running them.

Note that the data used to run these vignettes on the SLF example are sensitive and cannot be publicly shared. However, a mock file is provided with the format that is required to run the code to guide users.

# References

For further information, contact @nbelouard
