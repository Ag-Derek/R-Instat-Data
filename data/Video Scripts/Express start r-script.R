# Script produced on 23 November 2024 using R-Instat Version 0.8.0.
# Script updated on 14 January 2025 using R-Instat Version 0.8.1.
## Express Start
## This R-Instat introduction is intended for professional users who have some experience with similar software

# Dialog: Import Dataset

# Get the current working directory
current_dir <- getwd()

# Construct the desired file path by navigating up two directories and into "Library"
file_path <- file.path(dirname(dirname(current_dir)), "Library", "tutorials_after.RDS")

# Read the RDS file
new_RDS <- readRDS(file = file_path)

# Dialog: Import Dataset
data_book$import_RDS(data_RDS=new_RDS)
rm(new_RDS)
## Pivot tables in R-Instat as an excellent tool for data exploration

# Producing a Pivot Table in R-Instat via the Pivot table dialog

dodoma <- data_book$get_data_frame(data_name="dodoma")
last_table <- rpivotTable::rpivotTable(data=dodoma, rows=c("year","day"), cols="month_abbr", val="tmax", rendererName="Table", aggregatorName="Average")
data_book$add_object(data_name="dodoma", object_name="last_table", object_type_label="table", object_format="html", object=last_table)
data_book$get_object_data(data_name="dodoma", object_name="last_table", as_file=TRUE)
rm(list=c("last_table", "dodoma"))


# Producing a Pivot Table in R-Instat with the factor levels

dodoma <- data_book$get_data_frame(data_name="dodoma")
survey_levels <- stringr::str_flatten(string=paste0("\"", levels(x=dodoma $ month_abbr), "\","))

dodoma <- data_book$get_data_frame(data_name="dodoma")
relevel_variables <- paste0("function(attr) {  var sortAs = $.pivotUtilities.sortAs;  return sortAs([", survey_levels,"]); }")
last_table <- rpivotTable::rpivotTable(data=dodoma, rows=c("year","day"), cols="month_abbr", sorters=relevel_variables, val="tmax", rendererName="Table", aggregatorName="Average")
data_book$add_object(data_name="dodoma", object_name="last_table", object_type_label="table", object_format="html", object=last_table)
data_book$get_object_data(data_name="dodoma", object_name="last_table", as_file=TRUE)
rm(list=c("last_table", "dodoma", "relevel_variables", "survey_levels"))


## Calculations in R-Instat using our powerful calculator dialog

# Calculating the price per carat

diamonds <- data_book$get_data_frame(data_name="diamonds", use_current_filter=FALSE)
attach(what=diamonds)
scalars <- data_book$get_scalars(data_name="diamonds")
attach(what=scalars)
price_c <- price / carat
data_book$add_columns_to_data(data_name="diamonds", col_name="price_c", col_data=price_c, before=FALSE, adjacent_column="carat")

detach(name=diamonds, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="diamonds", col_names="price_c", property="labels", new_val="")
rm(list=c("price_c", "diamonds", "scalars"))


# Calculating the mean of the price per carat

diamonds <- data_book$get_data_frame(data_name="diamonds", use_current_filter=FALSE)
attach(what=diamonds)
scalars <- data_book$get_scalars(data_name="diamonds")
attach(what=scalars)
mean_price <- mean(rep( price_c ), na.rm=TRUE)
mean_price
data_book$add_scalar(data_name="diamonds", scalar_name="mean_price", scalar_value=mean_price)
detach(name=diamonds, unload=TRUE)
detach(name=scalars, unload=TRUE)
rm(list=c("mean_price", "diamonds", "scalars"))


## Righ click and filters in R-Instat

# Right click menu: Remove Current Filter
data_book$remove_current_filter(data_name="dodoma")


## Reshaping data into summaries in R-Instat

# Using the Column Summaries to get the annual rainfalls from daily values

data_book$calculate_summary(data_name="dodoma", columns_to_summarise="rain", factors="year", 
store_results=TRUE, j=1, summaries=c("summary_count", "summary_max", "summary_sum"), silent=TRUE)


## The describe menu for a graph

# Create Filter subdialog: Created new filter
data_book$add_filter(filter=list(C0=list(column="color", operation="%in%", value=c("D","E","F"))), data_name="diamonds", filter_name="filter")

# Data Options subdialog: Set the current filter
data_book$set_current_filter(data_name="diamonds", filter_name="filter")

# Creating a General graph tp highlight the vast flexibility of our system

diamonds <- data_book$get_data_frame(data_name="diamonds")
last_graph <- ggplot2::ggplot(data=diamonds, mapping=ggplot2::aes(x=clarity, y=carat, fill=clarity)) + ggplot2::geom_boxplot() + theme_grey() + ggplot2::theme(legend.position="none") + ggplot2::facet_grid(facets=cut ~ color, margins=TRUE, space="fixed")
data_book$add_object(data_name="diamonds", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="diamonds", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "diamonds"))
