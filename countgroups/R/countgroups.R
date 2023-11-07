count_by_groups_filter_by_condition <- function(df, groups, cond) {
  df %>%
    group_by(pick({{ groups }})) %>%
    filter({{ cond }}) %>%
    summarise(n=n())
}
