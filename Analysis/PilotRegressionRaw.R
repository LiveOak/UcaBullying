rm(list=ls(all=TRUE)) #Clear the memory of variables from previous run. This is not called by knitr, because it's above the first chunk.
#####################################
## @knitr LoadPackages
require(knitr)
require(RColorBrewer)
require(plyr)
require(scales) #For formating values in graphs
require(grid)
# require(gridExtra)
require(ggplot2)
require(effects)
# require(ggthemes)
# require(reshape2) #For converting wide to long

#####################################
## @knitr DeclareGlobals
pathInput <- "./Data/Derived/ForRegressionAssumptions.rds"

PlotInteraction <- function( dsPlot, xName, yName, colorName="Gender" ) {
  ggplot(dsPlot, aes_string(x=xName, y=yName, color=colorName)) +
    geom_point(shape=1) +
    geom_smooth(method="lm", alpha=.1, linetype=2) + 
    geom_smooth(method="loess", alpha=.1) +
    geom_rug(sides="rb") +
    scale_color_brewer(palette="Dark2") +
    theme_bw() +
    theme(legend.position=c(0,1), legend.justification=c(0,1))
}
PlotEffects <- function( linearModel ) {
  fit <- summary(linearModel)
  print(fit)
  mEffect <- effects::allEffects(linearModel)
  effects:::plot.efflist(mEffect, ci.style="lines", main=NULL)
}
#####################################
## @knitr LoadDatasets
# 'ds' stands for 'datasets'
ds <- readRDS(pathInput)
summary(ds)

#####################################
## @knitr TweakDatasets

#####################################
## @knitr Gender_PeerRatedDefensiveEgotism_PeerRatedBullying
# summary(lm(PeerRatedBullying ~ 1 + ZGender + ZPeerRatedDefensiveEgotism + ZGenderByZPeerDefensiveEgotism, data=ds))
m <- lm(PeerRatedBullying ~ 1 + Gender*PeerRatedDefensiveEgotism, data=ds)

PlotEffects(m)
PlotInteraction(dsPlot=ds, xName="PeerRatedDefensiveEgotism", yName="PeerRatedBullying")

rm(m)
#####################################
## @knitr Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism
m <- lm(PeerRatedAssistsSupportsBully ~ 1 + Gender *PeerRatedDefensiveEgotism, data=ds)

PlotEffects(m)
PlotInteraction(dsPlot=ds, xName="PeerRatedDefensiveEgotism", yName="PeerRatedAssistsSupportsBully")

rm(m)
#####################################
## @knitr Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression
m <- lm(TeacherRatedSocialAggression ~ 1 + Gender*TeacherRatedDefensiveEgotism, data=ds)

PlotEffects(m)
PlotInteraction(dsPlot=ds, xName="TeacherRatedDefensiveEgotism", yName="TeacherRatedSocialAggression")

rm(m)
#####################################
## @knitr Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying
m <- lm(PeerRatedVictimOfBullying ~ 1 + Gender*PeerRatedSelfEsteem, data=ds)

PlotEffects(m)
PlotInteraction(dsPlot=ds, xName="PeerRatedSelfEsteem", yName="PeerRatedVictimOfBullying")

rm(m)
#####################################
## @knitr Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim
m <- lm(PeerRatedDefendsTheVictim ~ 1 + Gender*PeerRatedSelfEsteem, data=ds)

PlotEffects(m)
PlotInteraction(dsPlot=ds, xName="PeerRatedSelfEsteem", yName="PeerRatedDefendsTheVictim")

rm(m)
#####################################
## @knitr InteractionPlayground
m <- lm(PeerRatedDefendsTheVictim ~ 1 + Gender*PeerRatedSelfEsteem, data=ds)
m <- lm(PeerRatedDefendsTheVictim ~ 1 + Gender + PeerRatedSelfEsteem + Gender:PeerRatedSelfEsteem, data=ds)
m <- lm(ds$PeerRatedDefendsTheVictim ~ 1 + as.numeric(ds$Gender) * scale(ds$PeerRatedSelfEsteem))
m <- lm(ds$PeerRatedDefendsTheVictim ~ 1 + scale(as.numeric(ds$Gender)) * ds$PeerRatedSelfEsteem)
m <- lm(ds$PeerRatedDefendsTheVictim ~ 1 + scale(as.numeric(ds$Gender)) * scale(ds$PeerRatedSelfEsteem))
summary(m)

# ds$ZW_Gender <- scale(as.numeric(ds$Gender))
# # ds$ZW_PeerRatedDefendsTheVictim <- scale(as.numeric(ds$PeerRatedDefendsTheVictim))
# ds$ZW_PeerRatedSelfEsteem <- scale(ds$PeerRatedSelfEsteem)
# # PlotInteraction(dsPlot=ds, xName="ZW_PeerRatedSelfEsteem", yName="PeerRatedDefendsTheVictim", colorName="ZW_Gender")

# mS <- lm(ds$PeerRatedDefendsTheVictim ~ 1 + ds$ZGender * ds$Z)
mS <- lm(ds$PeerRatedDefendsTheVictim ~ 1 + ds$ZGender * ds$ZPeerRatedSelfEsteem)
summary(mS)

rm(m)#, mS

qplot(scale(ds$PeerRatedDefensiveEgotism), ds$ZPeerRatedDefensiveEgotism)
