Check Regression Assumptions of Pilot Data
=================================================
This report graphs and runs tests to check the assumptions of the multiple regression.

<!--  Set the working directory to the repository's base directory; this assumes the report is nested inside of only one directory.-->

```r
opts_knit$set(root.dir = "../")  #Don't combine this call with any other chunk -especially one that uses file paths.
```


<!-- Set the report-wide options, and point to the external code file. -->

```r
require(knitr)
opts_chunk$set(
    results='show', 
    comment = NA, 
    tidy = FALSE,
    fig.width = 4.5, 
    fig.height = 4, 
    out.width = "800px", #This affects only the markdown, not the underlying png file.  The height will be scaled appropriately.
    fig.path = 'figure_raw/',     
    dev = "png",
#     dev = "pdf",
    dpi = 400
)
echoChunks <- FALSE
options(width=120) #So the output is 50% wider than the default.
read_chunk("./Analysis/PilotRegressionRaw.R") 
```

<!-- Load the packages.  Suppress the output when loading packages. --> 



<!-- Load any Global functions and variables declared in the R file.  Suppress the output. --> 



<!-- Declare any global functions specific to a Rmd output.  Suppress the output. --> 



<!-- Load the datasets.   -->

```
 SubjectNumber PeerRatedBullying    Gender      ZGender       PeerRatedDefensiveEgotism ZPeerRatedDefensiveEgotism
 Min.   :101   Min.   :0.000     Male  :55   Min.   :-0.816   Min.   :0.000             Min.   :-2.2341           
 1st Qu.:124   1st Qu.:0.000     Female:37   1st Qu.:-0.816   1st Qu.:0.550             1st Qu.:-0.7801           
 Median :146   Median :0.250                 Median :-0.816   Median :0.840             Median : 0.0075           
 Mean   :146   Mean   :0.298                 Mean   : 0.000   Mean   :0.838             Mean   : 0.0000           
 3rd Qu.:169   3rd Qu.:0.395                 3rd Qu.: 1.213   3rd Qu.:1.070             3rd Qu.: 0.6220           
 Max.   :192   Max.   :1.670                 Max.   : 1.213   Max.   :1.730             Max.   : 2.3703           
 ZGenderByZPeerDefensiveEgotism PeerRatedAssistsSupportsBully TeacherRatedSocialAggression TeacherRatedDefensiveEgotism
 Min.   :-2.710                 Min.   :0.000                 Min.   :0.000                Min.   :0.000               
 1st Qu.:-1.002                 1st Qu.:0.000                 1st Qu.:0.000                1st Qu.:0.000               
 Median :-0.450                 Median :0.330                 Median :0.200                Median :0.330               
 Mean   :-0.364                 Mean   :0.315                 Mean   :0.303                Mean   :0.502               
 3rd Qu.: 0.240                 3rd Qu.:0.395                 3rd Qu.:0.400                3rd Qu.:0.807               
 Max.   : 1.910                 Max.   :1.330                 Max.   :1.600                Max.   :1.750               
 ZTeacherRatedDefensiveEgotism ZGenderByZTeacherDefensiveEgotism PeerRatedVictimOfBullying PeerRatedSelfEsteem
 Min.   :-1.023                Min.   :-2.070                    Min.   :0.000             Min.   :0.47       
 1st Qu.:-1.023                1st Qu.:-1.240                    1st Qu.:0.000             1st Qu.:1.31       
 Median :-0.346                Median :-0.415                    Median :0.000             Median :1.50       
 Mean   : 0.000                Mean   :-0.317                    Mean   :0.206             Mean   :1.47       
 3rd Qu.: 0.603                3rd Qu.: 0.420                    3rd Qu.:0.330             3rd Qu.:1.64       
 Max.   : 2.533                Max.   : 2.460                    Max.   :2.000             Max.   :2.00       
 ZPeerRatedSelfEsteem ZGenderByZPeerRatedSelfEsteem PeerRatedDefendsTheVictim
 Min.   :-3.287       Min.   :-3.990                Min.   :0.000            
 1st Qu.:-0.520       1st Qu.:-0.902                1st Qu.:0.330            
 Median : 0.103       Median :-0.205                Median :0.670            
 Mean   : 0.000       Mean   :-0.311                Mean   :0.643            
 3rd Qu.: 0.556       3rd Qu.: 0.280                3rd Qu.:1.000            
 Max.   : 1.743       Max.   : 1.980                Max.   :1.670            
```


<!-- Tweak the datasets.   -->

