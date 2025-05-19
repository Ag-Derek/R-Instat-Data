## Express Start Another example
# Produced on 30 January, 2025 on Version 0.8.1
# Updated on 19th May, 2025 on Version 0.8.5
# Importing a Dataset into R-Instat

# Get the current working directory
current_dir <- getwd()

# Construct the file path
file_path <- file.path(dirname(dirname(current_dir)), "Library", "introductory_guide_datasets.xlsx")

# Import the survey dataset (e.g., sheet 2) using rio
survey <- rio::import(file = file_path, guess_max = Inf, which = 2)

# Import the dataset into R-Instat
data_book$import_data(data_tables = list(survey = survey))

# Clean up the workspace

# Using the Transform Text Column dialog to tidy up the village column

village <- data_book$get_columns_from_data(data_name="survey", col_names="village", use_current_filter=FALSE)
village <- stringr::str_to_title(string=village)
data_book$add_columns_to_data(data_name="survey", col_name="village", col_data=village, before=FALSE, adjacent_column="village")

rm(village)


# Right click menu: Convert Column(s) To Factor

data_book$convert_column_to_type(data_name="survey", col_names="village", to_type="factor")


# Viewing the Labels and Levels of the village variable

data_book$set_factor_levels(data_name="survey", col_name="village", new_labels=c("Sabey","Kesen","Niko","Nanda"))

# Using the Transform Text Column dialog to tidy up the variety column

variety <- data_book$get_columns_from_data(data_name="survey", col_names="variety", use_current_filter=FALSE)
variety <- stringr::str_to_lower(string=variety)
data_book$add_columns_to_data(data_name="survey", col_name="variety", col_data=variety, before=FALSE, adjacent_column="variety")

rm(variety)

# Right click menu: Convert Column(s) To Factor

data_book$convert_column_to_type(data_name="survey", col_names="variety", to_type="factor")


# Reordeing the Levels of the variety factor column

data_book$reorder_factor_levels(data_name="survey", col_name="variety", new_level_names=c("new","old","trad"))


# Viewing the Labels and Levels of the variety variable

data_book$set_factor_levels(data_name="survey", col_name="variety", new_labels=c("new","old","trad"))


# Right click menu: Convert Column(s) To Factor

data_book$convert_column_to_type(data_name="survey", col_names="fertgrp", to_type="factor")


# Viewing the Labels and Levels of the fertgrp variable

data_book$set_factor_levels(data_name="survey", col_name="fertgrp", new_labels=c(">2cwt",".5-2cwt","0cwt"))


# Reordeing the Levels of the fertgrp factor column

fertgrp <- data_book$get_columns_from_data(data_name="survey", col_names="fertgrp")
fertgrp <- forcats::fct_rev(f=fertgrp)
data_book$add_columns_to_data(data_name="survey", col_name="fertgrp", col_data=fertgrp, before=FALSE, adjacent_column="fertgrp")

rm(fertgrp)

# Viewing the Labels and Levels of the fertgrp variable

data_book$set_factor_levels(data_name="survey", col_name="fertgrp", new_labels=c("0cwt",".5-2cwt",">2cwt"))


# Transforming the yield variable units to tons per hectares

yield <- data_book$get_columns_from_data(data_name="survey", col_names="yield", use_current_filter=FALSE)
yield1 <- (yield) / 14.87
data_book$add_columns_to_data(data_name="survey", col_name="yield1", col_data=yield1, before=FALSE, adjacent_column="yield")

data_book$append_to_variables_metadata(data_name="survey", col_names="yield1", property="labels", new_val="")
rm(list=c("yield1", "yield"))


# Exploring the yield variable using a Pivot Table in R-Instat

survey <- data_book$get_data_frame(data_name="survey")
last_table <- rpivotTable::rpivotTable(data=survey, rows=c("village","variety"), cols="fert", val="yield1", rendererName="Table", aggregatorName="Average")
data_book$add_object(data_name="survey", object_name="last_table", object_type_label="table", object_format="html", object=last_table)
data_book$get_object_data(data_name="survey", object_name="last_table", as_file=TRUE)
rm(list=c("last_table", "survey"))


