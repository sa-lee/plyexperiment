# Tests for dplyr-style verbs on SE objects.
# library(plyexperiment); library(testthat); source("test-verbs-col.R")

context("Create Test Data")

## testing data
set.seed(0)
y <- matrix(rnorm(2000), ncol = 20)
se <- SummarizedExperiment::SummarizedExperiment(list(counts = y))
se$whee <- sample(LETTERS, ncol(y), replace = TRUE)
se$foo <- ncol(y):1
colnames(se) <- sprintf("SAMPLE_%i", seq_len(ncol(se)))
SummarizedExperiment::colData(se)$listcol <- lapply(1:20, function(x) mtcars)

suppressWarnings(eset <- as(se, "ExpressionSet"))

data(miniACC, package = "MultiAssayExperiment")
mae <- miniACC

context("SummarizedExperiment")

test_that("mutate_col correctly adds column variables", {
    val <- runif(ncol(y))
    se2 <- mutate_col(se, blah = val)

    expect_s4_class(se2, "SummarizedExperiment")
    expect_named(colData(se2), c("whee", "foo", "listcol", "blah"))
    expect_identical(val, se2$blah)
    expect_identical(se$whee, se2$whee)

    # Correctly handles replacement of an existing column.
    se2 <- mutate_col(se, whee = val)
    expect_named(colData(se2), c("whee", "foo", "listcol"))
    expect_identical(se2$whee, val)
})

test_that("rename_col correctly renames columns", {
    se2 <- rename_col(se, blah = whee)
    expect_s4_class(se2, "SummarizedExperiment")
    expect_named(colData(se2), c("blah", "foo", "listcol"))
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

test_that("select_col correctly extracts columns", {
    se2 <- select_col(se, foo, listcol)
    expect_s4_class(se2, "SummarizedExperiment")
    expect_named(colData(se2), c("foo", "listcol"))
})

context("eSet Generics")

test_that("generics are available for eSet", {
    expect_silent(colData(eset))
    expect_identical(colData(eset), Biobase::pData(eset))
    eset2 <- eset
    Biobase::pData(eset2) <- Biobase::pData(eset2)[0, ]
    expect_silent(colData(eset2) <- S4Vectors::DataFrame(pData(eset)))
    expect_identical(colData(eset2), Biobase::pData(eset2))
    expect_identical(colData(eset2), Biobase::pData(eset))
})

context("ExpressionSet")

test_that("mutate_col correctly adds column variables", {
    val <- runif(ncol(y))
    eset2 <- mutate_col(eset, blah = val)

    expect_s4_class(eset2, "ExpressionSet")
    expect_named(colData(eset2), c("whee", "foo", "listcol", "blah"))
    expect_identical(val, eset2$blah)
    expect_identical(eset$whee, eset2$whee)

    # Correctly handles replacement of an existing column.
    eset2 <- mutate_col(eset, whee = val)
    expect_named(colData(eset2), c("whee", "foo", "listcol"))
    expect_identical(eset2$whee, val)
})

test_that("rename_col correctly renames columns", {
    eset2 <- rename_col(eset, blah = whee)
    expect_s4_class(eset2, "ExpressionSet")
    expect_named(colData(eset2), c("blah", "foo", "listcol"))
    expect_identical(eset$whee, eset2$blah)
})

test_that("filter_col correctly chooesets columns", {
    eset2 <- filter_col(eset, whee %in% c("A", "B", "C"))
    ref <- eset[,eset$whee %in% c("A", "B", "C")]
    expect_equal(eset2, ref)
})

test_that("arrange_col correctly orders columns", {
    eset2 <- arrange_col(eset, whee)
    ref <- eset[,order(eset$whee)]
    expect_equal(eset2, ref)
})

test_that("select_col correctly extracts columns", {
    eset2 <- select_col(eset, foo, listcol)
    expect_s4_class(eset2, "ExpressionSet")
    expect_named(colData(eset2), c("foo", "listcol"))
})

context("MultiAssayExperiment")

library(MultiAssayExperiment)

test_that("mutate_col correctly adds column variables", {
    val <- runif(ncol(y))
    mae2 <- mutate_col(mae, blah = years_to_birth)

    expect_s4_class(mae2, "MultiAssayExperiment")
    expect_named(colData(mae2), c(names(colData(mae)), "blah"))
    expect_identical(mae$years_to_birth, mae2$blah)

    # Correctly handles replacement of an existing column.
    mae2 <- mutate_col(mae, ploidy = vital_status)
    expect_named(colData(mae2), names(colData(mae)))
    expect_identical(mae2$ploidy, mae$vital_status)
})

test_that("rename_col correctly renames columns", {
    mae2 <- rename_col(mae, blah = genome_doublings)
    expect_s4_class(mae2, "MultiAssayExperiment")
    expect_named(colData(mae2),
                 replace(names(colData(mae)), which(names(colData(mae)) == "genome_doublings"), "blah"))
    expect_identical(mae2$blah, mae$genome_doublings)
})

test_that("filter_col correctly choomaes columns", {
    mae2 <- filter_col(mae, SCNA.cluster == "Quiet")
    ref <- mae[,mae$SCNA.cluster == "Quiet"]
    expect_equal(mae2, ref)
})

test_that("arrange_col correctly orders columns", {
    mae2 <- arrange_col(mae, ploidy)
    ref <- mae[,order(mae$ploidy)]
    expect_equal(mae2, ref)
})

test_that("select_col correctly extracts columns", {
    mae2 <- select_col(mae, patientID, gender, vital_status)
    expect_s4_class(mae2, "MultiAssayExperiment")
    expect_named(colData(mae2), c("patientID", "gender", "vital_status"))
})
