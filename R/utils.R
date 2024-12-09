pkg_resource <- function(...) {
  system.file("resources", ..., package = "iomdown", mustWork = TRUE)
}
