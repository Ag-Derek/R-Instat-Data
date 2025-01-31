## R-Instat Generating Random Samples
# Produced on 29 January, 2025 on Version 0.8.1
# Adding a Random smple from a New Data Frame

data <- data.frame(x = 1:30, y = rnorm(30, mean = 100, sd = 15), z = runif(30, min = 10, max = 30))
data_book$import_data(data_tables=list(data=data))

rm(data)

# Adding a Random smple from a New Data Frame

data1 <- data.frame(x = 1:300, y = rnorm(300, mean = 100, sd = 15), z = runif(300, min = 10, max = 300))
data_book$import_data(data_tables=list(data1=data1))

rm(data1)


# Adding Random Samples from a normal distribution to an existing data frame via the random samples dialog

normal <- replicate(n=3, expr=rnorm(mean=100, sd=10, n=300))
data_book$add_columns_to_data(data_name="data1", col_name="normal", col_data=normal, use_col_name_as_prefix=TRUE, before=FALSE)

rm(normal)


# Adding Random Samples from a poisson distribution  to an existing data frame via the random samples dialog

poisson <- replicate(n=1, expr=rpois(n=300, lambda=1))
data_book$add_columns_to_data(data_name="data1", col_name="poisson", col_data=poisson, before=FALSE)

rm(poisson)


# Adding Random Samples from a poisson distribution  to an existing data frame via the random samples dialog

poisson100 <- replicate(n=1, expr=rpois(n=300, lambda=100))
data_book$add_columns_to_data(data_name="data1", col_name="poisson100", col_data=poisson100, before=FALSE)

rm(poisson100)


# Generating a One Variable Graph to get a better view of the data

data1 <- data_book$get_data_frame(data_name="data1")
last_graph <- data_book$graph_one_variable(data_name="data1", columns=c("y","z","normal","normal1","normal2","poisson","poisson100"), data=data1, numeric="geom_boxplot", categorical="geom_bar")
data_book$add_object(data_name="data1", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="data1", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "data1"))


# Generating random samples from data in a survey

data2 <- wakefield::r_data_theme(n = 100, data_theme = "the_works")
data_book$import_data(data_tables=list(data2=data2))

rm(data2)


# Using the Calculator and the wakefield package to add individual variables to an existing data frame

data1 <- data_book$get_data_frame(data_name="data1", use_current_filter=FALSE)
attach(what=data1)
scalars <- data_book$get_scalars(data_name="data1")
attach(what=scalars)
pets <- wakefield::pet(n=nrow(x=data1), x=c("Dog", "Cat", "None", "Bird", "Horse"), prob=c(0.365, 0.304, 0.258, 0.031, 0.015), name="Pet")
data_book$add_columns_to_data(data_name="data1", col_name="pets", col_data=pets, before=FALSE)

detach(name=data1, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data1", col_names="pets", property="labels", new_val="")
rm(list=c("pets", "data1", "scalars"))


# Using the Calculator and the wakefield package to add individual variables to an existing data frame

data1 <- data_book$get_data_frame(data_name="data1", use_current_filter=FALSE)
attach(what=data1)
scalars <- data_book$get_scalars(data_name="data1")
attach(what=scalars)
age <- wakefield::age(n=300, x=0:25, prob=NULL, name="Age")
data_book$add_columns_to_data(data_name="data1", col_name="age", col_data=age, before=FALSE)

detach(name=data1, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data1", col_names="age", property="labels", new_val="")
rm(list=c("age", "data1", "scalars"))

