#Tutorial 1 script version

# Importing Data into R-Instat From the Library

utils::data(package="ggplot2", X=diamonds)
data_book$import_data(data_tables=list(diamonds=diamonds))


# Graph 1: One Variable Graph Dialog with a Combined graph

last_graph <- data_book$graph_one_variable(data_name="diamonds", columns=c("carat","cut","color","clarity","depth","table","price","x","y","z"), numeric="geom_boxplot", categorical="geom_bar", output="combine")
data_book$add_object(data_name="diamonds", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="diamonds", object_name="last_graph", as_file=TRUE)
rm(last_graph)


# Graph 2: One Variable Graph Dialog with a Faceted Graph

last_graph <- data_book$graph_one_variable(data_name="diamonds", columns=c("depth","table","price","x","y","z"), numeric="geom_boxplot", categorical="geom_bar")
data_book$add_object(data_name="diamonds", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="diamonds", object_name="last_graph", as_file=TRUE)
rm(last_graph)



# Graph 3: One Variable Graph Dialog with a Faceted Graph on a Free Scale Axis

last_graph <- data_book$graph_one_variable(data_name="diamonds", columns=c("depth","table","price","x","y","z"), numeric="geom_boxplot", categorical="geom_bar", free_scale_axis=TRUE)
data_book$add_object(data_name="diamonds", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="diamonds", object_name="last_graph", as_file=TRUE)
rm(last_graph)


# One variable summaries for the diamonds data variables

diamonds <- data_book$get_data_frame(data_name="diamonds")
last_summary <- summary(data=diamonds, object=data_book$get_columns_from_data(data_name="diamonds", col_names=c("carat","cut","color","clarity","depth","table","price","x","y","z")), maxsum=12, na.rm=FALSE)
data_book$add_object(data_name="diamonds", object_name="last_summary", object_type_label="summary", object_format="text", object=last_summary)
data_book$get_object_data(data_name="diamonds", object_name="last_summary", as_file=TRUE)
rm(list=c("last_summary", "diamonds"))


# Graph 4: A more ambitious analysis two plus variable graph 

diamonds <- data_book$get_data_frame(data_name="diamonds")
last_graph <- GGally::ggpairs(data=diamonds, columns=c("depth","table","price"))
data_book$add_object(data_name="diamonds", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="diamonds", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "diamonds"))


# Graph 5: A more ambitious analysis two plus variable graph with colour  

diamonds <- data_book$get_data_frame(data_name="diamonds")
last_graph <- GGally::ggpairs(data=diamonds, columns=c("depth","table","price"), ggplot2::aes(colour=cut))
data_book$add_object(data_name="diamonds", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="diamonds", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "diamonds"))


# Graph 6: Colour graph with numeric and factor variables

diamonds <- data_book$get_data_frame(data_name="diamonds")
last_graph <- GGally::ggpairs(data=diamonds, columns=c("depth","table","price","color","clarity"), ggplot2::aes(colour=cut))
data_book$add_object(data_name="diamonds", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="diamonds", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "diamonds"))


# Graph 7: Pairwise plot: Examining the relationship between the data in the x and z variables

x <- data_book$get_columns_from_data(data_name="diamonds", col_names="x")
z <- data_book$get_columns_from_data(data_name="diamonds", col_names="z")
last_model <- cor.test(x=x, y=z, alternative="two.sided", exact=NULL, method="pearson")
data_book$add_object(data_name="diamonds", object_name="last_model", object_type_label="model", object_format="text", object=last_model)
data_book$get_object_data(data_name="diamonds", object_name="last_model", as_file=TRUE)
diamonds <- data_book$get_data_frame(data_name="diamonds", remove_attr=TRUE)
last_graph <- GGally::ggpairs(data=diamonds, columns=c("x", "z"), lower=list(continuous=GGally::wrap('points')))
data_book$add_object(data_name="diamonds", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="diamonds", object_name="last_graph", as_file=TRUE)
rm(list=c("last_model", "x", "z", "last_graph", "diamonds"))


# Frequencies: Finding the outliers in the z variable

last_summary <- sjmisc::frq(x=data_book$get_columns_from_data(data_name="diamonds", col_names="z", force_as_data_frame=TRUE, remove_labels=TRUE, drop_unused_filter_levels=TRUE))
data_book$add_object(data_name="diamonds", object_name="last_summary", object_type_label="summary", object_format="text", object=last_summary)
data_book$get_object_data(data_name="diamonds", object_name="last_summary", as_file=TRUE)
rm(last_summary)


# Create Filter subdialog: Created new filter
data_book$add_filter(filter=list(C0=list(column="z", operation=">", value=0), C1=list(column="z", operation="<", value=10)), data_name="diamonds", filter_name="filter")


# Filtering the z variable to eliminate some of the outliers

data_book$set_current_filter(data_name="diamonds", filter_name="filter")


# # Graph 8: Pairwise plot: Examining the relationship between the data in the x and z variables after filtering the rows to eliminate some outliers

x <- data_book$get_columns_from_data(data_name="diamonds", col_names="x")
z <- data_book$get_columns_from_data(data_name="diamonds", col_names="z")
last_model <- cor.test(x=x, y=z, alternative="two.sided", exact=NULL, method="pearson")
data_book$add_object(data_name="diamonds", object_name="last_model", object_type_label="model", object_format="text", object=last_model)
data_book$get_object_data(data_name="diamonds", object_name="last_model", as_file=TRUE)
diamonds <- data_book$get_data_frame(data_name="diamonds", remove_attr=TRUE)
last_graph <- GGally::ggpairs(data=diamonds, columns=c("x", "z"), lower=list(continuous=GGally::wrap('points')))
data_book$add_object(data_name="diamonds", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="diamonds", object_name="last_graph", as_file=TRUE)
rm(list=c("last_model", "x", "z", "last_graph", "diamonds"))

