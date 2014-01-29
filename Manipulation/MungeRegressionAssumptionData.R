rm(list=ls(all=TRUE)) #Clear the memory of variables from previous run. This is not called by knitr, because it's above the first chunk.
#####################################
## LoadPackages
require(plyr)
require(reshape2) #For converting wide to long

#####################################
## DeclareGlobals
pathInput <- "./Data/Original/ForRegressionAssumptions.csv"
pathOutput <- "./Data/Derived/ForRegressionAssumptions.rda"


#####################################
## LoadDatasets
# 'ds' stands for 'dataset'
ds <- read.csv(pathInput, stringsAsFactors=FALSE)

#####################################
## TweakDatasets

# ds <- plyr::rename(ds, replace=c())
