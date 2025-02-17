################################################################################
# global.R
# This R Script declares the required packages for loading the Shiny App, links 
# other R Scripts with global objects and defines global variables and functions.
################################################################################

### Declaration of required packages for running the Shiny App smoothly --------
#install.packages(c("conflicted",
#                  "fmsb",
#                  "shinyWidgets" ),repos="https://rspm.pfizer.com/cran/2020-12-07",lib = .libPaths()[2])

library(shiny) # version: 1.4.0
library(shinyjs) # version: 1.1
library(data.table) # version: 1.12.8
library(DT) # version: 0.12
library(haven)
library(tools)
library(cowplot)
library(ggplot2) # version: 3.2.1
library(plotly) # version: 4.9.1
library(scales) # version: 1.1.0
library(shinycssloaders) # version: 0.3
library(tidyverse)
library(shinyWidgets)
library(cowplot)
library(epitools)
library(htmltools)
library(officer)
library(ggstance)
select <- dplyr::select; rename <- dplyr::rename; mutate <- dplyr::mutate; summarize <- dplyr::summarize; arrange <- dplyr::arrange; slice <- dplyr::slice; filter <- dplyr::filter; recode<-dplyr::recode
style <- plotly::style


### Source any R Scripts other than ui.R, server.R and global.R ----------------
source("data_processing.R")
source("volcano_plot.R")
source("GetStatistics.R")
source("RiskDiff.R")
source("title_ftnote.R")
source("ForestPlot.R")
source("edish_plot.R")
### Definitions of global variables and functions ------------------------------
# Check that it doesn't match any non-number
numbers_only <- function(x) !grepl("\\D", x)

reverselog_trans <- function(base = exp(1)) {
  trans <- function(x) -log(x, base)
  inv <- function(x) base^(-x)
  trans_new(paste0("reverselog-", format(base)), trans, inv, 
            log_breaks(base = base), 
            domain = c(1e-100, Inf))
}

