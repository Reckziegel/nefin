#' Download Factor Portfolios
#'
#' Portfolios of Different Sorts
#'
#'
#' @rdname portfolios
#' @return A \code{tibble}
#' @export
#'
#' @examples
#' #portfolios_sorted_by_size()
portfolios_sorted_by_size <- function() {

  url <- "http://nefin.com.br/data/Portfolios/3_portfolios_sorted_by_size.xls"
  destfile <- "X3_portfolios_sorted_by_size.xls"
  curl::curl_download(url, destfile)
  X3_portfolios_sorted_by_size <- readxl::read_excel(destfile)

  X3_portfolios_sorted_by_size |>
    dplyr::mutate(date = lubridate::ymd(paste0(.data$year, "/", .data$month, "/", .data$day))) |>
    dplyr::select(.data$date, size1 = .data$Size1, size2 = .data$Size2, size3 = .data$Size3)

}

#' @rdname portfolios
#' @export
portfolios_sorted_by_book_to_market <- function() {

  url <- "http://nefin.com.br/data/Portfolios/3_portfolios_sorted_by_book-to-market.xls"
  destfile <- "X3_portfolios_sorted_by_book_to_market.xls"
  curl::curl_download(url, destfile)
  X3_portfolios_sorted_by_book_to_market <- readxl::read_excel(destfile)

  X3_portfolios_sorted_by_book_to_market |>
    dplyr::mutate(date = lubridate::ymd(paste0(.data$year, "/", .data$month, "/", .data$day))) |>
    dplyr::select(.data$date, tidyselect::starts_with("BM")) |>
    dplyr::rename_with(tolower)

}

#' @rdname portfolios
#' @export
portfolios_sorted_by_momentum <- function() {

  url <- "http://nefin.com.br/data/Portfolios/3_portfolios_sorted_by_momentum.xls"
  destfile <- "X3_portfolios_sorted_by_momentum.xls"
  curl::curl_download(url, destfile)
  X3_portfolios_sorted_by_momentum <- readxl::read_excel(destfile)

  X3_portfolios_sorted_by_momentum |>
    dplyr::mutate(date = lubridate::ymd(paste0(.data$year, "/", .data$month, "/", .data$day))) |>
    dplyr::select(.data$date, tidyselect::starts_with("Mom")) |>
    dplyr::rename_with(tolower)

}

#' @rdname portfolios
#' @export
portfolios_sorted_by_illiquidity <- function() {

  url <- "http://nefin.com.br/data/Portfolios/3_portfolios_sorted_by_illiquidity.xls"
  destfile <- "X3_portfolios_sorted_by_illiquidity.xls"
  curl::curl_download(url, destfile)
  X3_portfolios_sorted_by_illiquidity <- readxl::read_excel(destfile)

  X3_portfolios_sorted_by_illiquidity |>
    dplyr::mutate(date = lubridate::ymd(paste0(.data$year, "/", .data$month, "/", .data$day))) |>
    dplyr::select(.data$date, tidyselect::starts_with("ILLIQ")) |>
    dplyr::rename_with(tolower)

}

#' @rdname portfolios
#' @export
portfolios_sorted_by_industry <- function() {

  url <- "http://nefin.com.br/data/Portfolios/7_portfolios_sorted_by_industry.xls"
  destfile <- "X7_portfolios_sorted_by_industry.xls"
  curl::curl_download(url, destfile)
  X7_portfolios_sorted_by_industry <- readxl::read_excel(destfile,
                                                         col_types = c("numeric", "numeric", "numeric",
                                                                       "numeric", "numeric", "numeric",
                                                                       "numeric", "numeric", "numeric",
                                                                       "numeric"))
  X7_portfolios_sorted_by_industry |>
    dplyr::mutate(date = lubridate::ymd(paste0(year, "/", month, "/", day))) |>
    dplyr::select(date, tidyselect::starts_with("Industry")) |>
    dplyr::rename_with(.fn = tolower)

}
