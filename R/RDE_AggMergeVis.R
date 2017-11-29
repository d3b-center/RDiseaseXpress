
#' Get API base URL
#'
#' Returns api base url
#'
#' @return character string representing the base url.
#'
#' @examples
#' returnBaseEndPoint()
#'
#' @export
returnBaseEndPoint <- function() {
  api <- "http://disease-express.dev.cavatica-dns.org/api/"
  return(api)
}

#' Retrieve data in TSV format
#'
#' Retrieves data in TSV format
#'
#' @param myURL character string representing URL
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#'
#' @return dataframe
#'
#' @examples
#' api <- returnBaseEndPoint()
#' retrieveDataTAB(myURL = paste0(api,"data/transcripts/ids/ENST00000488147.1/studies/TARGET/normalizations/rsem?projection=summary"))
#'
#' @export
retrieveDataTAB <- function(myURL = NULL, printURL = FALSE, printTime = FALSE) {
  if(printURL) {
    print(myURL)
  }
  startTime <- Sys.time()
  rawReturn <- GET(myURL, accept(type = "text/tab-separated-values"))
  endTime <- Sys.time()
  if(printTime) {
    print(difftime(endTime, startTime))
  }
  output <- content(rawReturn, type = "text/tab-separated-values")
  return(output)
}

#' Retrieve data as JSON object
#'
#' Retrieve data as JSON object
#'
#' @param myURL character string representing URL
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#'
#' @return json output
#'
#' @examples
#' api <- returnBaseEndPoint()
#' retrieveDataJSON(myURL = paste0(api, "data/transcripts/ids/ENST00000488147.1/studies/TARGET/normalizations/rsem?projection=summary"))
#'
#' @export
retrieveDataJSON <- function(myURL = NULL, printURL = FALSE, printTime = FALSE) {
  if(printURL) {
    print(myURL)
  }
  startTime <- Sys.time()
  rawReturn <- GET(myURL, accept_json())
  endTime <- Sys.time()
  if(printTime) {
    print(difftime(endTime, startTime))
  }
  output <- content(rawReturn)
  return(output)
}

#' Get all studies
#'
#' Get all studies
#'
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#'
#' @return string of available studies
#'
#' @examples
#' getStudies()
#'
#' @export
getStudies <- function(printURL = FALSE, printTime = FALSE) {
  api <- returnBaseEndPoint()
  myURL <- paste0(api, "studies")
  output <- retrieveDataJSON(myURL, printURL = printURL, printTime = printTime)
  output <- unlist(output)
  return(output)
}

#' Get sample metadata
#'
#' Get sample metadata
#'
#' @param myStudy character vector of one or more studies. Use \code{\link{getStudies}} to get all available studies.
#' @param allStudies TRUE by default. If one or more studies are specified, it is set to FALSE.
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#'
#' @return dataframe of sample metadata
#'
#' @examples
#' getSamples()
#' getSamples(myStudy = c("TCGA","TARGET"))
#'
#' @export
getSamples <- function(myStudy = NULL, allStudies = TRUE, printURL = FALSE, printTime = FALSE) {
  api <- returnBaseEndPoint()
  if(!is.null(myStudy)) {
    allStudies <- FALSE
  }
  if(allStudies) {
    myURL <- paste0(api, "samples")
  } else if(is.null(myStudy)){
      print("If allStudies is False you must supply one of more studies in the myStudy variable")
      stop()
  } else {
    myStudy <- paste(myStudy, collapse=",")
    myURL <- paste0(api, "samples/", myStudy)
  }

  output <- retrieveDataTAB(myURL, printURL = printURL, printTime = printTime)
  return(output)
}

#' Get available ensembl gene ids
#'
#' Get available ensembl gene ids
#'
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#'
#' @return string of available ensembl gene ids
#'
#' @examples
#' getEnsemblGeneIDs()
#'
#' @export
getEnsemblGeneIDs <- function(printURL = FALSE, printTime = FALSE) {
  api <- returnBaseEndPoint()
  myURL <- paste0(api, "genes/ids")
  output <- retrieveDataJSON(myURL, printURL = printURL, printTime = printTime)
  output <- unlist(output)
  return(output)
}

