#' Download Risk Factors
#'
#' Downloads Risk Factors from NEFIN
#'
#'
#' @return A \code{tibble}
#' @export
#'
#' @examples
#' # risk_factors()
risk_factors <- function() {

  suppressMessages(
    vroom::vroom(
      file = "https://nefin.com.br/resources/risk_factors/nefin_factors.csv"
    )
  ) |>
    dplyr::select(-`...1`) |>
    janitor::clean_names()

  # urls <- list(
  #   "http://nefin.com.br/resources/risk_factors/Market_Factor.xls",
  #   "http://nefin.com.br/resources/risk_factors/SMB_Factor.xls",
  #   "http://nefin.com.br/resources/risk_factors/HML_Factor.xls",
  #   "http://nefin.com.br/resources/risk_factors/WML_Factor.xls",
  #   "http://nefin.com.br/resources/risk_factors/IML_Factor.xls",
  #   "http://nefin.com.br/resources/risk_factors/Risk_Free.xls"
  # )
  #
  # destfile <- list(
  #   "Market_Factor.xls",
  #   "SMB_Factor.xls",
  #   "HML_Factor.xls",
  #   "WML_Factor.xls",
  #   "IML_Factor.xls",
  #   "Risk_Free.xls"
  # )
  #
  # tbl <- purrr::map2(.x = urls,
  #                    .y = destfile,
  #                    .f = ~ {
  #                      curl::curl_download(url = .x, destfile = .y)
  #                      readxl::read_excel(.y)
  #                    })
  #
  # tbl |>
  #   purrr::reduce(dplyr::left_join, by = c("year", "month", "day")) |>
  #   dplyr::rename_with(tolower) |>
  #   dplyr::mutate(date = lubridate::ymd(paste0(.data$year, "/", .data$month, "/", .data$day))) |>
  #   dplyr::select(.data$date, dplyr::everything()) |>
  #   dplyr::select(-.data$year, -.data$month, -.data$day)

}




