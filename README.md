
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

This file was last updated at: 2023-05-11 22:14:41.

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
#> # A tibble: 5,528 x 7
#>    date       rm_minus_rf        smb       hml       wml      iml risk_free
#>    <date>           <dbl>      <dbl>     <dbl>     <dbl>    <dbl>     <dbl>
#>  1 2001-01-02    0.00660   0.000524   0.0655   -0.00631   0.0141   0.000579
#>  2 2001-01-03    0.0624    0.00539    0.00939  -0.0286    0.00451  0.000577
#>  3 2001-01-04   -0.000310  0.00669   -0.00233  -0.000946 -0.00923  0.000574
#>  4 2001-01-05   -0.0128    0.00352   -0.00240   0.00598   0.0251   0.000573
#>  5 2001-01-08    0.00398   0.00788    0.00195  -0.00410  -0.00118  0.000573
#>  6 2001-01-09    0.0200    0.00593   -0.000916  0.00956  -0.00398  0.000570
#>  7 2001-01-10   -0.00437   0.0132     0.0125   -0.000691  0.0221   0.000570
#>  8 2001-01-11    0.00469  -0.0108    -0.00345  -0.00306  -0.00228  0.000568
#>  9 2001-01-12   -0.00678   0.00662    0.00347   0.00602   0.0103   0.000567
#> 10 2001-01-15    0.00511   0.0000672 -0.000760 -0.0138    0.00689  0.000566
#> # i 5,518 more rows

# Get the Dividend Yield for the Market
dividend_yield()
#> # A tibble: 1,163 x 2
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
#> # i 1,153 more rows

# Cost of Equity for Different Horizons and Sectors
cost_of_equity()
#> # A tibble: 6,160 x 4
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
#> 10 2005-03-01 Basic_Products 5-Year Project   13  
#> # i 6,150 more rows

# Fama-French Factor Portfolios
portfolios_sorted_by_book_to_market()
#> # A tibble: 5,528 x 4
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
#> # i 5,518 more rows
```
