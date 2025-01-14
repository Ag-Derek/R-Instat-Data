# Script produced on 14 January 2025 using R-Instat Version 0.8.1.

## Line plots in R-Instat

# Importing the economics data From the R-InstatLibrary

utils::data(package="ggplot2", X=economics)
data_book$import_data(data_tables=list(economics=economics))

# Edited variables metadata value
data_book$append_to_variables_metadata(data_name ="economics",col_names = "date",property="label",new_val="month of data")

# Edited variables metadata value
data_book$append_to_variables_metadata(data_name ="economics",col_names = "pce",property="label",new_val=" personal consumption expenditure in billions of dollars")

# Edited variables metadata value
data_book$append_to_variables_metadata(data_name ="economics",col_names = "pop",property="label",new_val="population in thousands")

# Edited variables metadata value
data_book$append_to_variables_metadata(data_name ="economics",col_names = "psavert",property="label",new_val="personal savings rate")

# Edited variables metadata value
data_book$append_to_variables_metadata(data_name ="economics",col_names = "uempmed",property="label",new_val="median duration of unemployment in weeks")

# Edited variables metadata value
data_book$append_to_variables_metadata(data_name ="economics",col_names = "uempmed",property="label",new_val="median duration of unemployment, in weeks")

# Edited variables metadata value
data_book$append_to_variables_metadata(data_name ="economics",col_names = "unemploy",property="label",new_val="number of unemployed, in thousands")


# Save the Data 
saveRDS(file=file.path(Sys.getenv("USERPROFILE"), "Documents", "lineplots.RDS"), object=data_book)

## The first graphs

# Producing Line Plot for the number of the unemployed against the date

economics <- data_book$get_data_frame(data_name="economics")
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=unemploy, x=date)) + ggplot2::geom_line(size=0.8) + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))


# Producing Line Plot for the population against the date

economics <- data_book$get_data_frame(data_name="economics")
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=pop, x=date)) + ggplot2::geom_line(size=0.8) + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))


# Calculating the unemployment rate

economics <- data_book$get_data_frame(data_name="economics", use_current_filter=FALSE)
attach(what=economics)
scalars <- data_book$get_scalars(data_name="economics")
attach(what=scalars)
unemployrate <- unemploy / pop * 100
data_book$add_columns_to_data(data_name="economics", col_name="unemployrate", col_data=unemployrate, before=FALSE)

detach(name=economics, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="economics", col_names="unemployrate", property="labels", new_val="")
rm(list=c("unemployrate", "economics", "scalars"))


# Producing Line Plot for the unemployment rate against the date

economics <- data_book$get_data_frame(data_name="economics")
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=unemployrate, x=date)) + ggplot2::geom_line(size=0.8) + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))


## Multiple lines on the same graph


# Rescaling the pce variable to be between 0 and 1

economics <- data_book$get_data_frame(data_name="economics", use_current_filter=FALSE)
attach(what=economics)
scalars <- data_book$get_scalars(data_name="economics")
attach(what=scalars)
a_pce <- scales::rescale(pce ,narm=TRUE)
data_book$add_columns_to_data(data_name="economics", col_name="a_pce", col_data=a_pce, before=FALSE)

detach(name=economics, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="economics", col_names="a_pce", property="labels", new_val="")
rm(list=c("a_pce", "economics", "scalars"))


# Rescaling the pop variable to be between 0 and 1

economics <- data_book$get_data_frame(data_name="economics", use_current_filter=FALSE)
attach(what=economics)
scalars <- data_book$get_scalars(data_name="economics")
attach(what=scalars)
a_pop <- scales::rescale( pop,narm=TRUE)
data_book$add_columns_to_data(data_name="economics", col_name="a_pop", col_data=a_pop, before=FALSE)

detach(name=economics, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="economics", col_names="a_pop", property="labels", new_val="")
rm(list=c("a_pop", "economics", "scalars"))


# Rescaling the psavert variable to be between 0 and 1

economics <- data_book$get_data_frame(data_name="economics", use_current_filter=FALSE)
attach(what=economics)
scalars <- data_book$get_scalars(data_name="economics")
attach(what=scalars)
a_psavert <- scales::rescale( psavert,narm=TRUE)
data_book$add_columns_to_data(data_name="economics", col_name="a_psavert", col_data=a_psavert, before=FALSE)

detach(name=economics, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="economics", col_names="a_psavert", property="labels", new_val="")
rm(list=c("a_psavert", "economics", "scalars"))


# Rescaling the uempmed variable to be between 0 and 1

economics <- data_book$get_data_frame(data_name="economics", use_current_filter=FALSE)
attach(what=economics)
scalars <- data_book$get_scalars(data_name="economics")
attach(what=scalars)
a_uempmed <- scales::rescale( uempmed,narm=TRUE)
data_book$add_columns_to_data(data_name="economics", col_name="a_uempmed", col_data=a_uempmed, before=FALSE)

detach(name=economics, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="economics", col_names="a_uempmed", property="labels", new_val="")
rm(list=c("a_uempmed", "economics", "scalars"))


# Rescaling the unemploy variable to be between 0 and 1

economics <- data_book$get_data_frame(data_name="economics", use_current_filter=FALSE)
attach(what=economics)
scalars <- data_book$get_scalars(data_name="economics")
attach(what=scalars)
a_unemploy <- scales::rescale( unemploy,narm=TRUE)
data_book$add_columns_to_data(data_name="economics", col_name="a_unemploy", col_data=a_unemploy, before=FALSE)

