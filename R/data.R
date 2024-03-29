#' Single Cell RNA Seq Analysis Data
#'
#' A Single Cell RNAseq experiment conducted by 10X Genomics on peripheral blood mononuclear cells,
#' generated by the CellRanger pipeline.
#'
#' @source 10X Genomics, California, USA
#'
#' @format A Seurat Object (involves many different data that are relevant to the scrna seq workflow but only
#' the few depicted below are relevant to this pacakge):
#' \describe{
#'  \item{features}{The number of genes that were expressed by the cells.}
#'  \item{samples}{The number of cells involved in this experiment.}
#'  \item{seurat_clusters}{Identification of clusters for each cell.}
#'  \item{RNA}{Includes the raw and lognormalized gene expression matrices.}
#' }
"PBMC"


#' Elbow plot data from PBMC
#'
#' An elbow plot data generated from PBMC to use in determine_dimensionality().
#'
#' @source 10X Genomics, California, USA
#'
#' @format A list containing 'dims' and 'stdev' data
#' \describe{
#'  \item{dims}{Dimension number}
#'  \item{stdev}{Standard deviation calculated using number of dimensions in dims.}
#' }
"elbow_plot_data"


#' Matrix with cluster id's and genes shared by a pair of clusters.
#'
#' A matrix with cluster id's as rows and columns.Each cell contains the genes shared by the cluster pair.
#'
#' @source 10X Genomics, California, USA
#'
#' @format A matrix object
#' \describe{
#'  \item{column}{cluster ids}
#'  \item{row}{cluster ids}
#' }
"gene_comparison_matrix"
