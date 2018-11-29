# Tests for dplyr-style verbs on SE objects.
# library(plyexperiment); library(testthat); source("test-verbs-col.R")

set.seed(0)
y <- matrix(rnorm(2000), ncol=20)
se <- SummarizedExperiment(list(counts=y))
se$whee <- sample(LETTERS, ncol(y), replace=TRUE)
colnames(se) <- sprintf("SAMPLE_%i", seq_len(ncol(se)))

test_that("mutate_col correctly adds column variables", {
    val <- runif(ncol(y))
    se2 <- mutate_col(se, blah=val)

    expect_s4_class(se2, "SummarizedExperiment")
    expect_identical(colnames(colData(se2)), c("whee", "blah"))
    expect_identical(val, se2$blah)
    expect_identical(se$whee, se2$whee)

    # Correctly handles replacement of an existing column.
    se2 <- mutate_col(se, whee=val)
    expect_identical(colnames(colData(se2)), "whee")
    expect_identical(se2$whee, val)
})

test_that("rename_col correctly renames columns", {
    se2 <- rename_col(se, blah=whee)
    expect_s4_class(se2, "SummarizedExperiment")
    expect_identical(colnames(colData(se2)), "blah")
    expect_identical(se$whee, se2$blah)
})

test_that("filter_col correctly chooses columns", {
    se2 <- filter_col(se, whee %in% c("A", "B", "C"))
    ref <- se[,se$whee %in% c("A", "B", "C")]
    expect_equal(se2, ref)  
})

test_that("arrange_col correctly orders columns", {
    se2 <- arrange_col(se, whee)
    ref <- se[,order(se$whee)]
    expect_equal(se2, ref)  
})
