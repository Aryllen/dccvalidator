#' Check if user is certified
#'
#' Check if user has completed and passed the Certified User Quiz.
#'
#' @param id User ID
#' @export
#' @examples
#' \dontrun{
#' library("synapser")
#' synLogin()
#' check_certified_user("3384770")
#' }
check_certified_user <- function(id) {
  res <- list(passed = FALSE)
  try(
    res <- synapser::synRestGET(
      glue::glue("/user/{id}/certifiedUserPassingRecord")
    ),
    silent = TRUE
  )
  behavior <- "You must be a certified user to use this application. Please complete the <a href='https://www.synapse.org/#!Quiz:'>Certified User Quiz</a>." # nolint
  if (res$passed) {
    check_pass(
      msg = "User is certified",
      behavior = behavior
    )
  } else {
    check_fail(
      msg = "Not a certified user",
      behavior = behavior
    )
  }
}