#' Get available hugo gene symbols
#'
#' Get available hugo gene symbols
#'
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#'
#' @return string of available hugo gene symbols
#'
#' @examples
#' getGeneSymbols()
#'
#' @export
getGeneSymbols <- function(printURL = FALSE, printTime = FALSE) {
  api <- returnBaseEndPoint()
  myURL <- paste0(api, "genes/symbols")
  output <- retrieveDataJSON(myURL, printURL = printURL, printTime = printTime)
  output <- unlist(output)
  return(output)
}

#' Get available ensembl transcript ids
#'
#' Get available ensembl transcript ids
#'
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#'
#' @return string of available ensembl transcript ids
#'
#' @examples
#' getTranscripts()
#'
#' @export
getTranscripts <- function(printURL = FALSE, printTime = FALSE) {
  api <- returnBaseEndPoint()
  myURL <- paste0(api, "transcripts/ids")
  output <- retrieveDataJSON(myURL, printURL = printURL, printTime = printTime)
  output <- unlist(output)
  return(output)
}

#' Get feature info by ensembl gene id
#'
#' Get feature info by ensembl gene id
#'
#' @param myEnsemblGeneIDs character vector of ensembl ids to query. Use \code{\link{getEnsemblGeneIDs}} to get all available ensembl gene ids.
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#'
#' @return dataframe of features corresponding to query ids
#'
#' @examples
#' getEnsemblGeneIDsInfo(myEnsemblGeneIDs = "ENSG00000002079.12")
#' getEnsemblGeneIDsInfo(myEnsemblGeneIDs = c("ENSG00000002079.12", "ENSG00000134323.10"))
#'
#' @export
getEnsemblGeneIDsInfo <- function(myEnsemblGeneIDs = NULL, printURL = FALSE, printTime = FALSE) {
  api <- returnBaseEndPoint()
  myEnsemblGeneIDs <- paste(myEnsemblGeneIDs, collapse = ",")
  myURL <- paste0(api, "genes/ids/", myEnsemblGeneIDs)
  output <- retrieveDataTAB(myURL, printURL = printURL, printTime = printTime)
  return(output)
}

#' Get feature info by hugo gene symbol
#'
#' Get feature info by hugo gene symbol
#'
#' @param myGeneSymbols character vector of hugo gene symbols to query. Use \code{\link{getGeneSymbols}} to get all available ensembl gene symbols.
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#'
#' @return dataframe of features corresponding to query symbols
#'
#' @examples
#' getGeneSymbolsInfo(myGeneSymbols = "MYCN")
#' getGeneSymbolsInfo(myGeneSymbols = c("MYCN", "MYC"))
#'
#' @export
getGeneSymbolsInfo <- function(myGeneSymbols = NULL, printURL = FALSE, printTime = FALSE) {
  api <- returnBaseEndPoint()
  myGeneSymbols <- paste(myGeneSymbols, collapse = ",")
  myURL <- paste0(api, "genes/symbols/", myGeneSymbols)
  output <- retrieveDataTAB(myURL, printURL = printURL, printTime = printTime)
  return(output)
}

#' Get feature info by ensembl transcript id
#'
#' Get feature info by ensembl transcript id
#'
#' @param myTranscripts character vector of ensembl transcript ids to query. Use \code{\link{getTranscripts}} to get all available ensembl transcripts ids.
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#'
#' @return dataframe of features corresponding to query ids
#'
#' @examples
#' getTranscriptInfo(myTranscripts = "ENST00000488147.1")
#' getTranscriptInfo(myTranscripts = c("ENST00000488147.1","ENST00000425880.1"))
#'
#' @export
getTranscriptInfo <- function(myTranscripts = NULL, printURL = FALSE, printTime = FALSE) {
  api <- returnBaseEndPoint()
  myTranscriptsString <- paste(myTranscripts, collapse = ",")
  myURL <- paste0(api, "transcripts/ids/", myTranscriptsString)
  output <- retrieveDataTAB(myURL, printURL = printURL, printTime = printTime)
  return(output)
}

