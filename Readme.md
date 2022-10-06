# Description

The spotted lanternfly, *Lycorma delicatula* (hereafter SLF) is an insect from China that is an invasive pest in the US. Since the initial detection of SLF in Berks County, PA, in 2014, large-scale surveys were conducted to trace the progression of the invasion, resulting in a large amount of detection and non-detection data. A unique dataset summarizing SLF presence and absence in the US was constructed using the package `lycordata`, and constitutes an opportunity to study the spread of the SLF. 

While most dispersal events occur over short distances and likely result in a continuous invasive range, anthropogenic dispersal promotes the occurrence of dispersal "jumps", and the establishment of satellite populations away from the core of the invasion. Distinguishing diffusive spread and jump dispersal is important to understand the process of invasion, its evolution, but also to take efficient management measures.

The ```slfjumps``` package is a tool to identify, analyze and predict the location of dispersal jumps in recent biological invasions. It is presented as an open access package applied to the example of the invasion of the spotted lanternfly (Lycorma delicatula, hereafter SLF) in the United States. 

You can use this package to identify and analyze jump dispersal on another biological invasion with the following steps:

## Clone this project locally

If you have access to this GitLab repository, you can clone this project locally. To do so, open your Terminal or git shell, and set the working directory to the folder where you want the project to be stored using cd. Then, type:

```
git clone https://github.com/nbelouard/slfjumps.git
```

## Access and reproduce this analysis

If you wish to reproduce the analyses, once the project is cloned locally:
- access the folder and open the slfjumps.Rproj file to open the project in Rstudio
- install the package using the R button "install and restart" in the Build tab of Rstudio. 

We do not offer the possibility to execute all vignettes and render a site using pkgdown since most analyses require a long computation (e.g. distances calculation). You can manually access the analyses by opening the vignettes (folder vignettes/).

Note that the data used to run these vignettes on the SLF example are sensitive and cannot be publicly shared. Please contact us if you would like to access this data.

# References

For further information, contact @nbelouard
