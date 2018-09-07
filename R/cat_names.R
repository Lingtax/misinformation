#' Returns unquoted column names for scripting
#'
#' @param df a dataframe or tibble
#' @param pattern an optional regex for selection of column names
#' @param index an optional vector of column indices for selection
#' @param sep seperator for column names, suggestions include ", ", " + ", and combinations with newline.
#'
#' @return An unquoted string of column names
#' @export
#'
#' @examples
#' df <-  data.frame(A = 0L, B= 0L, C = 0L, test1 = 0L, test2 = 0L)
#' cat_names(df)
#' cat_names(df, sep = ',')
#' cat_names(df, index =2:3, sep = '+')
#' cat_names(df, pattern = "test", sep = '+')

cat_names <-  function(df, pattern = NULL, index = NULL, sep = "\n") {
  if (is.null(names(df))) {
    stop("df must have names")
  }
  if (!is.null(pattern) & !is.null(index)) {
    stop("Can only select on one of index or pattern")
  }
  if (!is.null(pattern)) {
    cat(names(df)[grepl(pattern = pattern, names(df))], sep = sep)
  }
  if (!is.null(index)) {
    cat(names(df)[index], sep = sep)
  }
  if (is.null(pattern) & is.null(index)) {
    cat(names(df), sep = sep)
  }
}

