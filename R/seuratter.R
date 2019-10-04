#' Calculate the optimum dimensionality from an elbow plot.
#'
#' A function that calculates the optimum dimensionality from an elbow plot. Involves calculating
#' slopes of the lines that begin from each point to the last point. The optimum dimensionality will
#' be determined as the point at which slopes no longer change or no visible change occurs to the slopes
#' thereafter.
#'
#' @param plot An elbow plot used for detemining dimensionality.
#'
#' @return This function returns an integer that represents the number of dimensionality calculated.
#'
#' @export
determine_dimensionality <- function(plot) {
  return(0)
}
