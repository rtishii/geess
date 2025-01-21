library(testthat)
library(geess)

res <- geess(formula = Count ~ Drug + Base + factor(Time),
             family = poisson, data = epilepsy,
             id = ID, repeated = Time, corstr = "ar1",
             beta.method = "PGEE", SE.method = "MB")

res_sum <- summary(res)

coef1 <- res$coefficients[2]
names(coef1) <- NULL

se1 <- res_sum$coefficients[2, 2]

test_that("Test geessbin not cleared", {
  expect_equal(round(coef1, 4), 0.0347)
  expect_equal(round(se1, 5), 0.31097)
})
