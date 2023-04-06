#' Download the Cost of Equity
#'
#' Get the cost of equity for different sectors according to the CAPM methodology.
#'
#' @return A \code{tibble}
#' @export
#'
#' @importFrom rlang .data
#'
#' @examples
#' #cost_of_equity()
cost_of_equity <- function() {

  paths <- list(
    "http://nefin.com.br/resources/cost_of_capital/Basic%20Products.xls",
    "http://nefin.com.br/resources/cost_of_capital/Construction.xls",
    "http://nefin.com.br/resources/cost_of_capital/Consumer.xls",
    "http://nefin.com.br/resources/cost_of_capital/Energy.xls",
    "http://nefin.com.br/resources/cost_of_capital/Finance.xls",
    "http://nefin.com.br/resources/cost_of_capital/Manufacturing.xls",
    "http://nefin.com.br/resources/cost_of_capital/Other.xls"
  )

  destfile <- list(
    "Basic_Products.xls",
    "Construction.xls",
    "Consumer.xls",
    "Energy.xls",
    "Finance.xls",
    "Manufacturing.xls",
    "Other.xls"
  )

  sectors <- list("Basic_Products", "Construction", "Consumer", "Energy", "Finance", "Manufacturing", "Other")

  tbl <- purrr::map2(.x = paths,
                     .y = destfile,
                     .f = ~ {
                       curl::curl_download(url = .x, destfile = .y)
                       readxl::read_excel(.y)
                     })


  tbl <- purrr::map2(
    .x = tbl,
    .y = sectors,
    .f = ~ tibble::add_column(.x, sectors = .y)
  ) |>
    purrr::list_rbind()

  tbl |>
    tidyr::pivot_longer(cols = -c(.data$`Month/Year`, .data$sectors), names_to = "horizon", values_to = "cost") |>
    dplyr::mutate(date = lubridate::my(.data$`Month/Year`)) |>
    dplyr::select(-.data$`Month/Year`) |>
    dplyr::mutate(sectors = forcats::as_factor(.data$sectors),
                  horizon = forcats::as_factor(.data$horizon)) |>
    dplyr::select(.data$date, dplyr::everything())

}

