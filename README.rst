.. |date| date::

***********************
DiseaseXpress R Package
***********************

:authors: Komal Rathi, Pichai Raman
:contact: rathik@email.chop.edu
:organization: DBHi, CHOP
:status: This is "work in progress"
:date: |date|

.. meta::
   :keywords: R package, DiseaseXpress, 2017
   :description: DBHi R package.

NOTE
====

This repo is **deprecated**. Plan is to update the package by pulling in data from https://github.com/d3b-center/OpenPedCan-analysis

Introduction
============

R Package to access the DiseaseXpress database. This package will allow you to pull RNA-seq gene expression data processed using three normalization types (RSEM FPKM, RSEM TPM and Kallisto TPM) available across four studies PNOC, GTEx, TARGET and TCGA. You can query by Ensembl Gene ID (Gencode), Transcript ID or HUGO gene symbol.

To install package simply clone the repository:

.. code-block:: bash

        # https
	git clone https://github.com/d3b-center/RDiseaseXpress.git
	
	# ssh
	git clone git@github.com:d3b-center/RDiseaseXpress.git

Then, install with this command:

.. code-block:: bash

	R CMD INSTALL --no-multiarch --with-keep.source RDiseaseXpress

or install within R to install all dependencies like **readr**:

.. code-block:: bash

	devtools::install_deps("/path/to/RDiseaseXpress", dependencies = TRUE)

Within R, access the package using:

.. code-block:: bash

	library(RDiseaseXpress)
	
	# get documentation
	help('RDiseaseXpress')

