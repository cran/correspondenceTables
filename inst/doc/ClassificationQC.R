## ----include=FALSE------------------------------------------------------------

knitr::opts_chunk$set(
  collapse = TRUE,
  comment  = "#>",
  warning  = FALSE,
  message  = FALSE
)


## -----------------------------------------------------------------------------
library(correspondenceTables) 

## ----echo=FALSE, results="asis"-----------------------------------------------
cat("<style>table {  width: 100% !important;}table caption {  text-align: center;}
</style>")

## -----------------------------------------------------------------------------
lengths_example <- data.frame(
  charb = c(1, 3, 5),
  chare = c(2, 4, 7)
)

knitr::kable(
  lengths_example,
  caption = "Example of expected code lengths by hierarchical level",
  align = "c"
)


## -----------------------------------------------------------------------------
singleChildCode <- read.csv(
  system.file("extdata/test", "SingleChild.csv",
              package = "correspondenceTables")
)

knitr::kable(
  singleChildCode,
  caption = "Single-child code rules",
  align = "c"
)

## -----------------------------------------------------------------------------

sequencing <- read.csv(
  system.file("extdata/test", "Sequencing.csv",
              package = "correspondenceTables")
)

knitr::kable(
  sequencing,
  caption = "Example of sequencing rules by hierarchical level",
  align = "c"
)


## -----------------------------------------------------------------------------
classification <- read.csv(
  system.file("extdata/test", "Nace2_long.csv", package = "correspondenceTables")
)

lengths <- data.frame(
  charb = c(1, 2, 3, 5),
  chare = c(1, 2, 4, 5)
)


## -----------------------------------------------------------------------------
output <- classificationQC(
  classification   = classification,
  lengths          = lengths,
  fullHierarchy    = TRUE,
  labelUniqueness  = TRUE,
  labelHierarchy   = TRUE,
  singleChildCode  = NULL,
  sequencing       = NULL
)

qc_summary <- data.frame(
  Check            = c("No levels", "Orphan codes", "Childless codes"),
  Number_of_issues = c(
    nrow(output$QC_noLevels),
    nrow(output$QC_orphan),
    nrow(output$QC_childless)
  )
)

knitr::kable(
  qc_summary,
  caption = "Summary of quality control checks",
  align = "c"
)


## ----echo=FALSE, results="asis"-----------------------------------------------

tbl <- output$QC_noLevels

cat(sprintf(
  "**QC_noLevels**\n\n- Rows: %d  \n- Columns: %d\n\n",
  nrow(tbl), 
  ncol(tbl)
))


## ----echo=FALSE, results="asis"-----------------------------------------------

tbl2 <- output$QC_orphan

cat(sprintf(
  "**QC_orphan**\n\n- Rows: %d  \n- Columns: %d\n\n",
  nrow(tbl2), 
  ncol(tbl2) 
))

knitr::kable(
  head(tbl2[, 1:8], 5),
  caption = "Orphan codes (First 5 rows (first 7 columns))",
  align = "c"
)

## ----echo=FALSE, results="asis"-----------------------------------------------
tbl3 <- output$QC_childless

cat(sprintf(
  "**QC_childless**\n\n- Rows: %d  \n- Columns: %d\n\n",
 nrow(tbl3), 
 ncol(tbl3)
))

knitr::kable(
  head(tbl3[, 1:8], 5),
  caption = "First 5 rows (first 7 columns)",
  align = "c"
)


## -----------------------------------------------------------------------------

singleChildCode <- read.csv(
  system.file("extdata/test", "SingleChild.csv", package = "correspondenceTables")
)
knitr::kable(
  singleChildCode,
  caption = "singleChildCode argument",
  align = "c"
)

output2 <- classificationQC(
  classification   = classification,
  lengths          = lengths,
  fullHierarchy    = TRUE,
  labelUniqueness  = TRUE,
  labelHierarchy   = TRUE,
  singleChildCode  = singleChildCode,
  sequencing       = NULL
)

## ----echo=FALSE, results="asis"-----------------------------------------------
tbl4 <- output2$QC_orphan

cat(sprintf(
  "**QC_orphan**\n\n- Rows: %d  \n- Columns: %d\n\n",
  nrow(tbl4), 
  ncol(tbl4)
))


knitr::kable(
  head(tbl4[, 1:8], 5),
  caption = "First 5 rows (first 7 columns)",
  align = "c"
)


## ----echo=FALSE, results="asis"-----------------------------------------------
tbl6 <- output2$QC_childless

cat(sprintf(
  "**QC_childless**\n\n- Rows: %d  \n- Columns: %d\n\n",
 nrow(tbl6), 
  ncol(tbl6) 
))


knitr::kable(
  head(tbl6[, 1:8], 10),
  caption = "First 10 rows (first 7 columns)",
  align = "c"
)



## -----------------------------------------------------------------------------

singleChildCode <- read.csv(
  system.file("extdata/test", "SingleChild2.csv", package = "correspondenceTables")
)

sequencing <- read.csv(
  system.file("extdata/test", "Sequencing.csv",
              package = "correspondenceTables")
)

output3 <- classificationQC(
  classification   = classification, 
  lengths          = lengths,
  fullHierarchy    = TRUE,
  labelUniqueness  = TRUE,
  labelHierarchy   = TRUE,
  singleChildCode  = singleChildCode,
  sequencing       = sequencing
)



## ----echo=FALSE, results="asis"-----------------------------------------------
tbl7 <- output3$QC_gapBefore

cat(sprintf(
  "**QC_gapBefore**\n\n- Rows: %d  \n- Columns: %d\n\n",
  nrow(tbl7),
  ncol(tbl7)
))


knitr::kable(
  head(tbl7[, 1:8], 10),
  caption = "QC_gapBefore. First 10 rows (first 7 columns)",
  align = "c"
)



## ----echo=FALSE, results="asis"-----------------------------------------------
tbl8 <- output3$QC_lastSibling

cat(sprintf(
  "**QC_lastSibling**\n\n- Rows: %d  \n- Columns: %d\n\n",
  nrow(tbl8),
  ncol(tbl8)
))


knitr::kable(
  head(tbl8[, 1:8], 10),
  caption = "QC_lastSibling. First 10 rows (first 7 columns)",
  align = "c"
)



## ----echo=FALSE, results="asis"-----------------------------------------------
tbl9 <- output3$QC_output

cat(sprintf(
  "**QC_output**\n\n- Rows: %d  \n- Columns: %d\n\n",
  nrow(tbl9), 
  ncol(tbl9)
))


knitr::kable(
  head(tbl9[, 1:8], 10),
  caption = "First 10 rows (first 7 columns)",
  align = "c"
)



