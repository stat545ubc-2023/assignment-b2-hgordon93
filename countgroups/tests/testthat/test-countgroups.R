test_that("numeric vector causes error", {
  expect_error(count_by_groups_filter_by_condition(15, groups=8))
})

test_that("no data frame argument causes error",{
  expect_error(count_by_groups_filter_by_condition(groups=species))
})

test_that("condition as object causes error",{
  expect_error(count_by_groups_filter_by_condition(penguins, c(species, sex), cond=island))
})
