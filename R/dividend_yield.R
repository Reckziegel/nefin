#' Download the Dividend Yield
#'
#' Get the ratio of the dividends over the stock prices in a given period.
#'
#' @return A \code{tibble}
#' @export
#'
#' @examples
#' #dividend_yield()
dividend_yield <- function() {

  url <- "http://nefin.com.br/resources/Predictability/dividend_yield.xls"
  destfile <- "dividend_yield.xls"
  curl::curl_download(url, destfile)
  dy <- readxl::read_excel(destfile)

  dy |>
    dplyr::mutate(date = lubridate::as_date(paste0(.data$year, "/", .data$month, "/", .data$day))) |>
    dplyr::select(date, dy = .data$yield_week_pc)

}

