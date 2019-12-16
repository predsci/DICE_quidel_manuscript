
# ---- SUMMARY --------------------------------------
# This script demonstrates how to use the data from 'Accurate influenza forecasts using 
# type-specific incidence data for small geographical units' with the DICE software 
# package.  The 'manuscript_data' path variable (line 18) must be set to the location 
# of your copy of cluster_DICE_data.rds.  If you do not have a copy of 
# cluster_DICE_data.rds, email jturtle at predsci.com or s.riley at imperial.ac.uk .  
# In most cases this data is freely available for non-profit pursuits.

# ---- LIBRARY and DIR ------------------------------
# load DICE library (available from https://github.com/predsci/DICE_quidel_manuscript)
# For installation intructions, see README.md
library(DICE)

# set working directory.  DICE will create a sub-directory and write a number 
# of data and image files to it.
setwd("~/")

# ---- DATA SELECTION -------------------------------
# Read in the rds file distributed in conjunction with the manuscript
manuscript_data = readRDS(file="~/my_local_dir/cluster_DICE_data.rds")

# see which cluster/seasons/metrics are available
names(test_data$data_structs)
# select the appropriate data structure
data_use = manuscript_data$data_structs$`Colorado_2016-2017_total_specimens`

# select the number of season weeks to fit (the standard with this data is to start/end
# seasons on MMWR week 27/26.  So nfit=25 means to fit MMWR weeks 27 through 51.)
# nfit should be an integer value between 10 and 52.
nfit = 25

# ---- MODEL PARAMETERS -----------------------------
# R_0 modulation model
#   1 - Humidity modulated force of infection
#   4 - force of infection fixed in time
# models 2 and 3 use school vacation schedules. Unfortunately, we don't have school
# schedule data for these counties/seasons. model 5 is an arbitrary two-value model
# that was not used in the manuscript
model = 1

# Spatial relationship
#   1 - uncoupled counties fit independently
#   0 - coupling term included, fit the coupled system
# NOTE: direct cluster fits are performed for both coupled and uncoupled runs
isingle = 0


# ---- NUMERIC PARAMETERS --------------------------
# the number of MCMC realizations/chains to initiate.  Each chain will start with 
# random initial conditions.
nreal = 1
# the number of MCMC steps to take in each realization/chain. A rough estimate of 
# compute time (hrs) for 1 realization (uncoupled model) is 
# (nMCMC * # of subregions)/1e6. This may vary substantially depending on your 
# system capabilities. Compute times for coupled models are longer.
nMCMC = 1e04
# For the manuscript we generally ran 3 realizations, each with 2e06 steps.


# ---- EXECUTE DICE ---------------------------------
DICE_out = runDICE(nfit=nfit, model=model, isingle=isingle, nMCMC=nMCMC, nreal=nreal, all_data=data_use)

# ---- VIEW RESULTS ---------------------------------
# In the example above, DICE creates the directory 
# ~/Colorado-aggregate_2016_level_4_prior_0_Temp_1_da_0_Tg_3/
# and generates a number of pdfs and data files.

# The complete data set and historic averages are plotted in:
# Colorado-aggregate-2016-2019-flu-incidence.pdf

# A summary of results is viewed in:
# results-quidel-total_specimens-sir-Colorado-aggregate-cpl-2016-2017-4-52-1.pdf

# posterior parameter distributions appear in:
# params-quidel-total_specimens-sir-Colorado-aggregate-cpl-2016-2017-4-52-1.pdf

# See the manual (dice/vignettes/dice.pdf) for more details on the numeric outputs
# DICE_out, mcmc-quidel-total_specimens-sir-Colorado-aggregate-cpl-2016-2017-4-52-1.RData, and
# profiles-quidel-total_specimens-sir-Colorado-aggregate-cpl-2016-2017-4-52-1.RData . 









