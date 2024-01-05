
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nefin

<!-- badges: start -->

[![R-CMD-check](https://github.com/Reckziegel/nefin/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Reckziegel/nefin/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

The goal of `nefin` is to facilitate the access to the datasets computed
by NEFIN: <http://nefin.com.br/>.

The package is reviewed monthly in order to keep the API working
properly.

Any doubts or suggestions, please, open an issue.

This file was last updated at: 2024-01-04 23:32:01.

# Installation

You can install the development version of `nefin` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Reckziegel/nefin")
```

## Example

``` r
library(nefin)

# Get the Brazilian Risk Factors
risk_factors()
#> # A tibble: 5,859 x 8
#>    date            mkt       rf   mkt_rf   smb   hml   mom illiq
#>    <date>        <dbl>    <dbl>    <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1 2000-01-03 -0.00702 0.000696 -0.00772    NA    NA    NA    NA
#>  2 2000-01-04 -0.0528  0.000699 -0.0535     NA    NA    NA    NA
#>  3 2000-01-05  0.0137  0.000695  0.0130     NA    NA    NA    NA
#>  4 2000-01-06 -0.00283 0.000698 -0.00352    NA    NA    NA    NA
#>  5 2000-01-07  0.0142  0.000694  0.0135     NA    NA    NA    NA
#>  6 2000-01-10  0.0367  0.000685  0.0360     NA    NA    NA    NA
#>  7 2000-01-11 -0.0213  0.000696 -0.0220     NA    NA    NA    NA
#>  8 2000-01-12 -0.00529 0.000688 -0.00598    NA    NA    NA    NA
#>  9 2000-01-13  0.0318  0.000689  0.0311     NA    NA    NA    NA
#> 10 2000-01-14  0.0211  0.000688  0.0204     NA    NA    NA    NA
#> # i 5,849 more rows

# Get the Dividend Yield for the Market
dividend_yield()
#> # A tibble: 1,181 x 2
#>    date            dy
#>    <date>       <dbl>
#>  1 2001-02-02 0.00723
#>  2 2001-02-09 0.00725
#>  3 2001-02-16 0.00735
#>  4 2001-02-23 0.00761
#>  5 2001-03-02 0.00752
#>  6 2001-03-09 0.00750
#>  7 2001-03-16 0.00805
#>  8 2001-03-23 0.00841
#>  9 2001-03-30 0.00842
#> 10 2001-04-06 0.00694
#> # i 1,171 more rows

# Cost of Equity for Different Horizons and Sectors
cost_of_equity()
#> # A tibble: 6,272 x 4
#>    date       sectors        horizon          cost
#>    <date>     <fct>          <fct>           <dbl>
#>  1 2005-01-01 Basic_Products 1-Year Project   16.3
#>  2 2005-01-01 Basic_Products 5-Year Project   12.7
#>  3 2005-01-01 Basic_Products 10-Year Project  12.7
#>  4 2005-01-01 Basic_Products 20-Year Project  12.7
#>  5 2005-02-01 Basic_Products 1-Year Project   16.9
#>  6 2005-02-01 Basic_Products 5-Year Project   12.8
#>  7 2005-02-01 Basic_Products 10-Year Project  12.7
#>  8 2005-02-01 Basic_Products 20-Year Project  12.7
#>  9 2005-03-01 Basic_Products 1-Year Project   17.0
#> 10 2005-03-01 Basic_Products 5-Year Project   13.0
#> # i 6,262 more rows

# Fama-French Factor Portfolios
portfolios_sorted_by_book_to_market()
#> # A tibble: 5,615 x 4
#>    date             bm1      bm2      bm3
#>    <date>         <dbl>    <dbl>    <dbl>
#>  1 2001-01-02 -0.00802  -0.00911  0.0575 
#>  2 2001-01-03  0.0710    0.0622   0.0804 
#>  3 2001-01-04  0.000997  0.00738 -0.00133
#>  4 2001-01-05 -0.00891  -0.00616 -0.0113 
#>  5 2001-01-08  0.00684   0.00976  0.00879
#>  6 2001-01-09  0.0229    0.0287   0.0220 
#>  7 2001-01-10 -0.00395  -0.00626  0.00851
#>  8 2001-01-11 -0.00224   0.0126  -0.00570
#>  9 2001-01-12 -0.000977 -0.0145   0.00250
#> 10 2001-01-15  0.00789   0.00178  0.00713
#> # i 5,605 more rows
```
