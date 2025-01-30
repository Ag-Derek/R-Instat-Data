## R-Instat Checking Data
#Produced on 29 January, 2025 on Version 0.8.1
# Importing the sleep data from the mosaic package From Library

utils::data(package="mosaic", X=Sleep)
data_book$import_data(data_tables=list(Sleep=Sleep))


# Creatimg a column for the Row Numbers in R-Insat

row <- data_book$get_row_names(data_name="Sleep")
data_book$add_columns_to_data(data_name="Sleep", col_name="row", col_data=row, before=TRUE)
row <- Hmisc::all.is.numeric(data_book$get_columns_from_data(data_name="Sleep", col_names="row"), what=c("vector"))
data_book$add_columns_to_data(data_name="Sleep", col_name="row", col_data=row, before=TRUE)

data_book$add_key(data_name="Sleep", col_names="row")
rm(row)

## Checking data


# Using the One Variable Summarise dialog to find the column summaries

Sleep <- data_book$get_data_frame(data_name="Sleep")
last_summary <- summary(data=Sleep, object=data_book$get_columns_from_data(data_name="Sleep", col_names=c("row","Group","Words")), maxsum=12, na.rm=FALSE)
data_book$add_object(data_name="Sleep", object_name="last_summary", object_type_label="summary", object_format="text", object=last_summary)
data_book$get_object_data(data_name="Sleep", object_name="last_summary", as_file=TRUE)
rm(list=c("last_summary", "Sleep"))

# Right click menu: Convert Column(s) To Factor

data_book$convert_column_to_type(data_name="Sleep", col_names="Group", to_type="factor")



# Using the One Variable Summarise dialog to find the column summaries

Sleep <- data_book$get_data_frame(data_name="Sleep")
last_summary <- summary(data=Sleep, object=data_book$get_columns_from_data(data_name="Sleep", col_names=c("row","Group","Words")), maxsum=12, na.rm=FALSE)
data_book$add_object(data_name="Sleep", object_name="last_summary", object_type_label="summary", object_format="text", object=last_summary)
data_book$get_object_data(data_name="Sleep", object_name="last_summary", as_file=TRUE)
rm(list=c("last_summary", "Sleep"))


# Inserting a new Column in R-Instat

data_book$add_columns_to_data(data_name="Sleep", before=FALSE, col_data=NA, col_name="words2", use_col_name_as_prefix=TRUE)


# Using Column Selection to hide the original data

data_book$set_current_column_selection(data_name="Sleep", name="selection")

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="1", new_value=14)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="2", new_value=18)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="3", new_value=11)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="4", new_value=13)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="5", new_value=18)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="6", new_value=16)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="7", new_value=21)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="8", new_value=9)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="9", new_value=16)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="10", new_value=17)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="11", new_value=14)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="12", new_value=15)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="13", new_value=12)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="14", new_value=12)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="15", new_value=14)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="16", new_value=13)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="17", new_value=6)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="18", new_value=18)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="19", new_value=13)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="20", new_value=16)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="21", new_value=10)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="22", new_value=7)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="23", new_value=15)

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="24", new_value=10)

# Right click menu: Remove Current Column Selection
data_book$remove_current_column_selection(data_name="Sleep")

#  Comparing Columns in R-Instat to see if they are identical

Sleep.Words <- data_book$get_columns_from_data(data_name="Sleep", col_names="Words")
Sleep.words2 <- data_book$get_columns_from_data(data_name="Sleep", col_names="words2")
compare <- abs(x=Sleep.Words - Sleep.words2) <= 0
data_book$add_columns_to_data(data_name="Sleep", col_name="compare", col_data=compare, before=FALSE, adjacent_column="words2")
summary(object=data_book$get_columns_from_data(data_name="Sleep", col_names="compare"))
rm(list=c("compare", "Sleep.Words", "Sleep.words2"))

# Create Filter subdialog: Created new filter
data_book$add_filter(filter=list(C0=list(column="compare", operation="==", value=FALSE)), data_name="Sleep", filter_name="filter")

# Filtering out the unidentical rows

data_book$set_current_filter(data_name="Sleep", filter_name="filter")

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="6", new_value=17)


# Adding a Comment to report about the corrections

data_book$add_new_comment(data_name="Sleep", row="6", column="words2", comment="17 mistakenly typed as 16")

# Replace Value In Data
data_book$replace_value_in_data(data_name="Sleep", col_name="words2", rows="19", new_value=14)


# Adding a Comment to report about the corrections

data_book$add_new_comment(data_name="Sleep", row="19", column="words2", comment="14 mistakenly typed as 13")

# Right click menu: Remove Current Filter

data_book$remove_current_filter(data_name="Sleep")
