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

	git clone https://github.research.chop.edu/ramanp/RDiseaseExpress.git

Then, install with this command:

.. code-block:: bash

	R CMD INSTALL --no-multiarch --with-keep.source RDiseaseExpress

You should be able to enter R and access the package with:

.. code-block:: bash

	library(RDiseaseExpress)
