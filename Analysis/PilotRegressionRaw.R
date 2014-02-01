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
PlotEffects <- function( linearModel, xTitle="X", yTitle="Y" ) {  
#   linearModel <- m
  fit <- summary(linearModel)
  mEffect <- effects::allEffects(linearModel)
  effects:::plot.efflist(mEffect, ci.style="lines", main=NULL)
  
  oldPar <- par(mfrow=c(2, 3), oma=c(0, 0, .5, 0), tcl=.2, mgp=c(1, 0, 0), mar=c(2, 2, 1.2, .1))
  plot(linearModel, which=1:6, sub.caption="")
  par(oldPar)
  
  
  d <- data.frame(IV=linearModel$model[, 3], Moderator=linearModel$model[, 2], DV=linearModel$model[, 1], stringsAsFactors=T)
  sdIV <- sd(d$IV) 
  evalPoints <- -1:1 #c(-1, 1)
  evalLocations <- mean(d$IV) + sdIV*evalPoints
  newData <- data.frame(
    IV=rep(evalLocations, each=length(levels(d$Moderator))), 
    Moderator=rep(levels(d$Moderator), times=length(evalLocations))
  )
  newData <- plyr::rename(newData, replace=c(
    IV = colnames(linearModel$model)[3],
    Moderator = colnames(linearModel$model)[2]
  ))
  predicted <- predict.lm(object=linearModel, newdata=newData, se.fit=TRUE)
  newData$PredictedY <- predicted$fit
  newData$PredictedSE <- predicted$se.fit
  newData$PredictedLower <- newData$PredictedY - predicted$se.fit
  newData$PredictedUpper <- newData$PredictedY + predicted$se.fit
  newData$EvalPoints <- rep(evalPoints, each=2)
  
  lineColor <- adjustcolor("gray10", alpha.f=.3)
  pointColor <- adjustcolor("gray10", alpha.f=.6)
  # color="Gender",
  g <- ggplot(newData, aes_string(x=colnames(linearModel$model)[3], y="PredictedY", label="Gender", linetype="Gender",  ymin="PredictedLower", ymax="PredictedUpper")) +
    geom_errorbar(data=newData[abs(newData$EvalPoints)>0, ], width=.01, size=1, color=lineColor, linetype=1) +
    geom_line(size=2, color=lineColor) +
    scale_linetype_manual(values=c(3, 5)) +
    theme_bw() +
    theme(axis.text = element_text(colour="gray40")) +
    theme(axis.title = element_text(colour="gray40")) +
    theme(panel.border = element_rect(colour="gray80")) +
    theme(axis.ticks = element_line(colour="gray80")) +
    theme(legend.position="none") +
    labs(x=xTitle, y=yTitle)
  
  print(g + geom_text(data=newData[newData$EvalPoints==0, ], vjust=-1) )
  
  g2 <- g + 
    geom_point(data=d, mapping=aes(x=IV, y=DV, shape=Moderator, ymin=NULL, ymax=NULL, label=NULL, linetype=NULL), color=pointColor) +
    geom_text(data=newData[newData$EvalPoints==0, ], vjust=0) +
    scale_shape_manual(values=c("Male"="M", "Female"="F"))
  print(g2)
  
  print(fit)
}

# require(QuantPsyc)
# 
# lm.mod1 <- moderate.lm(x=PeerRatedDefensiveEgotism, z=Gender, y=PeerRatedBullying, data=linearModel$model)
# ss.mod1 <- sim.slopes(lm.mod1, z=tra$values)
# ss.mod1

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

PlotInteraction(dsPlot=ds, xName="PeerRatedDefensiveEgotism", yName="PeerRatedBullying")
PlotEffects(m, xTitle="Peer-rated Defensive Egotism", yTitle="Peer-rated Bullying")

rm(m)
#####################################
## @knitr Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism
m <- lm(PeerRatedAssistsSupportsBully ~ 1 + Gender*PeerRatedDefensiveEgotism, data=ds)

PlotInteraction(dsPlot=ds, xName="PeerRatedDefensiveEgotism", yName="PeerRatedAssistsSupportsBully")
PlotEffects(m, xTitle="Peer-rated Defensive Egotism", yTitle="Peer-rated Assists or Supports Bully")

rm(m)
#####################################
## @knitr Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression
m <- lm(TeacherRatedSocialAggression ~ 1 + Gender*TeacherRatedDefensiveEgotism, data=ds)

PlotInteraction(dsPlot=ds, xName="TeacherRatedDefensiveEgotism", yName="TeacherRatedSocialAggression")
PlotEffects(m, xTitle="Teacher-rated Defensive Egotism", yTitle="Teacher-rated Social Aggression")

rm(m)
#####################################
## @knitr Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying
m <- lm(PeerRatedVictimOfBullying ~ 1 + Gender*PeerRatedSelfEsteem, data=ds)

PlotInteraction(dsPlot=ds, xName="PeerRatedSelfEsteem", yName="PeerRatedVictimOfBullying")
PlotEffects(m, xTitle="Peer-rated Self-esteem", yTitle="Peer-rated Victing of Bullying")

rm(m)
#####################################
## @knitr Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim
m <- lm(PeerRatedDefendsTheVictim ~ 1 + Gender*PeerRatedSelfEsteem, data=ds)

PlotInteraction(dsPlot=ds, xName="PeerRatedSelfEsteem", yName="PeerRatedDefendsTheVictim")
PlotEffects(m, xTitle="Peer-rated Self-esteem", yTitle="Peer-rated Defends the Victim")

rm(m)
