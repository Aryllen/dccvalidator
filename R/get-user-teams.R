#' Get teams a user belongs to
#'
#' Looks up the teams a user belongs to. By default, it looks for teams of the
#' current logged in user. You must be logged in to Synapse to use this
#' function.
#'
#' @param user Synapser user object (e.g. output from
#'   [synapser::synGetUserProfile])
#' @return Character vector of team IDs the user belongs to
#' @examples
#' \dontrun{
#' get_user_teams()
#' get_user_teams("karawoo")
#' }
get_user_teams <- function(user) {
  user_teams <- synapser::synRestGET(
    paste0(
      "/user/",
      user$ownerId,
      "/team?limit=10000"
    )
  )$results

  purrr::map_chr(user_teams, function(x) x$id)
}