detach(name=economics, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="economics", col_names="a_unemploy", property="labels", new_val="")
rm(list=c("a_unemploy", "economics", "scalars"))

## Rescaling manually

# Rescaling manually the pce variable to be between 0 and 1

economics <- data_book$get_data_frame(data_name="economics", use_current_filter=FALSE)
attach(what=economics)
scalars <- data_book$get_scalars(data_name="economics")
attach(what=scalars)
a_pce2 <- (pce - min(rep(pce , ), na.rm= TRUE) ) / (max(rep(pce , ), na.rm= TRUE) - min(rep(pce , ), na.rm= TRUE) )
data_book$add_columns_to_data(data_name="economics", col_name="a_pce2", col_data=a_pce2, before=FALSE, adjacent_column="a_pce")

detach(name=economics, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="economics", col_names="a_pce2", property="labels", new_val="")
rm(list=c("a_pce2", "economics", "scalars"))

# Right click menu: Delete Column(s)

data_book$remove_columns_in_data(data_name="economics", cols="a_pce2")


# Producing Line Plot for the rescaled variables against the date

economics <- data_book$get_data_frame(data_name="economics", stack_data=TRUE, measure.vars=c("a_pce","a_pop","a_psavert","a_uempmed","a_unemploy"))
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=value, colour=variable, x=date)) + ggplot2::geom_line(size=0.8) + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))

# File > Save: save file

saveRDS(file=file.path(Sys.getenv("USERPROFILE"), "Documents", "lineplots.RDS"), object=data_book)

## Changing the direction of the graph

# Producing Line Plot for the date against the unemploy variable with additional plot options

economics <- data_book$get_data_frame(data_name="economics")
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=date, x=unemploy)) + ggplot2::geom_line(size=0.8, orientation="y", colour="red") + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))


## Using a filter and making a step plot

# Create Filter subdialog: Created new filter

data_book$add_filter(filter=list(C0=list(column="date", operation=">", value=as.Date(x="2013/1/1"))), data_name="economics", filter_name="recent")

# Filtering out the final 27 months of the data

data_book$set_current_filter(data_name="economics", filter_name="recent")


# Producing a step plot for the unemploy variable against the date

economics <- data_book$get_data_frame(data_name="economics")
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=unemploy, colour=, x=date)) + ggplot2::geom_step() + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))

# Right click menu: Remove Current Filter

data_book$remove_current_filter(data_name="economics")


## A path graph

# Producing a path graph for the psavert variable against the unemployment rate

economics <- data_book$get_data_frame(data_name="economics")
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=psavert, colour=, x=unemployrate)) + ggplot2::geom_path(linemitre=10) + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))


# Producing a path graph for the psavert variable against the unemployment rate with additional path options

economics <- data_book$get_data_frame(data_name="economics")
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=psavert, colour=date, x=unemployrate)) + ggplot2::geom_path(linemitre=10) + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))

## Adding arrows in R-Instat


# Producing an arrow of the population against the date

economics <- data_book$get_data_frame(data_name="economics")
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=pop, colour=, x=date)) + ggplot2::geom_line(size=0.8, orientation="y", colour="red", arrow=arrow()) + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))


# Producing an arrow of the population against the date with the arrow on both ends of the line

economics <- data_book$get_data_frame(data_name="economics")
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=pop, colour=, x=date)) + ggplot2::geom_line(size=0.8, orientation="y", colour="red", arrow=arrow(ends="both")) + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))


## Smoothing the lines


# Smoothing the line plot for unemploy variable against the date

economics <- data_book$get_data_frame(data_name="economics")
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=unemploy, x=date)) + ggplot2::geom_smooth(se=FALSE, method="loess", size=1) + ggplot2::geom_line() + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))

# Smoothing the line plot for unemploy variable against the date with a span of 0.3

economics <- data_book$get_data_frame(data_name="economics")
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=unemploy, x=date)) + ggplot2::geom_smooth(se=FALSE, method="loess", span=0.30, size=1) + ggplot2::geom_line() + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))


# Smoothing the line plot for unemploy variable against the date with a span of 0.1

economics <- data_book$get_data_frame(data_name="economics")
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=unemploy, x=date)) + ggplot2::geom_smooth(se=FALSE, method="loess", span=0.10, size=1) + ggplot2::geom_line() + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))


# Smoothing a multiple lines plot

economics <- data_book$get_data_frame(data_name="economics", stack_data=TRUE, measure.vars=c("a_pce","a_pop","a_psavert","a_uempmed","a_unemploy"))
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=value, colour=variable, x=date)) + ggplot2::geom_smooth(se=FALSE, method="loess", span=0.10, size=1) + ggplot2::geom_line() + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))


# Smoothing a multiple lines plot with no lines

economics <- data_book$get_data_frame(data_name="economics", stack_data=TRUE, measure.vars=c("a_pce","a_pop","a_psavert","a_uempmed","a_unemploy"))
last_graph <- ggplot2::ggplot(data=economics, mapping=ggplot2::aes(y=value, colour=variable, x=date)) + ggplot2::geom_smooth(se=FALSE, method="loess", span=0.10, size=1) + theme_grey()
data_book$add_object(data_name="economics", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="economics", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "economics"))
