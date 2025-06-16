library(testthat)
library(geess)
library(MASS)

res <- geess(formula = y ~ trt + period + lbase + lage,
             family = poisson, data = epil, id = subject,
             repeated = period, corstr = "unstructured",
             beta.method = "BCGEE", SE.method = "MB")

res_sum <- summary(res)

coef1 <- res$coefficients[2]
names(coef1) <- NULL

se1 <- res_sum$coefficients[2, 2]

test_that("Test geessbin not cleared", {
  expect_equal(round(coef1, 4), -0.0141)
  expect_equal(round(se1, 4), 0.1912)
})
