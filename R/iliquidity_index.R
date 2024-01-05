#' Download the Illiquidity Index
#'
#' Get a response on how the market moves in response to its traded volume.
#'
#' @return A \code{tibble}
#' @export
#'
#' @examples
#' #iliquidity_index()
iliquidity_index <- function() {

  url <- "https://nefin.com.br/resources/risk_factors/Market_Liquidity.xls"
  destfile <- "Market_Liquidity.xls"
  curl::curl_download(url, destfile)
  Market_Liquidity <- readxl::read_excel(destfile)

  Market_Liquidity |>
    dplyr::mutate(date = lubridate::ym(paste0(.data$year, "/", .data$month))) |>
    dplyr::select(.data$date, iliquidity = .data$Illiquidity)

}
