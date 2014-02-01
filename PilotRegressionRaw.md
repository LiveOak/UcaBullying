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
    fig.width = 5.5, 
    fig.height = 4, 
    out.width = "600px", #This affects only the markdown, not the underlying png file.  The height will be scaled appropriately.
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



## 1. Gender_PeerRatedDefensiveEgotism_PeerRatedBullying
*Gender, defensive egotism, and bullying.* We regressed peer-rated bullying (Column B in the Excel file, Will) onto gender (Column D), peer-rated defensive egotism (Column F), and the interaction term (Column G). 


```

Call:
lm(formula = PeerRatedBullying ~ 1 + Gender * PeerRatedDefensiveEgotism, 
    data = ds)

Residuals:
    Min      1Q  Median      3Q     Max 
-0.6470 -0.1746 -0.0624  0.1913  0.9961 

Coefficients:
                                       Estimate Std. Error t value Pr(>|t|)    
(Intercept)                              -0.132      0.121   -1.10    0.276    
GenderFemale                              0.262      0.168    1.56    0.122    
PeerRatedDefensiveEgotism                 0.538      0.119    4.52  1.9e-05 ***
GenderFemale:PeerRatedDefensiveEgotism   -0.467      0.196   -2.39    0.019 *  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.314 on 88 degrees of freedom
Multiple R-squared:  0.253,	Adjusted R-squared:  0.227 
F-statistic: 9.92 on 3 and 88 DF,  p-value: 1.06e-05
```

<img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedBullying1.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" width="600px" /><img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedBullying2.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" width="600px" /><img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedBullying3.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedBullying" width="600px" />


## 2. Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism
*Gender, defensive egotism, and assists or supports the bully.* When we re-ran the analyses above with peer-rated assists or supports the bully as the dependent variable (Column H, Will) (rather than peer-rated bullying), the pattern was almost identical to that in Figure 1. 


```

Call:
lm(formula = PeerRatedAssistsSupportsBully ~ 1 + Gender * PeerRatedDefensiveEgotism, 
    data = ds)

Residuals:
   Min     1Q Median     3Q    Max 
-0.646 -0.159 -0.068  0.161  0.814 

Coefficients:
                                       Estimate Std. Error t value Pr(>|t|)    
(Intercept)                             -0.0552     0.1080   -0.51    0.610    
GenderFemale                             0.1383     0.1497    0.92    0.358    
PeerRatedDefensiveEgotism                0.4839     0.1063    4.55  1.7e-05 ***
GenderFemale:PeerRatedDefensiveEgotism  -0.3368     0.1747   -1.93    0.057 .  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.281 on 88 degrees of freedom
Multiple R-squared:  0.29,	Adjusted R-squared:  0.265 
F-statistic:   12 on 3 and 88 DF,  p-value: 1.22e-06
```

<img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism1.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" width="600px" /><img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism2.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" width="600px" /><img src="figure_raw/Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism3.png" title="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" alt="plot of chunk Gender_PeerRatedDefensiveEgotism_PeerRatedDefensiveEgotism" width="600px" />


## 3. Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression
*Gender, defensive egotism and social aggression.* We regressed teacher-rated social aggression (Column I, Will) onto gender (Column D), teacher-rated defensive egotism (Column K), and the interaction term (Column L), 


```

Call:
lm(formula = TeacherRatedSocialAggression ~ 1 + Gender * TeacherRatedDefensiveEgotism, 
    data = ds)

Residuals:
    Min      1Q  Median      3Q     Max 
-0.5077 -0.1520 -0.0111  0.0937  0.7864 

Coefficients:
                                          Estimate Std. Error t value Pr(>|t|)    
(Intercept)                                 0.0334     0.0558    0.60    0.551    
GenderFemale                               -0.0223     0.0773   -0.29    0.773    
TeacherRatedDefensiveEgotism                0.4743     0.0688    6.90  7.8e-10 ***
GenderFemale:TeacherRatedDefensiveEgotism   0.3358     0.1306    2.57    0.012 *  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.255 on 88 degrees of freedom
Multiple R-squared:  0.54,	Adjusted R-squared:  0.524 
F-statistic: 34.4 on 3 and 88 DF,  p-value: 8.46e-15
```

<img src="figure_raw/Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression1.png" title="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" alt="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" width="600px" /><img src="figure_raw/Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression2.png" title="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" alt="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" width="600px" /><img src="figure_raw/Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression3.png" title="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" alt="plot of chunk Gender_TeacherRatedDefensiveEgotism_TeacherRatedSocialAggression" width="600px" />


## 4. Gender_PeerRatedSelfEsteem_PeerRatedVictimOfBullying
*Gender, self-esteem and victim of bullying.* We regressed peer-rated victim of bullying (Column M) onto gender (Column D), peer-rated self-esteem (Column O), and the interaction term (Column P) 









