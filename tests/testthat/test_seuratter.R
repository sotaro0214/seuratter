context("seuratter")

library(Seurat)
library(dplyr)
library(utils)
library(igraph)
library(graphics)


test_that("Proper dimensionality is returned by determine_dimensionality", {
  plot <- ElbowPlot(PBMC)
  expect_lt(determine_dimensionality(plot$data), tail(plot$data$dims, 1))
  expect_gt(determine_dimensionality(plot$data), head(plot$data$dims, 1))
})

test_that("Smaller/Larger min_percent should yield same or more/less(respectively) genes in extract_genes_expressed()", {
  expect_gte(length(extract_genes_expressed(PBMC, 1, 0.25)), length(extract_genes_expressed(PBMC, 1, 0.5)))
  expect_lte(length(extract_genes_expressed(PBMC, 1, 0.25)), length(extract_genes_expressed(PBMC, 1, 0.1)))
})


test_that("Different cluster_num should yield different results in extract_genes_expressed()", {
  expect_false(isTRUE(all.equal(extract_genes_expressed(PBMC, 1, 0.25), extract_genes_expressed(PBMC, 2, 0.25))))
})

test_that("Values in cells at (x, x) should contain NA values in compare_cluster_genes()", {
  matrix <- compare_cluster_genes(PBMC)
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
  matrix <- compare_cluster_genes(PBMC)
  g <- draw_cluster_gene_relations(matrix)
  expect_type(V(g), "integer")
  expect_type(E(g), "integer")
  expect_true(all(V(g) > 0))
  expect_true(all(E(g) > 0))
})