#' Get expression data by ensembl gene id
#'
#' Get expression data by ensembl gene id
#'
#' @param myEnsemblGeneIDs character vector of ensembl gene ids to query. Use \code{\link{getEnsemblGeneIDs}} to get all available ensembl gene ids.
#' @param myProjection character string. 'summary' by default.
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#' @param myStudy character vector of studies to query. If NULL, returns data for all studies. Use \code{\link{getStudies}} to get all available studies.
#' @param myNorms character vector of normalizations to query. If NULL, returns data for all normalizations. Current normalizations include 'rsem' (gene level), 'sample_abundance'(transcript level), and 'sample_rsem_isoform'(transcript level).
#'
#' @return dataframe of expression data corresponding to query ids
#'
#' @examples
#' getGeneDataFromEnsemblGeneID(myEnsemblGeneIDs = c("ENSG00000002079.12","ENSG00000134323.10"), printURL = TRUE, printTime = TRUE, myStudy = c("TARGET", "TCGA"), myNorms = NULL)
#' getGeneDataFromEnsemblGeneID(myEnsemblGeneIDs = c("ENSG00000002079.12","ENSG00000134323.10"), printURL = TRUE, printTime = TRUE, myStudy = "GTEx", myNorms = c("rsem", "sample_rsem_isoform"))
#' getGeneDataFromEnsemblGeneID(myEnsemblGeneIDs = c("ENSG00000002079.12","ENSG00000134323.10"), printURL = TRUE, printTime = TRUE, myStudy = NULL, myNorms = NULL)
#'
#' @export
getGeneDataFromEnsemblGeneID <- function(myEnsemblGeneIDs = NULL, myProjection = "summary", printURL = FALSE, printTime = FALSE, myStudy = NULL, myNorms = NULL) {
  api <- returnBaseEndPoint()
  myProjection <- paste0("?projection=", myProjection)
  myEnsemblGeneIDs <- paste(myEnsemblGeneIDs, collapse = ",")

  if(is.null(myStudy)) {
    myStudy <- getStudies()
  }
  myStudy <- paste(myStudy, collapse = ",")
  myStudy <- paste0("/studies/", myStudy)

  if(is.null(myNorms)) {
    myNorms <- c('rsem','sample_abundance','sample_rsem_isoform')
  }
  myNorms <- paste(myNorms, collapse = ",")
  myNorms <- paste0("/normalizations/", myNorms)

  myURL <- paste0(api, "data/genes/ids/", myEnsemblGeneIDs, myStudy, myNorms, myProjection)
  output <- retrieveDataTAB(myURL, printURL = printURL, printTime = printTime)
  return(output)
}

