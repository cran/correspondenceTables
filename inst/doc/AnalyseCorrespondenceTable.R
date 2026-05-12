## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## -----------------------------------------------------------------------------
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
# Load example correspondence table
AB <- read.csv(
  system.file("extdata/test", "ExempleAnnexe.csv", package = "correspondenceTables"),
  stringsAsFactors = FALSE
)


## -----------------------------------------------------------------------------
# Perform analysis
result <- analyseCorrespondenceTable(
  AB = AB,
  A  = NULL,
  B  = NULL,
  longestAcodeOnly = FALSE,
  longestBcodeOnly = FALSE
)

## -----------------------------------------------------------------------------
# Display results

knitr::kable(
  head(result$Inventory),
  caption = "Inventory results: Basic analysis of a correspondence table",
  align = "c"
)


knitr::kable(
  head(result$Analysis),
  caption = "Analysis results: Basic analysis of a correspondence table",
  align = "c"
)


## -----------------------------------------------------------------------------
# Load correspondence table (NACE Rev.2 -> NACE Rev.2.1)
AB <- read.csv(
  system.file("extdata/test", "ab_data.csv", package = "correspondenceTables"),
  stringsAsFactors = FALSE
)

# Load source classification (NACE Rev.2)
A <- read.csv(
  system.file("extdata/test", "a_data.csv", package = "correspondenceTables"),
  stringsAsFactors = FALSE
)

# Load target classification (NACE Rev.2.1)
B <- read.csv(
  system.file("extdata/test", "b_data.csv", package = "correspondenceTables"),
  stringsAsFactors = FALSE
)


## ----warning = FALSE----------------------------------------------------------
# Perform analysis using all function parameters
result2 <- analyseCorrespondenceTable(
  AB = AB,
  A  = A,
  B  = B,
  longestAcodeOnly = TRUE,
  longestBcodeOnly = TRUE
)


## -----------------------------------------------------------------------------
# Display results

knitr::kable(
  head(result2$Inventory),
  caption = "Inventory results: Full analysis with source and target classifications",
  align = "c"
) 


knitr::kable(
  head(result2$Analysis[, 1:5]),
  caption = "Analysis results: Full analysis with source and target classifications",
  align = "c"
)



