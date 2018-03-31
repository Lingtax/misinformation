#' Recodes qualtrics default country codes
#'
#' @param countrycode A number referring to a default reference in the qualtrics country variable.
#'
#' @return The Name of the corresponding country
#' @export
qtr_countries <- function(countrycode) {
  if(!is.numeric(countrycode)){stop("Input variable is not a number")}
  countries[countries$number==countrycode, 1]

  }
