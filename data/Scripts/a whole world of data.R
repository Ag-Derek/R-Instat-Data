## A whole world of data r-script practical
# Script produced on 4 December 2024 using R-Instat Version 0.8.0.
# Importing the diamonds data into R-Instat from the library

utils::data(package="ggplot2", X=diamonds)
data_book$import_data(data_tables=list(diamonds=diamonds))


# Producing a Scatter Plot in R-Instat

diamonds <- data_book$get_data_frame(data_name="diamonds")
last_graph <- ggplot2::ggplot(data=diamonds, mapping=ggplot2::aes(colour=cut, y=color, x=clarity)) + ggplot2::geom_jitter(width=0.40, height=0.40) + theme_grey()
data_book$add_object(data_name="diamonds", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="diamonds", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "diamonds"))


# Create Filter subdialog: Created new filter
data_book$add_filter(filter=list(C0=list(column="carat", operation=">", value=1)), data_name="diamonds", filter_name="filter")


# Data Options subdialog: Set the current filter
data_book$set_current_filter(data_name="diamonds", filter_name="filter")


# Producing a Scatter Plot in R-Instat with filtered values of carat>1

diamonds <- data_book$get_data_frame(data_name="diamonds")
last_graph <- ggplot2::ggplot(data=diamonds, mapping=ggplot2::aes(colour=cut, x=clarity, y=color)) + ggplot2::geom_jitter(width=0.40, height=0.40) + theme_grey()
data_book$add_object(data_name="diamonds", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="diamonds", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "diamonds"))


# Importing the mydata data into R-Instat from the library

utils::data(package="openair", X=mydata)
data_book$import_data(data_tables=list(mydata=mydata))


# Importing the efc data into R-Instat from the library

utils::data(package="sjlabelled", X=efc)
data_book$import_data(data_tables=list(efc=efc))

## Datasets for specific points

# Importing the datasaurus data into R-Instat from the library

utils::data(package="datasauRus", X=datasaurus_dozen)
data_book$import_data(data_tables=list(datasaurus_dozen=datasaurus_dozen))

# Right click menu: Convert the dataset Column To Factor
data_book$convert_column_to_type(data_name="datasaurus_dozen", col_names="dataset", to_type="factor")



# Producing a Scatter Plot in R-Instat

datasaurus_dozen <- data_book$get_data_frame(data_name="datasaurus_dozen")
last_graph <- ggplot2::ggplot(data=datasaurus_dozen, mapping=ggplot2::aes(colour=dataset, y=y, x=x)) + ggplot2::geom_jitter(width=0.40, height=0.40) + theme_grey() + ggplot2::theme(legend.position="none") + ggplot2::facet_wrap(facets= ~ dataset, dir="h")
data_book$add_object(data_name="datasaurus_dozen", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="datasaurus_dozen", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "datasaurus_dozen"))


# Importing the simpsons_paradox data into R-Instat from the library

utils::data(package="datasauRus", X=simpsons_paradox)
data_book$import_data(data_tables=list(simpsons_paradox=simpsons_paradox))

# Right click menu: Convert Column(s) To Factor
data_book$convert_column_to_type(data_name="simpsons_paradox", col_names="dataset", to_type="factor")


# Producing a Scatter Plot in R-Instat

simpsons_paradox <- data_book$get_data_frame(data_name="simpsons_paradox")
last_graph <- ggplot2::ggplot(data=simpsons_paradox, mapping=ggplot2::aes(colour=dataset, x=x, y=y)) + ggplot2::geom_jitter(width=0.40, height=0.40) + theme_grey() + ggplot2::theme(legend.position="none") + ggplot2::facet_wrap(facets= ~ dataset, dir="h")
data_book$add_object(data_name="simpsons_paradox", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="simpsons_paradox", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "simpsons_paradox"))


# Producing a Scatter Plot in R-Instat with a line of best fit

simpsons_paradox <- data_book$get_data_frame(data_name="simpsons_paradox")
last_graph <- ggplot2::ggplot(data=simpsons_paradox, mapping=ggplot2::aes(colour=dataset, y=y, x=x)) + ggplot2::geom_jitter(width=0.40, height=0.40) + ggplot2::geom_smooth(method="lm", se=TRUE) + theme_grey() + ggplot2::theme(legend.position="none")
data_book$add_object(data_name="simpsons_paradox", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="simpsons_paradox", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "simpsons_paradox"))


# Importing the UCBAdmissions data into R-Instat from the library

utils::data(package="datasets", X=UCBAdmissions)
data_book$import_data(data_tables=list(UCBAdmissions=UCBAdmissions))


## Datasets from books



# Importing the movielens data From the R-Instat Library

utils::data(package="dslabs", X=movielens)
data_book$import_data(data_tables=list(movielens=movielens))


## Agriculture data

# Importing the gomezsplitsplit data From the R-Instat Library

utils::data(package="agridat", X=gomez.splitsplit)
data_book$import_data(data_tables=list(gomez.splitsplit=gomez.splitsplit))


## Data from lists


# Importing lists of Canadian municipalities into R-Instat

canadian_municipalities <- read_corpora(data=rcorpora::corpora("geography/canadian_municipalities"))
data_book$import_data(data_tables=list(canadian_municipalities=canadian_municipalities))

rm(canadian_municipalities)


## Datasets from outside R Packages

## MICS data


# Importing the MICS Dataset into R-Instat
#  Dataset
# Get the current working directory
current_dir <- getwd()

# Construct the desired file path by navigating up two directories and into "Library"
file_path <- file.path(dirname(dirname(current_dir)), "Library", "mics.RDS")

# Read the RDS file
new_RDS <- readRDS(file = file_path)

# Dialog: Import Dataset
data_book$import_RDS(data_RDS=new_RDS)
rm(new_RDS)
