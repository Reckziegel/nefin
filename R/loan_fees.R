#' Download the Loan Fees
#'
#' Get the weighted average loan fees of the market.
#'
#' @return A \code{tibble}
#' @export
#'
#' @examples
#' #loan_fees
loan_fees <- function() {

  url <- "http://nefin.com.br/resources/Predictability/loan_fees.xls"
  destfile <- "loan_fees.xls"
  curl::curl_download(url, destfile)
  loan_fees <- readxl::read_excel(destfile)

  loan_fees |>
    dplyr::mutate(date = lubridate::as_date(paste0(.data$year, "/", .data$month, "/", .data$day))) |>
    dplyr::select(.data$date, loan_fees = .data$week_loan_fee)

}
