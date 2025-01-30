## Entering a constant column in R-Instat
# Produced on 29 January, 2025 on Version 0.8.1
# Entering a constant column from a New Data Frame

data <- data.frame(x1=as.numeric(rep(1, 10)), x2=as.character(rep("Apple", 10)))
data_book$import_data(data_tables=list(data=data))

rm(data)


# Entering a constant column by Inserting a Columns to an existing data frame

data_book$add_columns_to_data(data_name="data", before=FALSE, col_data="Pineapple", col_name="x3", use_col_name_as_prefix=TRUE)



# Entering a constant column by Inserting a Columns to an existing data frame

data_book$add_columns_to_data(data_name="data", before=FALSE, col_data="55", col_name="x4", use_col_name_as_prefix=TRUE)


# Right click menu: Convert Column(s) To Numeric

data_book$convert_column_to_type(data_name="data", col_names="x4", to_type="numeric", ignore_labels=TRUE)




# Using the powerful Enter dialog to enter a constant column in R-Instat

data <- data_book$get_data_frame(data_name="data")
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
x5 <- 15
data_book$add_columns_to_data(data_name="data", col_name="x5", col_data=x5, before=FALSE)

detach(unload=TRUE, name=data)
detach(name=scalars, unload=TRUE)
rm(list=c("x5", "data", "scalars"))


# Using the powerful Enter dialog to enter a string constant column in R-Instat

data <- data_book$get_data_frame(data_name="data")
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
x6 <- "Kenya"
data_book$add_columns_to_data(data_name="data", col_name="x6", col_data=x6, before=FALSE)

detach(unload=TRUE, name=data)
detach(name=scalars, unload=TRUE)
rm(list=c("x6", "data", "scalars"))
# Using the Calculator to enter a string constant column in R-Instat

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
x7 <- "Fruits"
data_book$add_columns_to_data(data_name="data", col_name="x7", col_data=x7, before=TRUE)

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="x7", property="labels", new_val="")
rm(list=c("x7", "data", "scalars"))
