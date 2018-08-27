#' Replaces names by reference to a metadata dataframe
#'
#' `meta_rename` allows fast replacement of variable names by key-value pairing with a metadata file.
#'
#' @param df A data.frame object for renaming.
#' @param metadata A data.frame object containing the key-value pair
#' @param old An unquoted string of the key column name in the metadata object
#' @param new An unquoted string of the value column name in the metadata object
#'
#' @return `data.frame` object with new names as per key-value pairs.
#' @export
#'
#' @examples
#'
#' testdata <-  tibble(a = 0L,
#' b = 0L,
#' c = 0L)
#'
#' meta <-  tibble(DatasetPositon = 1:3,
#'                 VariableID =	letters[1:3],
#'                 VariableType = "integer",
#'                 VariableLabel = c("item1", "item2", "item3"),
#'                 ItemText = c("This is item 1",
#'                              "This is item 2",
#'                              "This is item 3")
#' )
#'
#' meta_rename(testdata, metadata = meta, old = VariableID, new = VariableLabel)
#'
meta_rename <-  function(df, metadata, old, new) {

  keys   <- metadata[[deparse(substitute(old))]]
  values <- metadata[[deparse(substitute(new))]]
  rename_at(df, vars(keys), ~ values)
}
