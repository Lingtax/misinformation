% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/code_us_states.R
\name{code_us_states}
\alias{code_us_states}
\title{code_us_states}
\usage{
code_us_states(state_code)
}
\arguments{
\item{state_code}{an integer representing US state/territory in alphabetical order}
}
\value{
a character label for state or territory
}
\description{
Name US states and territories from alphabetical index
}
\examples{
df <-  tibble(state = sample(1:56, 200, replace = TRUE)) \%>\%
mutate(coded_state = code_us_states(state))
}
