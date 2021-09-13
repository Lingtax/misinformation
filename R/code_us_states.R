
#' code_us_states
#'
#' Name US states and territories from alphabetical index
#'
#' @param state_code an integer representing US state/territory in alphabetical order
#'
#' @return a character label for state or territory
#' @export
#'
#' @examples
#' df <-  tibble(state = sample(1:56, 200, replace = TRUE)) %>%
#' mutate(coded_state = code_us_states(state))
code_us_states <- function(state_code) {

  if(!(state_code %in% c(1:56))) stop("Input `state_code` is not an integer between 1 & 56")

  # state_codes <- tribble(
  #   ~index, ~state,
  #   1, "Alabama",
  #   2, "Alaska",
  #   3, "American Samoa",
  #   4, "Arizona",
  #   5, "Arkansas",
  #   6, "California",
  #   7, "Colorado",
  #   8, "Connecticut",
  #   9, "Delaware",
  #   10, "District of Columbia",
  #   11, "Florida",
  #   12, "Georgia",
  #   13, "Guam",
  #   14, "Hawaii",
  #   15, "Idaho",
  #   16, "Illinois",
  #   17, "Indiana",
  #   18, "Iowa",
  #   19, "Kansas",
  #   20, "Kentucky",
  #   21, "Louisiana",
  #   22, "Maine",
  #   23, "Maryland",
  #   24, "Massachusetts",
  #   25, "Michigan",
  #   26, "Minnesota",
  #   27, "Mississippi",
  #   28, "Missouri",
  #   29, "Montana",
  #   30, "Nebraska",
  #   31, "Nevada",
  #   32, "New Hampshire",
  #   33, "New Jersey",
  #   34, "New Mexico",
  #   35, "New York",
  #   36, "North Carolina",
  #   37, "North Dakota",
  #   38, "Northern Mariana Islands",
  #   39, "Ohio",
  #   40, "Oklahoma",
  #   41, "Oregon",
  #   42, "Pennsylvania",
  #   43, "Puerto Rico",
  #   44, "Rhode Island",
  #   45, "South Carolina",
  #   46, "South Dakota",
  #   47, "Tennessee",
  #   48, "Texas",
  #   49, "Utah",
  #   50, "Vermont",
  #   51, "Virgin Islands",
  #   52, "Virginia",
  #   53, "Washington",
  #   54, "West Virginia",
  #   55, "Wisconsin",
  #   56, "Wyoming")

us_codes[state_code]

}

#' us_codes
#' A vector of US states and territories in alphabetical order
#'
#' @name us_codes
#' @docType data