#' Get expression data by hugo gene symbol
#'
#' Get expression data by hugo gene symbol
#'
#' @param myGeneSymbols character vector of hugo gene symbols to query. Use \code{\link{getGeneSymbols}} to get all available gene symbols.
#' @param myProjection character string. 'summary' by default.
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#' @param myStudy character vector of studies to query. If NULL, returns data for all studies. Use \code{\link{getStudies}} to get all available studies.
#' @param myNorms character vector of normalizations to query. If NULL, returns data for all normalizations. Current normalizations include 'rsem' (gene level), 'sample_abundance'(transcript level), and 'sample_rsem_isoform'(transcript level).
#'
#' @return dataframe of expression data corresponding to query symbols
#'
#' @examples
#' getGeneDataFromGeneSymbol(myGeneSymbols = c("MYCN", "MYC"), printURL = TRUE, printTime = TRUE, myStudy = c("TARGET", "TCGA"), myNorms = NULL)
#' getGeneDataFromGeneSymbol(myGeneSymbols = c("MYCN", "MYC"), printURL = TRUE, printTime = TRUE, myStudy = "GTEx", myNorms = c("rsem", "sample_rsem_isoform"))
#' getGeneDataFromGeneSymbol(myGeneSymbols = c("MYCN", "MYC"), printURL = TRUE, printTime = TRUE, myStudy = NULL, myNorms = NULL)
#'
#' @export
getGeneDataFromGeneSymbol <- function(myGeneSymbols = NULL, myProjection = "summary", printURL = FALSE, printTime = FALSE, myStudy = NULL, myNorms = NULL) {
  api <- returnBaseEndPoint()
  myProjection <- paste0("?projection=", myProjection)
  myGeneSymbols <- paste(myGeneSymbols, collapse = ",")

  if(is.null(myStudy)) {
    myStudy <- getStudies()
  }
  myStudy <- paste(myStudy, collapse = ",")
  myStudy <- paste0("/studies/", myStudy)

  if(is.null(myNorms)) {
    myNorms <- c('rsem','sample_abundance','sample_rsem_isoform')
  }
  myNorms <- paste(myNorms, collapse = ",")
  myNorms <- paste0("/normalizations/", myNorms)

  myURL <- paste0(api, "data/genes/symbols/", myGeneSymbols, myStudy, myNorms, myProjection)
  output <- retrieveDataTAB(myURL, printURL = printURL, printTime = printTime)
  return(output)
}

#' Get expression data by ensembl transcript id
#'
#' Get expression data by ensembl transcript id
#'
#' @param myTranscripts character vector of ensembl transcript id to query. Use \code{\link{getTranscripts}} to get all available transcript ids.
#' @param myProjection character string. 'summary' by default.
#' @param printURL logical to print URL
#' @param printTime logical to print time taken
#' @param myStudy character vector of studies to query. If NULL, returns data for all studies. Use \code{\link{getStudies}} to get all available studies.
#' @param myNorms character vector of normalizations to query. If NULL, returns data for all normalizations. Current normalizations include 'rsem' (gene level), 'sample_abundance'(transcript level), and 'sample_rsem_isoform'(transcript level).
#'
#' @return dataframe of expression data corresponding to query ids
#'
#' @examples
#' getDataFromTranscript(myTranscripts = c("ENST00000488147.1","ENST00000425880.1"), printURL = TRUE, printTime = TRUE, myStudy = c("TARGET", "TCGA"), myNorms = NULL)
#' getDataFromTranscript(myTranscripts = c("ENST00000488147.1","ENST00000425880.1"), printURL = TRUE, printTime = TRUE, myStudy = "GTEx", myNorms = c("rsem", "sample_rsem_isoform"))
#' getDataFromTranscript(myTranscripts = c("ENST00000488147.1","ENST00000425880.1"), printURL = TRUE, printTime = TRUE, myStudy = NULL, myNorms = NULL)
#'
#' @export
getDataFromTranscript <- function(myTranscripts = NULL, myProjection = "summary", printURL = FALSE, printTime = FALSE, myStudy = NULL, myNorms = NULL) {
  api <- returnBaseEndPoint()
  myProjection <- paste0("?projection=", myProjection)
  myTranscripts <- paste(myTranscripts, collapse = ",")

  if(is.null(myStudy)) {
    myStudy <- getStudies()
  }
  myStudy <- paste(myStudy, collapse = ",")
  myStudy <- paste0("/studies/", myStudy)

  if(is.null(myNorms)) {
    myNorms <- c('rsem','sample_abundance','sample_rsem_isoform')
  }
  myNorms <- paste(myNorms, collapse = ",")
  myNorms <- paste0("/normalizations/", myNorms)

  myURL <- paste0(api, "data/transcripts/ids/", myTranscripts, myStudy, myNorms, myProjection)
  output <- retrieveDataTAB(myURL, printURL = printURL, printTime = printTime)
  return(output)
}
