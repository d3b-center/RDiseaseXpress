\name{RDiseaseXpress}
\alias{RDiseaseXpress}
\title{RDiseaseXpress Documentation}
\usage{

This package connects to the DiseaseXpress web API. There are some functions to be able to pull data by gene or transcript and choose between different normalization types. In addition there are a few functions for aggregating / analyzing the data.
}
\description{

Accesses web-api and pulls data from the DiseaseExpress database.The main functions useful functions of this package are shown below

  \code{\link{getStudies}} : Pulls all current study identifiers.
  \cr
  \cr
  \code{\link{getDataAnnotationByEnsemblGeneID}} : Pull expression data by Ensembl Gene ID with sample annotation.
  \cr
  \cr
  \code{\link{getDataAnnotationByGeneSymbol}} : Pull expression data by Hugo gene symbol with sample annotation.
  \cr
  \cr
  \code{\link{getDataAnnotationByTranscript}} : Pull expression data by Ensembl Transcript ID with sample annotation.

}