## ----setup, include=FALSE-----------------------------------------------------

knitr::opts_chunk$set(
  echo = TRUE,
  message = FALSE,
  warning = FALSE,
  cache = FALSE
)


## ----cars---------------------------------------------------------------------
library(correspondenceTables)

## ----echo=FALSE, results="asis"-----------------------------------------------
cat("
<style>
table {
  width: 100% !important;
}
table caption {
  text-align: center;
}
</style>
")

## -----------------------------------------------------------------------------
AB_path <- system.file("extdata/test", "ab_data.csv", package = "correspondenceTables")
A_path  <- system.file("extdata/test", "a_data.csv",  package = "correspondenceTables")
B_path  <- system.file("extdata/test", "b_data.csv",  package = "correspondenceTables")

stopifnot(nzchar(AB_path), nzchar(A_path), nzchar(B_path))

AB <- utils::read.csv(AB_path, stringsAsFactors = FALSE)
A  <- utils::read.csv(A_path,  stringsAsFactors = FALSE)
B  <- utils::read.csv(B_path,  stringsAsFactors = FALSE)

#For clarity and consistency, the correspondence table columns are renamed to the expected identifiers:

names(AB)[names(AB) == "NACE.Rev..2.Code"]   <- "from_code"
names(AB)[names(AB) == "NACE.Rev..2.1.Code"] <- "to_code"


res <- aggregateCorrespondenceTable(AB = AB, A = A, B = B)


knitr::kable(
  head(res$result),
  caption = "Aggregation using a correspondence table",
  align = "c"
)


## -----------------------------------------------------------------------------

# Correspondence table with weights  
AB <- data.frame(
  from_code = c("A1", "A1", "A2"),
  to_code   = c("B1", "B2", "B2"),
  weight    = c(0.7, 0.3, 1.0)
)

# Source classification with values  
A <- data.frame(
  code  = c("A1", "A2"), 
  value = c(100, 50)
)

# Target classification domain
B <- data.frame(
  code = c("B1", "B2")
)

res2 <- aggregateCorrespondenceTable(AB = AB, A = A, B = B)

knitr::kable(
  head(res2$result),
  caption = "Weighted correspondence (proportional allocation)",
  align = "c"
)


