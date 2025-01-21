
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
data(epilepsy)

# analysis of longitudinal count data using PGEE method with Morel et al. covariance estimator
res <- geess(formula = Count ~ Drug + Base + factor(Time), 
             family = poisson, data = epilepsy,
             id = ID, repeated = Time, corstr = "ar1",
             beta.method = "PGEE", SE.method = "MB")

print(res)
#> Call:
#> geess(formula = Count ~ Drug + Base + factor(Time), family = poisson, 
#>     data = epilepsy, id = ID, corstr = "ar1", repeated = Time, 
#>     beta.method = "PGEE", SE.method = "MB")
#> 
#> Model:  
#>  Family:  poisson 
#>  Link:  log 
#>  Correlation Structure:  ar1 
#> 
#> Estimation Method:  
#>  Regression Coefficients:  PGEE 
#>  Standard Errors:  MB 
#> 
#> Number of observations:  236 
#> Number of clusters:  59 
#> Maximum cluster size:  4 
#> 
#> Coefficients:
#>   (Intercept)          Drug          Base factor(Time)2 factor(Time)3 
#>        1.6103        0.0347        0.0187       -0.0266       -0.0513 
#> factor(Time)4 
#>       -0.1921 
#> 
#> Estimated Scale Parameter:  18.1
#> Number of Iterations:  8 
#> 
#> Working Correlation:
#>       1     2     3     4
#> 1 1.000 0.796 0.633 0.504
#> 2 0.796 1.000 0.796 0.633
#> 3 0.633 0.796 1.000 0.796
#> 4 0.504 0.633 0.796 1.000
#> 
#> Convergence status:  Converged

# hypothesis tests for regression coefficients
summary(res)
#> Call:
#> geess(formula = Count ~ Drug + Base + factor(Time), family = poisson, 
#>     data = epilepsy, id = ID, corstr = "ar1", repeated = Time, 
#>     beta.method = "PGEE", SE.method = "MB")
#> 
#> Correlation Structure:  ar1 
#> Estimation Method for Regression Coefficients:  PGEE 
#> Estimation Method for Standard Errors:  MB 
#> 
#> Coefficients:
#>               Estimate Std.err      Z Pr(>|Z|)
#> (Intercept)     1.6103 0.27099  5.942 2.81e-09
#> Drug            0.0347 0.31097  0.112 9.11e-01
#> Base            0.0187 0.00451  4.141 3.46e-05
#> factor(Time)2  -0.0266 0.12095 -0.220 8.26e-01
#> factor(Time)3  -0.0513 0.15564 -0.330 7.42e-01
#> factor(Time)4  -0.1921 0.11271 -1.705 8.82e-02
#> 
#> Exp(coef) with 95% Confidence Intervals :
#>               Exp(coef) Lower Limit Upper Limit
#> Drug              1.035       0.563        1.90
#> Base              1.019       1.010        1.03
#> factor(Time)2     0.974       0.768        1.23
#> factor(Time)3     0.950       0.700        1.29
#> factor(Time)4     0.825       0.662        1.03
#> 
#> Estimated Scale Parameter:  18.1
#> Number of Iterations:  8 
#> 
#> Working Correlation:
#>       1     2     3     4
#> 1 1.000 0.796 0.633 0.504
#> 2 0.796 1.000 0.796 0.633
#> 3 0.633 0.796 1.000 0.796
#> 4 0.504 0.633 0.796 1.000
```