```r
cat("The following cases are excluded: (", paste(casesToExclude, collapse=", "), "). \nThis field is dynamically generated.  It will be empty if no cases are excluded.")
```

```
The following cases are excluded: ( 47, 69, 76, 83 ). 
This field is dynamically generated.  It will be empty if no cases are excluded.
```

```r
ds <- ds[-casesToExclude, ]
#####################################
```


## 1. Gender_PeerRatedDefensiveEgotism_PeerRatedBullying
*Gender, defensive egotism, and bullying.* We regressed peer-rated bullying (Column B in the Excel file, Will) onto gender (Column D), peer-rated defensive egotism (Column F), and the interaction term (Column G). 

<img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedBullying1.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" width="800px" /><img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedBullying2.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" width="800px" /><img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedBullying3.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" width="800px" /><img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedBullying4.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" width="800px" /><img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedBullying5.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" width="800px" />

```

Call:
lm(formula = PeerRatedBullying ~ 1 + Gender * PeerRatedDefensiveEgotism, 
    data = ds)

Residuals:
    Min      1Q  Median      3Q     Max 
-0.6069 -0.1794 -0.0572  0.1629  0.8579 

Coefficients:
                                       Estimate Std. Error t value Pr(>|t|)    
(Intercept)                              -0.117      0.124   -0.94    0.348    
GenderFemale                              0.264      0.169    1.56    0.123    
PeerRatedDefensiveEgotism                 0.499      0.122    4.09  9.7e-05 ***
GenderFemale:PeerRatedDefensiveEgotism   -0.449      0.195   -2.30    0.024 *  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.296 on 84 degrees of freedom
Multiple R-squared:  0.228,	Adjusted R-squared:   0.2 
F-statistic: 8.25 on 3 and 84 DF,  p-value: 7.09e-05
```


## 2. Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism
*Gender, defensive egotism, and assists or supports the bully.* When we re-ran the analyses above with peer-rated assists or supports the bully as the dependent variable (Column H, Will) (rather than peer-rated bullying), the pattern was almost identical to that in Figure 1. 

<img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism1.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" width="800px" /><img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism2.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" width="800px" /><img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism3.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" width="800px" /><img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism4.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" width="800px" /><img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism5.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" width="800px" />

```

Call:
lm(formula = PeerRatedAssistsSupportsBully ~ 1 + Gender * PeerRatedDefensiveEgotism, 
    data = ds)

Residuals:
    Min      1Q  Median      3Q     Max 
-0.6243 -0.1645 -0.0603  0.1569  0.8313 

Coefficients:
                                       Estimate Std. Error t value Pr(>|t|)    
(Intercept)                             -0.0499     0.1143   -0.44    0.664    
GenderFemale                             0.1460     0.1559    0.94    0.352    
PeerRatedDefensiveEgotism                0.4649     0.1123    4.14  8.2e-05 ***
GenderFemale:PeerRatedDefensiveEgotism  -0.3328     0.1794   -1.86    0.067 .  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.273 on 84 degrees of freedom
Multiple R-squared:  0.267,	Adjusted R-squared:  0.241 
F-statistic: 10.2 on 3 and 84 DF,  p-value: 8.38e-06
```


## 3. Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression
*Gender, defensive egotism and social aggression.* We regressed teacher-rated social aggression (Column I, Will) onto gender (Column D), teacher-rated defensive egotism (Column K), and the interaction term (Column L), 

<img src="figure_raw/Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression1.png" title="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" alt="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" width="800px" /><img src="figure_raw/Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression2.png" title="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" alt="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" width="800px" /><img src="figure_raw/Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression3.png" title="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" alt="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" width="800px" /><img src="figure_raw/Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression4.png" title="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" alt="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" width="800px" /><img src="figure_raw/Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression5.png" title="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" alt="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" width="800px" />

```

Call:
lm(formula = TeacherRatedSocialAggression ~ 1 + Gender * TeacherRatedDefensiveEgotism, 
    data = ds)

Residuals:
    Min      1Q  Median      3Q     Max 
-0.5171 -0.1196 -0.0097  0.0889  0.7878 

Coefficients:
                                          Estimate Std. Error t value Pr(>|t|)    
(Intercept)                                -0.0129     0.0537   -0.24    0.811    
GenderFemale                                0.0226     0.0734    0.31    0.759    
TeacherRatedDefensiveEgotism                0.5300     0.0682    7.77  1.7e-11 ***
GenderFemale:TeacherRatedDefensiveEgotism   0.2798     0.1238    2.26    0.026 *  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.237 on 84 degrees of freedom
Multiple R-squared:  0.595,	Adjusted R-squared:  0.581 
F-statistic: 41.1 on 3 and 84 DF,  p-value: <2e-16
```


