#' Download the Short-Interest
#'
#' Get the ratio between the number of shorted stock and the stock outstanding
#' for the Market.
#'
#' @return A \code{tibble}
#' @export
#'
#' @examples
#' #short_interest()
short_interest <- function() {

  url <- "http://nefin.com.br/resources/Predictability/short_interest.xls"
  destfile <- "short_interest.xls"
  curl::curl_download(url, destfile)
  short_interest <- readxl::read_excel(destfile)

  short_interest |>
    dplyr::mutate(date = lubridate::as_date(paste0(.data$year, "/", .data$month, "/", .data$day))) |>
    dplyr::select(.data$date, short_interest = .data$week_si)

}

