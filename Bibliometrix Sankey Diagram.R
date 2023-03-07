# Name:         Bibliometrix Sankey Diagram
# Version:      1.3.0
# Author:       Arash Yoosefdoost
# Description:  A Bibliometric analysis tool to enerate Sankey Diagrams using Bibliometrix library to visualize how the main items of a bibliometry file (e.g., BibTex) (authors, keywords, journals, etc.) are related.    
# Requirements: R, R Studio (Optional), Libraries: bibliometrix, rstudioapi
#
# Supported Sources:
#               Web of Science            : bibtex (.bib), plaintext (.txt), Endnote Desktop (.ciw’)
#               SCOPUS                    : bibtex (.bib)
#               Lens.org                  : CSV (.csv)
#               Digital Science Dimensions: CSV (.csv), Excel (.xlsx)
#               Other                     : Class pubmedR (package pubmedR), class dimensionsR (package dimensionsR)

# Inputs
## File address and details
Bib_File <- "BibTex.bib"                  # Replace it with your file name
Source <- "wos"                           # Supported Sources: isi, wos, scopus, dimensions, pubmed
Format <- "bibtex"                        # Supported Formats: bibtex, endnote, csv, excel, plaintext, api

## Sankey diagram 
Sankey_Diagram_Items <- c("CR","DE","ID")
Sankey_Diagram_Number_of_Items <- c(20,20,20)

# Set working directory to active document directory in RStudio
library(rstudioapi)
setwd(dirname(getActiveDocumentContext()$path))

# Load the Bibliometrix package
library(bibliometrix)

# Read in the BibTex file downloaded from Web of Science
Bib_Data <- convert2df(Bib_File, dbsource = Source , format = Format)

# Create the Sankey diagram
threeFieldsPlot(Bib_Data, fields=Sankey_Diagram_Items, n=Sankey_Diagram_Number_of_Items)