## 4. Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying
*Gender, self-esteem and victim of bullying.* We regressed peer-rated victim of bullying (Column M) onto gender (Column D), peer-rated self-esteem (Column O), and the interaction term (Column P) 

<img src="figure_raw/Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying1.png" title="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying" alt="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying" width="800px" /><img src="figure_raw/Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying2.png" title="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying" alt="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying" width="800px" /><img src="figure_raw/Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying3.png" title="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying" alt="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying" width="800px" /><img src="figure_raw/Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying4.png" title="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying" alt="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying" width="800px" /><img src="figure_raw/Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying5.png" title="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying" alt="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying" width="800px" />

```

Call:
lm(formula = PeerRatedVictimOfBullying ~ 1 + Gender * PeerRatedSelfEsteem, 
    data = ds)

Residuals:
   Min     1Q Median     3Q    Max 
-0.451 -0.118 -0.065  0.141  0.694 

Coefficients:
                                 Estimate Std. Error t value Pr(>|t|)    
(Intercept)                         1.182      0.187    6.32  1.2e-08 ***
GenderFemale                       -0.920      0.292   -3.15   0.0022 ** 
PeerRatedSelfEsteem                -0.604      0.117   -5.15  1.7e-06 ***
GenderFemale:PeerRatedSelfEsteem    0.497      0.198    2.50   0.0142 *  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.23 on 84 degrees of freedom
Multiple R-squared:  0.28,	Adjusted R-squared:  0.254 
F-statistic: 10.9 on 3 and 84 DF,  p-value: 4.12e-06
```


## 5. Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim
*Gender, self-esteem and defends the victim of bullying*. We regressed peer-rated defends the victim (Column Q) onto gender (Column D), peer-rated self-esteem (Column O), and the interaction term (Column P) 

<img src="figure_raw/Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim1.png" title="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim" alt="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim" width="800px" /><img src="figure_raw/Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim2.png" title="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim" alt="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim" width="800px" /><img src="figure_raw/Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim3.png" title="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim" alt="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim" width="800px" /><img src="figure_raw/Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim4.png" title="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim" alt="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim" width="800px" /><img src="figure_raw/Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim5.png" title="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim" alt="plot of chunk Gender_PeerRatedSelfEsteem_PeerRatedDefendsTheVictim" width="800px" />

```

Call:
lm(formula = PeerRatedDefendsTheVictim ~ 1 + Gender * PeerRatedSelfEsteem, 
    data = ds)

Residuals:
    Min      1Q  Median      3Q     Max 
-1.0166 -0.2553 -0.0063  0.2439  0.9968 

Coefficients:
                                 Estimate Std. Error t value Pr(>|t|)  
(Intercept)                       0.00199    0.33261    0.01    0.995  
GenderFemale                     -0.33571    0.51866   -0.65    0.519  
PeerRatedSelfEsteem               0.38439    0.20866    1.84    0.069 .
GenderFemale:PeerRatedSelfEsteem  0.39614    0.35289    1.12    0.265  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.408 on 84 degrees of freedom
Multiple R-squared:  0.136,	Adjusted R-squared:  0.106 
F-statistic: 4.42 on 3 and 84 DF,  p-value: 0.00615
```


## Session Information
For the sake of documentation and reproducibility, the current report was build on a system using the following software.


```
Report created by Will at 2014-02-07, 12:46:43 -0600
```

```
R Under development (unstable) (2014-02-06 r64933)
Platform: x86_64-w64-mingw32/x64 (64-bit)

locale:
[1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252    LC_MONETARY=English_United States.1252
[4] LC_NUMERIC=C                           LC_TIME=English_United States.1252    

attached base packages:
[1] grid      stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] effects_2.3-0      colorspace_1.2-4   lattice_0.20-24    ggplot2_0.9.3.1    scales_0.2.3       plyr_1.8.0.99     
[7] RColorBrewer_1.0-5 knitr_1.5         

loaded via a namespace (and not attached):
 [1] dichromat_2.0-0 digest_0.6.4    evaluate_0.5.1  formatR_0.10    gtable_0.1.2    labeling_0.2    MASS_7.3-29    
 [8] munsell_0.4.2   proto_0.3-10    Rcpp_0.11.0     reshape2_1.2.2  stringr_0.6.2   tools_3.1.0    
```

