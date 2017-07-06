.. |date| date::

***********************
DiseaseXpress R Package
***********************

:authors: Pichai Raman, Komal Rathi
:contact: rathik@email.chop.edu
:organization: DBHi, CHOP
:status: This is "work in progress"
:date: |date|

.. meta::
   :keywords: R package, DiseaseXpress, 2017
   :description: DBHi R package.

Introduction
============

R Package to access the Disease Express Database.

To install package simply clone the repository:

.. code-block:: bash

	git clone https://github.research.chop.edu/rathik/RDiseaseXpress.git

Then, install with this command:

.. code-block:: bash

	R CMD INSTALL --no-multiarch --with-keep.source RDiseaseXpress

or install within R to install all dependencies like *readr*:

.. code-block:: bash

	devtools::install_deps("/path/to/RDiseaseXpress", dependencies = TRUE)

Within R, access the package using:

.. code-block:: bash

	library(RDiseaseXpress)
	
	# get documentation
	help('RDiseaseXpress')

