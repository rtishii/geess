
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

You can install the geess package from [GitHub](https://github.com/)
with:

``` r
# install.packages("devtools")
devtools::install_github("rtishii/geess")
```

## Example

This is a basic example:

``` r
library(geess)
data(dental)

# analysis of longitudinal count data using BCGEE method with Morel et al. covariance estimator
res <- 
  geess(formula = Distance ~ Sex + Time, family = gaussian, data = dental, 
        id = ID, repeated = Time, corstr = "unstructured", 
        beta.method = "BCGEE", SE.method = "MB")
#> GEE, BCGEE, and PGEE are equivalent for gaussian

print(res)
#> Call:
#> geess(formula = Distance ~ Sex + Time, family = gaussian, data = dental, 
#>     id = ID, corstr = "unstructured", repeated = Time, beta.method = "BCGEE", 
#>     SE.method = "MB")
#> 
#> Model:  
#>  Family:  gaussian 
#>  Link:  identity 
#>  Correlation Structure:  unstructured 
#> 
#> Estimation Method:  
#>  Regression Coefficients:  BCGEE 
#>  Standard Errors:  MB 
#> 
#> Number of observations:  108 
#> Number of clusters:  27 
#> Maximum cluster size:  4 
#> 
#> Coefficients:
#> (Intercept)         Sex        Time 
#>       19.47        2.29        1.31 
#> 
#> Estimated Scale Parameter:  5.17
#> Number of Iterations:  6 
#> 
#> Working Correlation:
#>       1     2     3     4
#> 1 1.000 0.567 0.776 0.512
#> 2 0.567 1.000 0.585 0.627
#> 3 0.776 0.585 1.000 0.851
#> 4 0.512 0.627 0.851 1.000
#> 
#> Convergence status:  Converged

# hypothesis tests for regression coefficients
summary(res)
#> Call:
#> geess(formula = Distance ~ Sex + Time, family = gaussian, data = dental, 
#>     id = ID, corstr = "unstructured", repeated = Time, beta.method = "BCGEE", 
#>     SE.method = "MB")
#> 
#> Correlation Structure:  unstructured 
#> Estimation Method for Regression Coefficients:  BCGEE 
#> Estimation Method for Standard Errors:  MB 
#> 
#> Coefficients:
#>             Estimate Std.err Lower Limit Upper Limit     Z  Pr(>|Z|)
#> (Intercept)    19.47   0.707      18.084       20.86 27.53 8.34e-167
#> Sex             2.29   0.820       0.686        3.90  2.80  5.16e-03
#> Time            1.31   0.155       1.009        1.62  8.49  2.09e-17
#> 
#> Estimated Scale Parameter:  5.17
#> Number of Iterations:  6 
#> 
#> Working Correlation:
#>       1     2     3     4
#> 1 1.000 0.567 0.776 0.512
#> 2 0.567 1.000 0.585 0.627
#> 3 0.776 0.585 1.000 0.851
#> 4 0.512 0.627 0.851 1.000
```
