context("seuratter")

library(Seurat)
library(dplyr)
library(utils)
library(igraph)
library(graphics)
matrix <- compare_cluster_genes(PBMC)

test_that("Proper dimensionality is returned by determine_dimensionality", {
  plot <- ElbowPlot(elbow_plot_data)
  expect_lt(determine_dimensionality(plot$data), tail(plot$data$dims, 1))
  expect_gt(determine_dimensionality(plot$data), head(plot$data$dims, 1))
})


test_that("Values in cells at (x, x) should contain NA values in compare_cluster_genes()", {
  for (i in 1:length(rownames(matrix))) {
    expect_true(is.na(matrix[i, i][[1]]))
  }
})

test_that("Values in cells at (x, y), where x != y should be vectors of characters in compare_cluster_genes()", {
  matrix <- compare_cluster_genes(PBMC)
  for (i in 1:length(rownames(matrix))) {
    for (j in 1:length(rownames(matrix))) {
      if (i != j) {
        expect_type(matrix[i, j][[1]], "character")
      }
    }
  }
})

test_that("Vertex names and edge weights should be positive integers in draw_cluster_gene_relations()", {
  g <- draw_cluster_gene_relations(matrix)
  expect_type(V(g), "integer")
  expect_type(E(g), "integer")
  expect_true(all(V(g) > 0))
  expect_true(all(E(g) > 0))
})

