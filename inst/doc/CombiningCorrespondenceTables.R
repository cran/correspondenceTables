## ----include=FALSE----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
options(width = 300)

## ----echo=FALSE, results="asis"---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

## ----echo = F---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
library(correspondenceTables)


## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

tmp_dir <- tempdir()

fullPath <- function(CSVraw, CSVappended){
  NamesCsv <- system.file("extdata/test", CSVraw, package = "correspondenceTables")
  A <- read.csv(NamesCsv, header = FALSE, sep = ",")
   for (i in 1:nrow(A)) {
    for (j in 1:ncol(A)) {
      if (A[i,j]!="") {
        A[i, j] <- system.file("extdata/test", A[i, j], package = "correspondenceTables")
      }}}
  write.table(x = A, file = file.path(tmp_dir,CSVappended), row.names = FALSE, col.names = FALSE, sep = ",")
  return(A)
}

## ----echo=FALSE-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

files_to_clean <- setdiff(
  list.files(tmp_dir, pattern = "\\.csv$", full.names = TRUE),
  file.path(tmp_dir, "names.csv")
)

if (length(files_to_clean) > 0) unlink(files_to_clean)

## ----results = "hide"-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
fullPath("names1.csv", "names.csv")

## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
NCT <- newCorrespondenceTable(
        Tables = file.path(tmp_dir, "names.csv"),
        Reference = "A",
        MismatchTolerance = 0.5,
        Redundancy_trim = FALSE,
        Progress = FALSE
)

knitr::kable(
  (NCT[[1]][3748:3753, 1:9]),
  caption = "ISIC Rev. 4 to CPA Ver. 2.1 (via CPC Ver. 2.1): Subsample of the new Correspondence Table",
  align = "c"
)

## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
knitr::kable(
  head(NCT[[2]]),
  caption = "ISIC Rev. 4 to CPA Ver. 2.1 (via CPC Ver. 2.1): Names of the classifications involved",
  align = "c"
)


## ----results = "hide"-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
fullPath("names4.csv", "names.csv")

## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
NCT <- newCorrespondenceTable(
        Tables = file.path(tmp_dir, "names.csv"),
        Reference = "none",
        MismatchTolerance = 0.96,
        Redundancy_trim = TRUE,
        Progress = FALSE
      )



knitr::kable(
  head(NCT[[1]][5442:5450, 1:8]),
  caption = "NACE Rev. 2 : SITC 4 (via CPA Ver. 2.1 and CN 2022): Subsample of the new Correspondence Table",
  align = "c"
)


## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
knitr::kable(
  head(NCT[[2]]),
  caption = "NACE Rev. 2 : SITC 4 (via CPA Ver. 2.1 and CN 2022): Names of the classifications involved",
  align = "c"
)

## ----message=TRUE, warning=TRUE, include=FALSE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
csv_files<-list.files(tmp_dir, pattern = ".csv")
if (length(csv_files)>0) unlink(csv_files)

## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
A <- read.csv(
  system.file("extdata/test", "CN2021.csv", package = "correspondenceTables"),
  colClasses = "character"
)

AStar <- read.csv(
  system.file("extdata/test", "CN2022.csv", package = "correspondenceTables"),
  colClasses = "character"
)

B <- read.csv(
  system.file("extdata/test", "CPA21.csv", package = "correspondenceTables"),
  colClasses = "character"
)

AB <- read.csv(
  system.file("extdata/test", "CN2021_CPA21.csv", package = "correspondenceTables"),
  colClasses = "character"
)

AAStar <- read.csv(
  system.file("extdata/test", "CN2021_CN2022.csv", package = "correspondenceTables"),
  colClasses = "character"
)


## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPC <- updateCorrespondenceTable(
  A = A,
  B = B,
  AStar = AStar,
  AB = AB,
  AAStar = AAStar,
  Reference = "B",
  MismatchToleranceB = 0.4,
  MismatchToleranceAStar = 0.4,
  Redundancy_trim = TRUE
)


knitr::kable(
  (UPC[[1]][7950:7955, 1:11]),
  caption = "Updating CN 2021 : CPA Ver. 2.1  (triggered by CN update): Subsample of the new CorrespondenceTable",
  align = "c"
)


## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
knitr::kable(
  head(UPC[[2]]),
  caption = "Updating CN 2021 : CPA Ver. 2.1  (triggered by CN update): Names of the classifications involved",
  align = "c",
  col.names = "Classification: Name"
)


## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
A <- read.csv(
  system.file("extdata/test", "NAICS2017.csv", package = "correspondenceTables"),
  colClasses = "character"
)

AStar <- read.csv(
  system.file("extdata/test", "NAICS2022.csv", package = "correspondenceTables"),
  colClasses = "character"
)

B <- read.csv(
  system.file("extdata/test", "NACE.csv", package = "correspondenceTables"),
  colClasses = "character"
)

AB <- read.csv(
  system.file("extdata/test", "NAICS2017_NACE.csv", package = "correspondenceTables"),
  colClasses = "character"
)

AAStar <- read.csv(
  system.file("extdata/test", "NAICS2017_NAICS2022.csv", package = "correspondenceTables"),
  colClasses = "character"
)


## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

UPC3 <- updateCorrespondenceTable(
  A = A,
  B = B,
  AStar = AStar,
  AB = AB,
  AAStar = AAStar,
  Reference = "none",
  MismatchToleranceB = 0.5,
  MismatchToleranceAStar = 0.8,
  Redundancy_trim = TRUE
)


knitr::kable(
  head(UPC3[[1]][1208:1218, 1:10]),
  caption = "Updating NAICS : NACE (triggered by NAICS update): Subsample of the new Correspondence Table",
  align = "c"
)


## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  knitr::kable(
  head(UPC3[[2]]),
  caption = "Updating NAICS : NACE (triggered by NAICS update): Names of the classifications involved",
  align = "c",
  col.names = "Classification: Name"
)

