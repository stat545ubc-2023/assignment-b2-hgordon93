
<!-- README.md is generated from README.Rmd. Please edit that file -->

# countgroups

<!-- badges: start -->
<!-- badges: end -->

The goal of countgroups is to count observations based on grouped or
filtered variables. It provides a function to make this task easier.

The package contains a function that summarises the number of
observations for one or more variables within a data frame. It can be
used to compute the number of observations of one or more grouped
variables, the number of observations that meet a specified condition,
or a combination of the two.

## Installation

You can install the development version of countgroups from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2023/countgroups", ref = "0.1.0")
```

## Example

The following is an example of how to use the countgroups function with
the palmerpenguins dataset *penguins*, to count the number of
observations by island and sex for penguins of the species Adelie.

``` r
library(countgroups)

count_by_groups_filter_by_condition(df=palmerpenguins::penguins, c(island, sex), cond=species=="Adelie")
#> # A tibble: 8 × 3
#> # Groups:   island [3]
#>   island    sex        n
#>   <fct>     <fct>  <int>
#> 1 Biscoe    female    22
#> 2 Biscoe    male      22
#> 3 Dream     female    27
#> 4 Dream     male      28
#> 5 Dream     <NA>       1
#> 6 Torgersen female    24
#> 7 Torgersen male      23
#> 8 Torgersen <NA>       5
```

Notice that the output is a data frame with 3 columns (island, sex, and
n for number of observations), and 8 rows corresponding to each
observation.

## Example 2

The function count_by_groups_filter_by_condition can be used to count
observations based on grouping variables or a condition. This example
demonstrates use of the function with the same *penguins* data set to
filter by sex to return the number of observations of female penguins.

``` r

count_by_groups_filter_by_condition(df=palmerpenguins::penguins, cond=sex=="female")
#> # A tibble: 1 × 1
#>       n
#>   <int>
#> 1   165
```

Notice that the output in this case will always be a 1x1 data frame that
has one column, n, and one row, the number of observations that meet the
condition.
