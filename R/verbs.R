#' Tidy manipulation of SummarizedExperiment objects by column.
#'
#' @param object a \linkS4class{SummarizedExperiment} object.
#' @param ... Additional arguments to be passed to the relevant \pkg{dplyr} functions.
#'
#' @details
#' The \code{mutate_col} function calls \code{\link{mutate}} to add new column variables to \code{colData(object)}.
#'
#' The \code{rename_col} function calls \code{\link{rename}} to rename column variables to \code{colData(object)}.
#'
#' The \code{filter_col} function calls \code{\link{filter}} to subset \code{object} by column, based on the matching elements in rows of \code{colData(object)}.
#'
#' The \code{arrange_col} function calls \code{\link{arrange}} to order columns by the corresponding variable in \code{colData(object)}.
#'
#' @return A modified SingleCellExperiment object.
#'
#' @export
#' @importFrom dplyr mutate
#' @importFrom S4Vectors DataFrame
#' @importFrom BiocGenerics rownames<- colnames
#' @importFrom SummarizedExperiment colData colData<-
#'
#' @author Davis McCarthy, with some modifications from Aaron Lun
#' @rdname tidy_col
#' @include methods.R
#' @examples
#' y <- matrix(rnorm(2000), ncol=20)
#' se <- SummarizedExperiment(list(counts=y))
#' se$whee <- sample(LETTERS, ncol(y), replace=TRUE)
#'
#' (se2 <- mutate_col(se, yay = runif(ncol(y))))
#'
#' (se3 <- rename_col(se, blah = whee))
#'
#' (se4 <- filter_col(se, whee == "A"))
#'
#' (se5 <- arrange_col(se, whee))
mutate_col <- function(object, ...) {
    pd <- as.data.frame(colData(object))
    pd <- mutate(pd, ...)
    rownames(pd) <- rownames(colData(object))
    colData(object) <- DataFrame(pd)
    object
}

#' @export
#' @rdname tidy_col
#' @include methods.R
#' @importFrom dplyr rename
rename_col <- function(object, ...) {
    pd <- as.data.frame(colData(object))
    pd <- rename(pd, ...)
    rownames(pd) <- rownames(colData(object))
    colData(object) <- DataFrame(pd)
    object
}

#' @export
#' @rdname tidy_col
#' @importFrom dplyr filter
filter_col <- function(object, ...) {
    pd <- as.data.frame(colData(object))
    pd <- mutate(pd, placeholder_index = seq_len(nrow(pd)))
    pd <- filter(pd, ...)
    object[, pd$placeholder_index]
}

#' @export
#' @rdname tidy_col
#' @importFrom dplyr arrange
arrange_col <- function(object, ...) {
    pd <- as.data.frame(colData(object))
    pd <- mutate(pd, placeholder_index = seq_len(nrow(pd)))
    pd <- arrange(pd, ...)
    object[, pd$placeholder_index]
}

#' @export
#' @rdname tidy_col
#' @include methods.R
#' @importFrom dplyr select
select_col <- function(object, ...) {
    pd <- as.data.frame(colData(object))
    pd <- dplyr::select(pd, ...)
    rownames(pd) <- rownames(colData(object))
    colData(object) <- DataFrame(pd)
    object
}
