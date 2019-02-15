## extend colData to work with eSet classes
methods::setMethod("colData", signature("eSet"), function(x, ...) Biobase::pData(x, ...))

methods::setReplaceMethod("colData", signature("eSet", "DataFrame"), function(x, ..., value) {
  Biobase::pData(x) <- as.data.frame(value)
  x
})
