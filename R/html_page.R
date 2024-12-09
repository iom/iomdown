#' Convert to IOM branded HTML website
#'
#' Format for converting from R Markdown to an IOM branded HTML website
#'
#' @importFrom iomdesign use_iom_bslib
#' @rdname html_page
#'
#' @param ... extra parameters to pass to `rmarkdown::html_document`
#'
#' @export
html_page <- function(...) {
  iom_theme <- iomdesign::use_iom_bslib()
  rmarkdown::html_document(
    theme = iom_theme,
    ...)
}
