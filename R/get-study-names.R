#' Gather studies within consortium
#' @return list of studies
get_studies <- function() {
  study_table_id <- "syn11363298"
  study_table <- syndccutils::get_table_df(study_table_id)
  return(sort(study_table$StudyName))
}
