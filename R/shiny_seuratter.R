#' Run the shiny app for seuratter
#'
#' Run the shiny app for seuratter, displaying all the plots outputted by the package with the example
#' data PBMC.
#'
#' @return No return value. Opens a shiny app page.
#' @examples
#' \dontrun{
#' run_shiny_seuratter()
#' }
#'
#' @importFrom shiny runApp
#' @export
run_shiny_seuratter <- function() {
  app_directory <- system.file("../inst/shiny-scripts",
                               package = "seuratter")
  shiny::runApp(app_directory, display.mode = "normal")
  return()
}
