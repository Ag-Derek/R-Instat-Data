## R-Instat Data Entry
# Produced on 29 January, 2025 on Version 0.8.1

##Simple data entry

# Opening a simple New Data Frame in R-Instat

data <- data.frame(x1=as.character(rep(NA, 14)), x2=as.character(rep(NA, 14)))
data_book$import_data(data_tables=list(data=data))

rm(data)


# Renaming Columns in R-Instat

data_book$rename_column_in_data(data_name="data", column_name="x1", type="single", new_val="mass", label="", case="snake", minlength=8)


# Renaming Columns in R-Instat

data_book$rename_column_in_data(data_name="data", column_name="x2", type="single", new_val="f", label="", case="snake", minlength=8)


# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="mass", rows="1", new_value=47)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="mass", rows="2", new_value=48)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="mass", rows="3", new_value=49)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="mass", rows="4", new_value=50)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="mass", rows="5", new_value=51)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="mass", rows="6", new_value=52)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="mass", rows="7", new_value=53)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="mass", rows="8", new_value=54)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="mass", rows="9", new_value=55)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="mass", rows="10", new_value=56)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="mass", rows="11", new_value=57)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="mass", rows="12", new_value=58)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="mass", rows="13", new_value=59)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="mass", rows="14", new_value=60)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="f", rows="1", new_value=2)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="f", rows="2", new_value=0)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="f", rows="3", new_value=1)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="f", rows="4", new_value=2)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="f", rows="5", new_value=3)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="f", rows="6", new_value=2)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="f", rows="7", new_value=5)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="f", rows="8", new_value=6)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="f", rows="9", new_value=7)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="f", rows="10", new_value=5)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="f", rows="11", new_value=3)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="f", rows="12", new_value=2)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="f", rows="13", new_value=1)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data", col_name="f", rows="14", new_value=1)

# Right click menu: Convert Column(s) To Numeric
data_book$convert_column_to_type(data_name="data", col_names="mass", to_type="numeric", ignore_labels=TRUE)

# Right click menu: Convert Column(s) To Numeric
data_book$convert_column_to_type(data_name="data", col_names="f", to_type="numeric", ignore_labels=TRUE)


# Checking the total frequency of the data via the R-Instat calculator

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
calc <- sum(f)
calc
data_book$add_scalar(data_name="data", scalar_name="calc", scalar_value=calc)
detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
rm(list=c("calc", "data", "scalars"))


## Organized Data entry

# Opening an Organized New Data Frame in R-Instat

data1 <- data.frame(mass=as.numeric(rep(seq(47,60), each=1, length.out=14)), f=as.numeric(rep(NA, 14)))
data_book$import_data(data_tables=list(data1=data1))

rm(data1)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="f", rows="1", new_value=2)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="f", rows="2", new_value=0)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="f", rows="3", new_value=1)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="f", rows="4", new_value=2)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="f", rows="5", new_value=3)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="f", rows="6", new_value=2)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="f", rows="7", new_value=5)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="f", rows="8", new_value=6)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="f", rows="9", new_value=7)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="f", rows="10", new_value=5)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="f", rows="11", new_value=3)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="f", rows="12", new_value=2)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="f", rows="13", new_value=1)

# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="f", rows="14", new_value=1)


## Data set 2 - Sleep Data

# Importing the sleep data from the mosaic package From the Library

utils::data(package="mosaic", X=Sleep)
data_book$import_data(data_tables=list(Sleep=Sleep))


# Opening an Organized New Data Frame for the sleep data  in R-Instat

sleep <- sjlabelled::set_label(x=data.frame(group=factor(rep(1,1000, 24), levels=c("sleep","caffeine")), words=as.integer(rep(NA, 24))), label=c("Treatment group","Number of words out of 24 recalled"))
data_book$import_data(data_tables=list(sleep=sleep))

rm(sleep)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="1", new_value=14)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="2", new_value=18)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="3", new_value=11)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="4", new_value=13)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="5", new_value=18)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="6", new_value=17)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="7", new_value=21)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="8", new_value=9)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="9", new_value=16)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="10", new_value=17)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="11", new_value=14)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="12", new_value=15)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="13", new_value=12)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="14", new_value=12)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="15", new_value=14)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="16", new_value=13)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="17", new_value=6)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="18", new_value=18)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="19", new_value=14)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="20", new_value=16)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="21", new_value=10)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="22", new_value=7)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="23", new_value=15)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="words", rows="24", new_value=10)

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="group", rows="1", new_value="sleep")

# Replace Value In Data
data_book$replace_value_in_data(data_name="sleep1", col_name="group", rows="13", new_value="caffeine")


# Replacing Values in R-Instat: Replacing NA with the value from above

data_book$replace_value_in_data(data_name="sleep1", col_names="group", old_is_missing=TRUE, locf=TRUE, from_last=FALSE)


# Using a Regular Sequence to enter the factor variable

regular <- rep(x=seq(from=1, to=2, by=1), each=12, length.out=24)
data_book$add_columns_to_data(data_name="sleep1", col_name="regular", col_data=regular, use_col_name_as_prefix=TRUE, before=FALSE)

rm(regular)

# Right click menu: Convert Column(s) To Factor

data_book$convert_column_to_type(data_name="sleep1", col_names="regular", to_type="factor")


# Changing the Labels for the factor variable

data_book$set_factor_levels(data_name="sleep1", col_name="regular", new_labels=c("sleep","caffeine"), new_levels=c(1,2))

