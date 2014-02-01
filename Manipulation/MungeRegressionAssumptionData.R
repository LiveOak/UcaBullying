rm(list=ls(all=TRUE)) #Clear the memory of variables from previous run. This is not called by knitr, because it's above the first chunk.
#####################################
## LoadPackages
require(plyr)
require(reshape2) #For converting wide to long

#####################################
## DeclareGlobals
pathInput <- "./Data/Original/ForRegressionAssumptions.csv"
pathOutput <- "./Data/Derived/ForRegressionAssumptions.rds"

#####################################
## LoadDatasets
# 'ds' stands for 'dataset'
ds <- read.csv(pathInput, stringsAsFactors=FALSE)

#####################################
## TweakDatasets

ds <- plyr::rename(ds, replace=c(
  "Subnum" = "SubjectNumber"
  , "Peer.rated.Bullying" = "PeerRatedBullying"
  , "Sex..male...1." = "Gender"
  , "Zscores.Sex" = "ZGender"
  , "Peer.rated.Defensive.Egotism" = "PeerRatedDefensiveEgotism"
  , "Zscores.Peer.rated.Defensive.Egotism" = "ZPeerRatedDefensiveEgotism"
  , "ZSex.X.ZPeer.Defensive.Egotism" = "ZGenderByZPeerDefensiveEgotism"
  , "Peer.rated.Assists.SupportsBully" = "PeerRatedAssistsSupportsBully"
  , "Teacher.rated.Social.Aggression" = "TeacherRatedSocialAggression"
  , "Teacher.rated.Defensive.Egotism" = "TeacherRatedDefensiveEgotism"
  , "Zscores.Teacher.rated.Defensive.Egotism" = "ZTeacherRatedDefensiveEgotism"
  , "ZSex.X.ZTeacher.Defesnive.Egotism" = "ZGenderByZTeacherDefensiveEgotism"
  , "Peer.rated.Victim.of.Bullying" = "PeerRatedVictimOfBullying"
  , "Peer.rated.Self.esteem" = "PeerRatedSelfEsteem"
  , "Zscores.Peer.rated.Self.esteem" = "ZPeerRatedSelfEsteem"
  , "ZSex.X.ZPeer.rated.Self.esteem" = "ZGenderByZPeerRatedSelfEsteem"
  , "Peer.rated.Defends.the.Victim" = "PeerRatedDefendsTheVictim"
))

ds$Gender <- factor(ds$Gender, levels=1:2, labels=c("Male", "Female"))

#####################################
## Save data as Rds (ie a compressed R data file)
saveRDS(object=ds, file=pathOutput, compress="xz")
