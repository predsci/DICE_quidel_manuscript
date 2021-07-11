# DICE
An R package for modeling and forecasting direct-contact and vector-borne infectious diseases.
This repo is a fork of predsci/DICE4 and contains the code to reproduce results from our 
manuscript 'Accurate influenza forecasts using type-specific incidence data for small 
geographical units'.  See 'Data Access' below for data distribution guidelines.

## DICE Installation Instructions

### Using 'devtools' in an R console
>\> library(devtools)  
>\> install_git(url="https://github.com/predsci/DICE_quidel_manuscript", subdir="dice")  

NOTE: This method is convenient, but it may still be worthwhile to download the 
repository (see next subsection) to a user directory. The scripts in examples/ 
directory and the manual (dice/vignettes/dice.pdf) are quite useful.

### Manually from command line
Navigate to your preferred directory  

> $ cd mydir  

Download the repository from GitHub (requires git command line tools)  

> $ git clone https://github.com/predsci/DICE_quidel_manuscript.git

Navigate into the local repo directory  

> $ cd DICE_quidel_manuscript

Use python script to compile from source  

> $ ./compile.py

NOTE: If you do not wish to or cannot install DICE globally, it can also be installed 
to a local R-library using 'R CMD build dice' and 'R CMD INSTALL -l /my_lib_loc dice'

## Getting Started
If you were referred here from the manuscript 'Accurate influenza forecasts using 
type-specific incidence data for small geographical units', see the example script 
examples/Quidel_Manuscript.R to reproduce results.  
In general, the scripts in examples/ are a good way to get started and the manual 
dice/vignettes/dice.pdf contains much more detailed information along with some 
walk-throughs. Help pages for DICE and runDICE are also good starting points:  

> \> library(DICE)  
> \> ?DICE  
> \> ?runDICE  

## Data Access
Most of the data that DICE works with is publicly available.  To get a copy of the 
aggregated county data from 'Accurate influenza forecasts using type-specific 
incidence data for small geographical units', email jturtle at predsci.com or 
s.riley at imperial.ac.uk .  In most cases this data is freely available for 
non-profit pursuits. Please include in your request a statement that the data 
will be used for non-commercial purposes.