#' Count Observations by Grouped Variables
#'
#' This is a function that summarises the number of observations for one or more variables within a data frame. It can be used to compute the number of  observations of one or more grouped variables, the number of observations that meet a specified condition, or a combination of the two. It uses functions from the tidyverse.
#'
#' @param df The first argument is named 'df' as a shorthand for data frame. This is a required argument.
#' @param groups This argument is named 'groups' to refer to the grouping variable(s) that will be input to the group_by function. It must be an object or use the form c(x,y) if multiple variables are used for grouping. It is not required.
#' @param cond This argument is named 'cond' as a shorthand for condition, to refer to the condition that will be specified in the filter function. This argument must be a logical vector (eg sex=="female"). It is not required.
#'
#' @return An object of the same type as `.df` containing the grouped variables and the corresponding number of observations (n) for each row; if no grouping was  applied and only a filtering condition was used, the output will be a 1x1 object containing the number of observations (n) that meet the condition.
#'
#'  The output has the following properties:
#' * Each group is summarised down to one row.
#' * Columns are not modified; column "n" for observations is created.
#' * Data frame attributes are preserved.
#'
#' @importFrom dplyr group_by
#' @importFrom dplyr filter
#' @importFrom dplyr summarise
#' @importFrom dplyr n
#' @importFrom dplyr pick
#'
#' @export
#'
#' @examples
#' count_by_groups_filter_by_condition(df=palmerpenguins::penguins, c(island, species))
#' count_by_groups_filter_by_condition(df=palmerpenguins::penguins, island, cond=species=="Adelie")
#' count_by_groups_filter_by_condition(df=palmerpenguins::penguins, cond=sex=="female")
#'
count_by_groups_filter_by_condition <- function(df, groups, cond) {
  df |>
    dplyr::group_by(dplyr::pick({{ groups }})) |>
    dplyr::filter({{ cond }}) |>
    dplyr::summarise(n=dplyr::n())
}
