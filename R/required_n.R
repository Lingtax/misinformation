#' Attrition and incompleteness calculator
#'
#' A function for calculating the required starting
#'  sample to correct for attrition and incomplete data.
#'
#' @param final integer target n
#' @param attrition The decimal rate of attrition from 0 (0%) to 1 (100%)
#' @param trials An integer number of measurement points over which attrition occurs
#'  (i.e. after the first measurement). If calculating loss to missingness, specify as 1.
#'
#' @return An integer of the required starting sample
#' @export
#'
#' @examples
required_n <-  function(final, attrition = 0.1, trials = 1) {

  if (is.numeric(final) == FALSE){
    stop("Final N (final) must be numeric")
  }

  if (round(final, 0) != final){
    stop("Final N (final) must be an integer")
  }

  if (is.numeric(trials) == FALSE){
    stop("Number of trials (trials) must be numeric")
  }

  if (round(trials, 0) != trials){
    stop("Number of trials (trials) must be an integer")
  }

  if (attrition >1 | attrition < 0){
    stop("Rate of attrition must be between 0 and 100 percent")
  }

  increase <-  1 / (1 - attrition)
  ceiling(final*(i^trials))

}
