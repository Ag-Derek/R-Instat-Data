#Information about R in R-Instat and the R packages included!

#We generally update with each release to use the latest stable version of R
#From 2024 this means R-Instat is only for 64-bit machines.
#If you know someone who is still using a 32bit machine, their latest version
#of R-Instat is 0.7.16 which can be downloaded from the R-Instat web site. 
R.version

#We like RStudio, but, for simplicity, we install a separate version of R. 
# We have two library locations for the R packages installed with R-Instat
#Location [2] from the libpaths function below, is where they are all loaded
# on installation.  The Tools > Install R package permits the used to 
# update an existing R package, or to add a new one.   
.libPaths()

# Somr R packages are loaded into memory, each time you start R-Instat.  
# The sessionInfo function shows which they are:
sessionInfo()

# We currently load almost 600 packages into R-Instat.  We choose about
# 200 of them and they add the others that they depend on.
# The results from this command are shown, for convenience, in a data frame
# Get the installed packages as a matrix
installed_packages_matrix <- installed.packages()

# Convert the matrix to a data frame
installed_packages_df <- as.data.frame(installed_packages_matrix, stringsAsFactors = FALSE)
data_book$import_data(data_tables=list(installed_packages_df=installed_packages_df))
