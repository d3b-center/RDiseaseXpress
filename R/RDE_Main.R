#' Get expression data by ensembl gene id
#'
#' Get expression data by ensembl gene id (Gencode ID)
#'
#' @param myEnsemblGeneIDs character vector of ensembl gene id to query. Use \code{\link{getEnsemblGeneIDs}} to get all available ensembl gene ids.
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#' @param myStudy character vector of studies to query. If NULL, returns data for all studies. Use \code{\link{getStudies}} to get all available studies.
#' @param myNorms character vector of normalizations to query. If NULL, returns data for all normalizations. Current normalizations include 'rsem' (gene level), 'sample_abundance'(transcript level), and 'sample_rsem_isoform'(transcript level).
#'
#' @return dataframe of sample and expression data corresponding to the query.
#'
#' @examples
#' getDataAnnotationByEnsemblGeneID(myEnsemblGeneIDs = c("ENSG00000002079.12", "ENSG00000134323.11"),
#'   printURL = TRUE, printTime = TRUE, myStudy = c("TARGET", "TCGA"),
#'   myNorms = NULL)
#' getDataAnnotationByEnsemblGeneID(myEnsemblGeneIDs = c("ENSG00000002079.12", "ENSG00000134323.11"),
#'   printURL = TRUE, printTime = TRUE, myStudy = "GTEx",
#'   myNorms = c("rsem", "sample_rsem_isoform"))
#' getDataAnnotationByEnsemblGeneID(myEnsemblGeneIDs = c("ENSG00000002079.12", "ENSG00000134323.11"),
#'   printURL = TRUE, printTime = TRUE, myStudy = NULL,
#'   myNorms = NULL)
#'
#' @export
getDataAnnotationByEnsemblGeneID <- function(myEnsemblGeneIDs = NULL, printURL = FALSE, printTime = FALSE, myStudy = NULL, myNorms = NULL) {
  geneData <- getGeneDataFromEnsemblGeneID(myEnsemblGeneIDs = myEnsemblGeneIDs, printURL = printURL, printTime = printTime, myStudy = myStudy, myNorms = myNorms)
  sampleData <- getSamples()
  geneInfo <- getEnsemblGeneIDsInfo(myEnsemblGeneIDs)
  mergeData <- merge(geneData, sampleData, by = "data.sample_id", by.y = "sample_id")
  mergeData <- merge(mergeData, geneInfo, by.x = c("gene_id","gene_symbol","data.transcripts.transcript_id"), by.y = c("gene_id","gene_symbol","transcripts.transcript_id"))
  return(mergeData)
}

#' Get expression data by hugo gene symbol
#'
#' Get expression data by hugo gene symbol
#'
#' @param myGeneSymbols character vector of hugo gene symbol to query. Use \code{\link{getGeneSymbols}} to get all available gene symbols.
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#' @param myStudy character vector of studies to query. If NULL, returns data for all studies. Use \code{\link{getStudies}} to get all available studies.
#' @param myNorms character vector of normalizations to query. If NULL, returns data for all normalizations. Current normalizations include 'rsem' (gene level), 'sample_abundance'(transcript level), and 'sample_rsem_isoform'(transcript level).
#'
#' @return dataframe of sample and expression data corresponding to the query.
#'
#' @examples
#' getDataAnnotationByGeneSymbol(myGeneSymbols = c("MYCN","MYC"),
#'   printURL = TRUE, printTime = TRUE, myStudy = c("TARGET", "TCGA"),
#'   myNorms = NULL)
#' getDataAnnotationByGeneSymbol(myGeneSymbols = c("MYCN","MYC"),
#'   printURL = TRUE, printTime = TRUE, myStudy = "GTEx",
#'   myNorms = c("rsem", "sample_rsem_isoform"))
#' getDataAnnotationByGeneSymbol(myGeneSymbols = c("MYCN","MYC"),
#'   printURL = TRUE, printTime = TRUE, myStudy = NULL,
#'   myNorms = NULL)
#'
#' @export
getDataAnnotationByGeneSymbol <- function(myGeneSymbols = NULL, printURL = FALSE, printTime = FALSE, myStudy = NULL, myNorms = NULL) {
  geneData <- getGeneDataFromGeneSymbol(myGeneSymbols = myGeneSymbols, printURL = printURL, printTime = printTime, myStudy = myStudy, myNorms = myNorms)
  sampleData <- getSamples()
  geneInfo <- getGeneSymbolsInfo(myGeneSymbols)
  mergeData <- merge(geneData, sampleData, by.x = "data.sample_id", by.y = "sample_id")
  mergeData <- merge(mergeData, geneInfo, by.x = c("gene_id","gene_symbol","data.transcripts.transcript_id"), by.y = c("gene_id","gene_symbol","transcripts.transcript_id"))
  return(mergeData)
}

#' Get expression data by ensembl transcript id
#'
#' Get expression data by ensembl transcript id (Gencode ID)
#'
#' @param myTranscripts character vector of ensembl transcript id to query. Use \code{\link{getTranscripts}} to get all available transcript ids.
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#' @param myStudy character vector of studies to query. If NULL, returns data for all studies. Use \code{\link{getStudies}} to get all available studies.
#' @param myNorms character vector of normalizations to query. If NULL, returns data for all normalizations. Current normalizations include 'rsem' (gene level), 'sample_abundance'(transcript level), and 'sample_rsem_isoform'(transcript level).
#'
#' @return dataframe of sample and expression data corresponding to the query.
#'
#' @examples
#' getDataAnnotationByTranscript(myTranscripts = c("ENST00000488147.1","ENST00000425880.1"),
#'   printURL = TRUE, printTime = TRUE, myStudy = c("TARGET", "TCGA"),
#'   myNorms = NULL)
#' getDataAnnotationByTranscript(myTranscripts = c("ENST00000488147.1","ENST00000425880.1"),
#'   printURL = TRUE, printTime = TRUE, myStudy = "GTEx",
#'   myNorms = c("rsem", "sample_rsem_isoform"))
#' getDataAnnotationByTranscript(myTranscripts = c("ENST00000488147.1","ENST00000425880.1"),
#'   printURL = TRUE, printTime = TRUE, myStudy = NULL,
#'   myNorms = NULL)
#'
#' @export
getDataAnnotationByTranscript <- function(myTranscripts = NULL, printURL = FALSE, printTime = FALSE, myStudy = NULL, myNorms = NULL) {
  transcriptData <- getDataFromTranscript(myTranscripts = myTranscripts, printURL = printURL, printTime = printTime, myStudy = myStudy, myNorms = myNorms)
  sampleData <- getSamples()
  transcriptInfo <- getTranscriptInfo(myTranscripts)
  mergeData <- merge(transcriptData, sampleData, by.x = "data.sample_id", by.y = "sample_id")
  mergeData <- merge(mergeData, transcriptInfo, by = c("gene_id","gene_symbol","data.transcripts.transcript_id"), by.y = c("gene_id","gene_symbol","transcript_id"))
  return(mergeData)
}
