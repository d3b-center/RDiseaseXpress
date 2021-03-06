% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RDE_Main.R
\name{getDataAnnotationByTranscript}
\alias{getDataAnnotationByTranscript}
\title{Get expression data by ensembl transcript id}
\usage{
getDataAnnotationByTranscript(
  myTranscripts = NULL,
  printURL = FALSE,
  printTime = FALSE,
  myStudy = NULL,
  myNorms = NULL
)
}
\arguments{
\item{myTranscripts}{character vector of ensembl transcript id to query. Use \code{\link{getTranscripts}} to get all available transcript ids.}

\item{printURL}{logical to print URL}

\item{printTime}{logical to print time taken}

\item{myStudy}{character vector of studies to query. If NULL, returns data for all studies. Use \code{\link{getStudies}} to get all available studies.}

\item{myNorms}{character vector of normalizations to query. If NULL, returns data for all normalizations. Current normalizations include 'rsem' (gene level), 'sample_abundance'(transcript level), and 'sample_rsem_isoform'(transcript level).}
}
\value{
dataframe of sample and expression data corresponding to the query.
}
\description{
Get expression data by ensembl transcript id (Gencode ID)
}
\examples{
getDataAnnotationByTranscript(myTranscripts = c("ENST00000488147.1","ENST00000425880.1"),
  printURL = TRUE, printTime = TRUE, myStudy = c("TARGET", "TCGA"),
  myNorms = NULL)
getDataAnnotationByTranscript(myTranscripts = c("ENST00000488147.1","ENST00000425880.1"),
  printURL = TRUE, printTime = TRUE, myStudy = "GTEx",
  myNorms = c("rsem", "sample_rsem_isoform"))
getDataAnnotationByTranscript(myTranscripts = c("ENST00000488147.1","ENST00000425880.1"),
  printURL = TRUE, printTime = TRUE, myStudy = NULL,
  myNorms = NULL)

}
