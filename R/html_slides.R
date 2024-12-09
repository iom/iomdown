#' Convert to IOM branded HTML presentation
#'
#' Format for converting from R Markdown to an IOM branded HTML presentation
#'
#' @rdname html_slides
#'
#' @importFrom xaringan moon_reader
#' @importFrom iomdesign use_iom_logo
#'
#' @param other_css Add extra css
#' @param ... extra parameters to pass to `xaringan::moon_reader`
#'
#' @export
html_slides <- function(other_css = NULL,
                        ...) {
  # Xaringan resources
  xaringan_resource = function(...) system.file(
    'rmarkdown', 'templates', 'xaringan', 'resources', ..., package = 'xaringan',
    mustWork = TRUE
  )

  xaringan_css <- xaringan_resource("default.css")


  # base css files
  base_css <- iomdesign::use_iom_css(c("color_variables", "fonts"))

  # logos css file
  iomlogos <- list(
    logoblue = iomdesign::use_iom_logo(logo = "blue", data_uri = TRUE),
    logowhite = iomdesign::use_iom_logo(logo = "white", data_uri = TRUE)
  )
  logo_var <- paste0("  --iom-", names(iomlogos), ": url(\"", unname(unlist(iomlogos)), "\");")
  logo_css <- tempfile(fileext = ".css")
  writeLines(c(":root {", logo_var, "}"), con = logo_css)

  file.append(base_css, logo_css)

  # icon css files
  icon_css <- pkg_resource("css/fontawesome_all.css")

  # specific css file
  html_slides_css <- pkg_resource("css/html_slides.css")

  # html footer
  footer_html <- pkg_resource("html/footer_html_slides.html")

  xaringan::moon_reader(
    css = c(base_css, logo_css, icon_css, xaringan_css, html_slides_css, other_css),
    includes = list(after_body = footer_html),
    ...
  )
}
