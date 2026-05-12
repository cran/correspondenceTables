## ----echo=FALSE, results="asis"---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
cat("
<style>
h1.title {
  text-align: center;
}
</style>
")

## ----setup, include=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

knitr::opts_chunk$set(message = FALSE, warning = FALSE, fig.align = "center")
old <- getOption("useLocalDataForVignettes")
options(useLocalDataForVignettes = TRUE)
on.exit(options(useLocalDataForVignettes = old), add = TRUE)


## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
library(correspondenceTables)

## ----echo=FALSE, results="asis"---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
cat("<style>table {width: 100% !important;}table caption {text-align: center;}</style>")

## ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
list_data <- read.csv(
  system.file("extdata/test", "classificationList_CELLAR.csv",
              package = "correspondenceTables"),
  stringsAsFactors = FALSE
)

knitr::kable(
  head(list_data, 3),
  caption = "Example output of classificationList() (retrieved from CELLAR)"
)


## ----eval = FALSE-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 
# ds_cn <- dataStructure(
#   endpoint      = "CELLAR",
#   prefix        = "cn2022",
#   conceptScheme = "cn2022",
#   language      = "en",
#   return        = "summary"
# )
# 
# knitr::kable(head(ds_cn, 20), caption = "CN 2022 — dataStructure(summary)")
# 

## ----eval = FALSE-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 
# ds_cn_det <- dataStructure(
#   endpoint      = "CELLAR",
#   prefix        = "cn2022",
#   conceptScheme = "cn2022",
#   language      = "en",
#   return        = "details"
# )
# 
# knitr::kable(head(ds_cn_det, 20), caption = "CN 2022 — dataStructure(details)")
# 

## ----eval = FALSE-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 
# 
# 
# ds_cn_both <- dataStructure(
#   endpoint      = "CELLAR",
#   prefix        = "cn2022",
#   conceptScheme = "cn2022",
#   language      = "en",
#   return        = "both"
# )
# 
# knitr::kable(head(ds_cn_both$summary, 20), caption = "CN 2022 — summary (from both)")
# knitr::kable(head(ds_cn_both$details, 20), caption = "CN 2022 — details (from both)")

## ----eval = FALSE-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# endpoint <- "FAO"
# prefix <- "CPC21"
# conceptScheme <- "CPC21"
# 
# ds_cpc <- dataStructure(
#   endpoint      = endpoint,
#   prefix        = prefix,
#   conceptScheme = conceptScheme,
#   language      = "en",
#   showQuery     = FALSE,
#   return        = "summary"
# )
# 
# knitr::kable(
#   head(ds_cpc, 20),
#   caption = "CPC 2.1 — dataStructure(summary, FAO)"
# )

## ----retrieve-nace-multilang, eval=FALSE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# endpoint <- "CELLAR"
# prefix <- "nace2"
# conceptScheme <- "nace2"
# level <- "4"
# 
# languages <- c("de", "fr", "bg")
# 
# results <- lapply(languages, function(lang) {
#   retrieveClassificationTable(
#     endpoint = endpoint,
#     prefix = prefix,
#     conceptScheme = conceptScheme,
#     language = lang,
#     level = level,
#     showQuery = FALSE
#   )
# })

## ----eval=FALSE-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 
# cl_fao <- classificationList("FAO")
# 
# knitr::kable(
#   head(cl_fao),
#   caption = "Retrieving a classification table from the FAO endpoint"
# )

## ----eval=FALSE-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# knitr::kable(
#   head(unique(cl_fao$Prefix)))

## ----eval=FALSE-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# knitr::kable(
#   head(unique(cl_fao$ConceptScheme)))

## ----retrieve-fao-classification, eval=FALSE--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# endpoint <- "FAO"
# prefix <- "cpc21"
# conceptScheme <- "core"
# 
# out <- retrieveClassificationTable(
#   endpoint      = endpoint,
#   prefix        = prefix,
#   conceptScheme = conceptScheme,
#   language      = "en",
#   level         = "2",
#   showQuery     = TRUE
# )

## ----eval=FALSE-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# cl_fao <- classificationList("FAO")
# endpoint <- "FAO"
# prefix <- "cpc21"
# conceptScheme <- "core"
# 
# out <- retrieveClassificationTable(
#   endpoint      = endpoint,
#   prefix        = prefix,
#   conceptScheme = conceptScheme,
#   knownSchemes  = cl_fao
# )

## ----eval = FALSE-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 
# corr_list = correspondenceTableList("ALL")
# 
# names(corr_list)
# #Correspondence tables available from CELLAR
# knitr::kable(
#   head(corr_list$CELLAR, 10),
#   caption = "Available correspondence tables from the CELLAR endpoint (preview)"
# )
# #Correspondence tables available from FAO
# knitr::kable(
#   head(corr_list$FAO, 10),
#   caption = "Available correspondence tables from the FAO endpoint (preview)"
# )

## ----corr-table-list, eval=FALSE--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# # Inspect correspondence tables available from CELLAR
# tbl_cellar <- correspondenceTableList("CELLAR")
# 
# #Correspondence tables available from CELLAR
# knitr::kable(
#   head(tbl_cellar, 10),
#   caption = "Available correspondence tables from the CELLAR endpoint "
# )

## ----retrieve-prodcom, eval=FALSE-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# res <- retrieveCorrespondenceTable(
#   endpoint  = "CELLAR",
#   prefix    = "prodcom2023",
#   ID_table  = "PRODCOM2023_CPA21",
#   language  = "en",
#   showQuery = FALSE
# )
# knitr::kable(
#   head(res, 10),
#   caption = "PRODCOM2023_CPA21 CorrespondenceTable from the CELLAR endpoint "
# )

## ----eval = FALSE-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# res2 <- retrieveCorrespondenceTable(
#   endpoint = "CELLAR",
#   prefix   = "nace2",
#   ID_table = "NACE2_CPA21",
#   language = "en"
# )
# knitr::kable(
#   head(res2, 10),
#   caption = "NACE2_CPA21 CorrespondenceTable from the CELLAR endpoint "
# )

## ----eval = FALSE-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# # Inspect correspondence tables available from FAO
# tbl_fao <- correspondenceTableList("FAO")
# head(tbl_fao)
# 
# knitr::kable(
#   head(tbl_fao, 10),
#   caption = "correspondence tables available from FAO"
# )
# 

## ----retrieve-cpc21-isic4_FAO , eval = FALSE--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Res <- retrieveCorrespondenceTable(
#   endpoint = "FAO",
#   prefix   = "CPC21",
#   ID_table = "CPC21-ISIC4",
#   language = "en"
# )
# 
# knitr::kable(
#   head(Res[, 1:5], 10),
#   caption = "CPC21–ISIC4 correspondence tables available from FAO"
# )

## ----eval = FALSE-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Res2 <- retrieveCorrespondenceTable(
#   endpoint = "FAO",
#   prefix   = "CPC21",
#   ID_table = "CPC21-ISIC4",
#   language = "en",
#   showQuery = TRUE
# )
# 
# # Extract the SPARQL query used
# SPARQLquery <- Res2$SPARQL.query
# SPARQLquery

