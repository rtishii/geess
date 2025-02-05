#' epilepsy dataset
#'
#' The data are from a clinical trial of 59 epileptics, presented by Thall and
#' Vail (1990). Patients were randomly assigned to receive either an
#' anti-epileptic drug or a placebo. The outcome variable was the number of
#' epileptic seizures, measured at baseline and at four subsequent time points.
#'
#' @name epilepsy
#'
#' @docType data
#'
#' @format A data frame with 64 observations on the following 6 variables:
#'   \describe{
#'     \item{\code{ID}}{patient identifier.}
#'     \item{\code{Drug}}{treatment indicator (0 = placebo;
#'     1 = anti-epileptic drug).}
#'     \item{\code{Age}}{age in years at baseline.}
#'     \item{\code{Base}}{baseline measurement of the number of epileptic
#'     seizures.}
#'     \item{\code{Time}}{time point raging from 1 to 4.}
#'     \item{\code{Count}}{number of epileptic seizures.}
#'   }
#'
#' @examples data(epilepsy)
#'
#' @references \itemize{
#'   \item Thall, P. F. and Vail, S. C. (1990).
#'         Some Covariance Models for Longitudinal Count Data
#'         with Overdispersion.
#'         \emph{Biometrics}, 46, 657–671,
#'         \doi{10.2307/2532086}.
#'   }
NULL
