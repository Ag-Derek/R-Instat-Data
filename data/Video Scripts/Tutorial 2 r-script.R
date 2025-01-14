# Script produced on 23 November 2024 using R-Instat Version 0.8.0.
# Script updated on 14 January 2025 using R-Instat Version 0.8.1.
# Tutorial 2 r-script

# Importing the Dodoma Dataset into R-Instat
# Current working directory
current_dir <- getwd()

# Construct the desired file path
file_path <- file.path(dirname(dirname(current_dir)), "Library", "Climatic", "climatic_guide_datasets.xlsx") 

# Importing the Dodoma Dataset into R-Instat

dodoma <- rio::import(file=file_path, guess_max=Inf, which=6)
data_book$import_data(data_tables=list(dodoma=dodoma))

# Using the One Variable Summarise dialog to find out more about the missing values

dodoma <- data_book$get_data_frame(data_name="dodoma")
last_summary <- summary(data=dodoma, object=data_book$get_columns_from_data(data_name="dodoma", col_names=c("year","month","day","rain","tmax","tmin","sunh")), maxsum=12, na.rm=FALSE)
data_book$add_object(data_name="dodoma", object_name="last_summary", object_type_label="summary", object_format="text", object=last_summary)
data_book$get_object_data(data_name="dodoma", object_name="last_summary", as_file=TRUE)
rm(list=c("last_summary", "dodoma"))


# Create Filter subdialog: Created new filter
data_book$add_filter(filter=list(C0=list(column="year", operation=">", value=1957)), data_name="dodoma", filter_name="filter")


# Filter the data to start in 1958 when the temperature data starts

data_book$set_current_filter(data_name="dodoma", filter_name="filter")


# Using the One Variable Summarise dialog to summarize again after reducing the number of missing values

dodoma <- data_book$get_data_frame(data_name="dodoma")
last_summary <- summary(data=dodoma, object=data_book$get_columns_from_data(data_name="dodoma", col_names=c("year","month","day","rain","tmax","tmin","sunh")), maxsum=12, na.rm=FALSE)
data_book$add_object(data_name="dodoma", object_name="last_summary", object_type_label="summary", object_format="text", object=last_summary)
data_book$get_object_data(data_name="dodoma", object_name="last_summary", as_file=TRUE)
rm(list=c("last_summary", "dodoma"))


# Summarizing the data to produce the yearly means and totals without missing values

data_book$calculate_summary(data_name="dodoma", columns_to_summarise=c("tmax","tmin"), factors="year", store_results=TRUE, na.rm=TRUE, na_type=c(), j=1, summaries=c("summary_count", "summary_mean"), silent=TRUE)


# Summarizing the data again to produce the yearly means and totals without omitting the missing values

data_book$calculate_summary(data_name="dodoma", columns_to_summarise=c("tmax","tmin"), factors="year", store_results=TRUE, j=1, summaries=c("summary_count", "summary_mean"), silent=TRUE)


# Summarizing the data again to produce the yearly means and totals without the missing values

data_book$calculate_summary(data_name="dodoma", columns_to_summarise=c("tmax","tmin"), factors="year", store_results=TRUE, na.rm=TRUE, na_type=c(), j=1, summaries=c("summary_count", "summary_mean"), silent=TRUE)


# Producing a line plot for the mean_tmax

dodoma_by_year <- data_book$get_data_frame(data_name="dodoma_by_year")
last_graph <- ggplot2::ggplot(data=dodoma_by_year, mapping=ggplot2::aes(y=mean_tmax, x=year)) + ggplot2::geom_line(colour="blue", size=0.8) + theme_grey()
data_book$add_object(data_name="dodoma_by_year", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="dodoma_by_year", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "dodoma_by_year"))


# Producing a line plot for the mean_tmin

dodoma_by_year <- data_book$get_data_frame(data_name="dodoma_by_year")
last_graph <- ggplot2::ggplot(data=dodoma_by_year, mapping=ggplot2::aes(y=mean_tmin, x=year)) + ggplot2::geom_line(colour="blue", size=0.8) + theme_grey()
data_book$add_object(data_name="dodoma_by_year", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="dodoma_by_year", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "dodoma_by_year"))


# Saving the data for later use

saveRDS(file=file.path(Sys.getenv("USERPROFILE"), "Documents", "dodoma.RDS"), object=data_book)
