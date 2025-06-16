
<!-- README.md is generated from README.Rmd. Please edit that file -->

# geess

<!-- badges: start -->

<!-- badges: end -->

The geess function analyzes small-sample clustered or longitudinal data
using modified generalized estimating equations (GEE) with bias-adjusted
covariance estimator. This is an extension of geessbin function [(Ishii
et al., 2024)](https://doi.org/10.1186/s12874-024-02368-2). The geess
function provides any combination of three GEE methods (conventional and
two modified GEE methods) and 12 covariance estimators (unadjusted and
11 bias-adjusted estimators).

## Installation

You can install the released version of geess from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("geess")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("rtishii/geess")
```

## Example

This is a basic example:

``` r
library(geess)
library(MASS)

# analysis of longitudinal count data usinBCg GEE method with Morel et al. covariance estimator
res <- geess(formula = y ~ trt + period + lbase + lage,
             family = poisson, data = epil, id = subject,
             repeated = period, corstr = "unstructured",
             beta.method = "BCGEE", SE.method = "MB")

print(res)
#> Call:
#> geess(formula = y ~ trt + period + lbase + lage, family = poisson, 
#>     data = epil, id = subject, corstr = "unstructured", repeated = period, 
#>     beta.method = "BCGEE", SE.method = "MB")
#> 
#> Model:  
#>  Family:  poisson 
#>  Link:  log 
#>  Correlation Structure:  unstructured 
#> 
#> Estimation Method:  
#>  Regression Coefficients:  BCGEE 
#>  Standard Errors:  MB 
#> 
#> Number of observations:  236 
#> Number of clusters:  59 
#> Maximum cluster size:  4 
#> 
#> Coefficients:
#>  (Intercept) trtprogabide       period        lbase         lage 
#>       1.8435      -0.0141      -0.0549       1.2397       0.6058 
#> 
#> Estimated Scale Parameter:  4.84
#> Number of Iterations:  7 
#> 
#> Working Correlation:
#>       1     2     3     4
#> 1 1.000 0.480 0.421 0.259
#> 2 0.480 1.000 0.624 0.331
#> 3 0.421 0.624 1.000 0.453
#> 4 0.259 0.331 0.453 1.000
#> 
#> Convergence status:  Converged

# hypothesis tests for regression coefficients
summary(res)
#> Call:
#> geess(formula = y ~ trt + period + lbase + lage, family = poisson, 
#>     data = epil, id = subject, corstr = "unstructured", repeated = period, 
#>     beta.method = "BCGEE", SE.method = "MB")
#> 
#> Correlation Structure:  unstructured 
#> Estimation Method for Regression Coefficients:  BCGEE 
#> Estimation Method for Standard Errors:  MB 
#> 
#> Coefficients:
#>              Estimate Std.err Lower Limit Upper Limit       Z Pr(>|Z|)
#> (Intercept)    1.8435  0.1531      1.5435      2.1435 12.0437 2.09e-33
#> trtprogabide  -0.0141  0.1912     -0.3888      0.3607 -0.0736 9.41e-01
#> period        -0.0549  0.0411     -0.1355      0.0257 -1.3345 1.82e-01
#> lbase          1.2397  0.1611      0.9238      1.5555  7.6927 1.44e-14
#> lage           0.6058  0.3157     -0.0129      1.2246  1.9191 5.50e-02
#> 
#> Exp(coef) with 95% Confidence Intervals :
#>              Exp(coef) Lower Limit Upper Limit
#> trtprogabide     0.986       0.678        1.43
#> period           0.947       0.873        1.03
#> lbase            3.454       2.519        4.74
#> lage             1.833       0.987        3.40
#> 
#> Estimated Scale Parameter:  4.84
#> Number of Iterations:  7 
#> 
#> Working Correlation:
#>       1     2     3     4
#> 1 1.000 0.480 0.421 0.259
#> 2 0.480 1.000 0.624 0.331
#> 3 0.421 0.624 1.000 0.453
#> 4 0.259 0.331 0.453 1.000
```