# Using the Scatter Plot to explore the yield further

survey <- data_book$get_data_frame(data_name="survey")
last_graph <- ggplot2::ggplot(data=survey, mapping=ggplot2::aes(colour=variety, y=yield1, x=fert)) + ggplot2::geom_point() + theme_grey()
data_book$add_object(data_name="survey", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="survey", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "survey"))


# Using the Scatter Plot to explore the yield further with bigger points and a line of best fit

survey <- data_book$get_data_frame(data_name="survey")
last_graph <- ggplot2::ggplot(data=survey, mapping=ggplot2::aes(colour=variety, x=fert, y=yield1)) + ggplot2::geom_point(size=3.0) + ggplot2::geom_smooth(method="lm", se=FALSE) + theme_grey()
data_book$add_object(data_name="survey", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="survey", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "survey"))


# Using the Scatter Plot to explore the yield further with bigger points and an added layer of parallel slopes

survey <- data_book$get_data_frame(data_name="survey")
last_graph <- ggplot2::ggplot(data=survey, mapping=ggplot2::aes(colour=variety, y=yield1, x=fert)) + ggplot2::geom_point(size=3.0) + moderndive::geom_parallel_slopes() + theme_grey() + ggplot2::theme(legend.position="none")
data_book$add_object(data_name="survey", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="survey", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "survey"))

## Recreating the pivot table graph

# Producing the Column Summaries in order to recreate the pivot table graph

data_book$calculate_summary(data_name="survey", columns_to_summarise="yield1", store_results=TRUE, factors=c("fert","variety"), 
original_level=TRUE, j=1, summaries=c("summary_count", "summary_mean"), silent=TRUE)


# Producing a line graph to show the frequencies

survey <- data_book$get_data_frame(data_name="survey")
last_graph <- ggplot2::ggplot(data=survey, mapping=ggplot2::aes(x=fert, y=mean_yield1, colour=variety)) + ggplot2::geom_line() + ggplot2::geom_count() + theme_grey()
data_book$add_object(data_name="survey", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="survey", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "survey"))

## A model with parallel lines

# Producing a boxplot to show the general idea

survey <- data_book$get_data_frame(data_name="survey")
last_graph <- ggplot2::ggplot(data=survey, mapping=ggplot2::aes(y=yield1, x="")) + ggplot2::geom_boxplot(outlier.colour="red", outlier.shape=NA) + ggplot2::geom_jitter(height=0, width=0.05) + theme_grey() + ggplot2::theme(legend.position="none") + ggplot2::facet_grid(facets= ~ variety, margins=TRUE, space="fixed")
data_book$add_object(data_name="survey", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="survey", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "survey"))


# Summarising Two Variables producing an ANOVA table

y_col_names_list <- "yield1"
purrr::walk(.x=y_col_names_list, .f= ~ data_book$anova_tables2(data="survey",  x_col_names=c("variety"), y_col_name=.x, signif.stars=FALSE, sign_level=FALSE, total=FALSE))
rm(y_col_names_list)


# Summarising Two Variables producing an ANOVA table

y_col_names_list <- "yield1"
purrr::walk(.x=y_col_names_list, .f= ~ data_book$anova_tables2(data="survey",  x_col_names=c("fert"), y_col_name=.x, signif.stars=FALSE, sign_level=FALSE, total=FALSE))
rm(y_col_names_list)


# Summarising three Variables producing an ANOVA table

y_col_names_list <- "yield1"
purrr::walk(.x=y_col_names_list, .f= ~ data_book$anova_tables2(data="survey",  x_col_names=c("fert", "variety"), y_col_name=.x, signif.stars=FALSE, sign_level=FALSE, total=FALSE))
rm(y_col_names_list)


# Summarising three Variables producing an ANOVA table

y_col_names_list <- "yield1"
purrr::walk(.x=y_col_names_list, .f= ~ data_book$anova_tables2(data="survey",  x_col_names=c("variety", "fert"), y_col_name=.x, signif.stars=FALSE, sign_level=FALSE, total=FALSE))
rm(y_col_names_list)
