\docType{package}
\name{RDiseaseXpress}
\alias{RDiseaseXpress}
\title{RDiseaseXpress: R package to query DiseaseXpress web API}
\description{
Accesses web-api and Returns data from the DiseaseExpress database. This package will allow you to pull RNA-Seq gene expression data for three normalization types (RSEM FPKM, RSEM TPM and Kallisto TPM) by Ensembl Gene ID (Gencode), Transcript ID or HUGO gene symbol. The main functions useful functions of this package are shown below
}
\details{
These are various available functions:

  \code{\link{returnBaseEndPoint}}: Returns Base URL
  \cr
  \cr
  \code{\link{getStudies}}: Returns available studies.
  \cr
  \cr
  \code{\link{getSamples}}: Returns available sample metadata.
  \cr
  \cr
  \code{\link{getEnsemblGeneIDs}}: Returns available Gencode gene identifiers.
  \cr
  \cr
  \code{\link{getGeneSymbols}}: Returns available HUGO gene symbols.
  \cr
  \cr
  \code{\link{getTranscripts}}: Returns available Gencode transcript identifiers.
  \cr
  \cr
  \code{\link{getEnsemblGeneIDsInfo}}: Returns feature info by Ensembl gene id (Gencode).
  \cr
  \cr
  \code{\link{getGeneSymbolsInfo}}: Returns feature info by hugo gene symbol.
  \cr
  \cr
  \code{\link{getTranscriptInfo}}: Returns feature info by Ensembl transcript id (Gencode).
  \cr
  \cr
  \code{\link{getGeneDataFromEnsemblGeneID}}: Returns expression data by Ensembl gene id (Gencode).
  \cr
  \cr
  \code{\link{getGeneDataFromGeneSymbol}}: Returns expression data by HUGO gene symbols.
  \cr
  \cr
  \code{\link{getDataFromTranscript}}: Returns expression data by Ensembl transcript id (Gencode).
  \cr
  \cr
  \code{\link{getDataAnnotationByEnsemblGeneID}}: Pull expression data by Ensembl Gene ID with sample annotation.
  \cr
  \cr
  \code{\link{getDataAnnotationByGeneSymbol}}: Pull expression data by Hugo gene symbol with sample annotation.
  \cr
  \cr
  \code{\link{getDataAnnotationByTranscript}}: Pull expression data by Ensembl Transcript ID with sample annotation.
}

