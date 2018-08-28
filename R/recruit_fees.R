#' Calculate recruitment costs in MTurk, ProlificAc and Turkprime
#'
#' @param n Target sample
#' @param duration time (in minutes) to complete study
#' @param pay rate of pay per participant in USD
#'
#' @return A dataframe of calculated costs
#' @export
#'
#' @examples
recruit_fees <- function(n, duration, pay) {

  # Add "solve for n"
  rate <- pay / (duration / 60)

  if (n != round(n, 0)) {stop("n must be an integer number of participants")}
  if (duration < 0) {stop("Duration must be positive")}
  if (pay < .10) {stop("Pay must be more than 10c")}

  basepay <- n * pay

  if (rate < 6.5) {
    warning("Rate below Prolific Minimum $6.50 per hour. Take a good look in the mirror.")
    prolific <-  NA
    pnote <-  NA
    }
  if (rate > 6.5) {
    prolific <-  basepay * 1.3
    pnote <-  "No prescreening fees apply"
  }

  if (n > 10) {
    mturk <- basepay * 1.4
    note  <- "Mturk bulk pricing applies"
  }
  if (n < 10) {
    mturk <- basepay * 1.2
    note <- NA
  }

  tprime <- basepay * 1.2 + basepay * .05 + .02*n
  tpnote <- paste0("Maximum panel charge is US$", n*3)

  out <- data.frame(
    Host = c("MTurk", "TurkPrime", "Prolific Academic"),
    USD = c(mturk, tprime, prolific),
    notes = c(note, tpnote, pnote)
  )

  out

  }
