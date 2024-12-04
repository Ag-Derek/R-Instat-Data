## Fun with Sequences
## This script will explore sequences. 

## Abundant numbers
# Understanding abundant numbers

# Creating a New Data Frame

data <- data.frame(x1=as.numeric(rep(seq(1,1000), each=1, length.out=500)))
data_book$import_data(data_tables=list(data=data))

rm(data)


# Generating abundant numbers using the R-Instat calculator and the integer keyboard

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
abundant <- Zseq::Abundant(n=nrow(x=data), gmp=FALSE)
data_book$add_columns_to_data(data_name="data", col_name="abundant", col_data=abundant, before=FALSE)

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="abundant", property="labels", new_val="")
rm(list=c("abundant", "data", "scalars"))



# Generating divisors for the abundant numbers using the R-Instat calculator and the integer keyboard

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
divisors <- DescTools::Divisors(abundant )
data_book$add_columns_to_data(data_name="data", col_name="divisors", col_data=divisors, before=FALSE)

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="divisors", property="labels", new_val="")
rm(list=c("divisors", "data", "scalars"))


## Calculating abundance


# Calculating the sum of the divisors using the R-Instat calculator and the list keyboard

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
sum <- sapply(  divisors ,sum)
data_book$add_columns_to_data(data_name="data", col_name="sum", col_data=sum, before=FALSE)

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="sum", property="labels", new_val="")
rm(list=c("sum", "data", "scalars"))



# Calculating abundance using the R-Instat calculator 

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
abundance <- sum / abundant
data_book$add_columns_to_data(data_name="data", col_name="abundance", col_data=abundance, before=FALSE)

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="abundance", property="labels", new_val="")
rm(list=c("abundance", "data", "scalars"))


## Super-abundant numbers


# Calculating max column of the abundances using the R-Instat calculator 

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
max <- cummax(abundance )
data_book$add_columns_to_data(data_name="data", col_name="max", col_data=max, before=FALSE)

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="max", property="labels", new_val="")
rm(list=c("max", "data", "scalars"))


# Calculating differences of the max column of the abundances using the R-Instat calculator 

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
diff <- c(NA,diff(x=max , lag = 1, differences = 1))
data_book$add_columns_to_data(data_name="data", col_name="diff", col_data=diff, before=FALSE)

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="diff", property="labels", new_val="")
rm(list=c("diff", "data", "scalars"))


# Editing a Cell in R-Instat

data_book$replace_value_in_data(data_name="data", col_name="diff", new_value=0.33, rows="1")


# Create Filter subdialog: Created new filter
data_book$add_filter(filter=list(C0=list(column="diff", operation=">", value=0)), data_name="data", filter_name="filter")


# Filtering out the superabundant numbers

data_book$set_current_filter(data_name="data", filter_name="filter")



# Creating a New Data Frame

data1 <- data.frame(x1=as.numeric(rep(seq(1,100000), each=1, length.out=100000)))
data_book$import_data(data_tables=list(data1=data1))

rm(data1)


# Generating divisors using the R-Instat calculator and the integer keyboard

data1 <- data_book$get_data_frame(data_name="data1", use_current_filter=FALSE)
attach(what=data1)
scalars <- data_book$get_scalars(data_name="data1")
attach(what=scalars)
divisor <- DescTools::Divisors(x1 )
data_book$add_columns_to_data(data_name="data1", col_name="divisor", col_data=divisor, before=FALSE)

detach(name=data1, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data1", col_names="divisor", property="labels", new_val="")
rm(list=c("divisor", "data1", "scalars"))



# Calculating the sum of divisors using the R-Instat calculator and the list keyboard

data1 <- data_book$get_data_frame(data_name="data1", use_current_filter=FALSE)
attach(what=data1)
scalars <- data_book$get_scalars(data_name="data1")
attach(what=scalars)
sum <- sapply(  divisor ,sum)  + x1
data_book$add_columns_to_data(data_name="data1", col_name="sum", col_data=sum, before=FALSE)

detach(name=data1, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data1", col_names="sum", property="labels", new_val="")
rm(list=c("sum", "data1", "scalars"))



# Calculating the relative abundance 

data1 <- data_book$get_data_frame(data_name="data1", use_current_filter=FALSE)
attach(what=data1)
scalars <- data_book$get_scalars(data_name="data1")
attach(what=scalars)
abundance <- sum / x1
data_book$add_columns_to_data(data_name="data1", col_name="abundance", col_data=abundance, before=FALSE)

detach(name=data1, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data1", col_names="abundance", property="labels", new_val="")
rm(list=c("abundance", "data1", "scalars"))


# Calculating the cumulative maxima

data1 <- data_book$get_data_frame(data_name="data1", use_current_filter=FALSE)
attach(what=data1)
scalars <- data_book$get_scalars(data_name="data1")
attach(what=scalars)
max <- cummax(abundance )
data_book$add_columns_to_data(data_name="data1", col_name="max", col_data=max, before=FALSE)

detach(name=data1, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data1", col_names="max", property="labels", new_val="")
rm(list=c("max", "data1", "scalars"))



# Calculating the differences of the cumulative maxima

data1 <- data_book$get_data_frame(data_name="data1", use_current_filter=FALSE)
attach(what=data1)
scalars <- data_book$get_scalars(data_name="data1")
attach(what=scalars)
super <- c(NA,diff(x=max , lag = 1, differences = 1)) > 0
data_book$add_columns_to_data(data_name="data1", col_name="super", col_data=super, before=FALSE)

detach(name=data1, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data1", col_names="super", property="labels", new_val="")
rm(list=c("super", "data1", "scalars"))


# Replace Value In Data
data_book$replace_value_in_data(data_name="data1", col_name="super", rows="1", new_value=TRUE)


# Create Filter subdialog: Created new filter
data_book$add_filter(filter=list(C0=list(column="super", operation="==", value=TRUE)), data_name="data1", filter_name="filter")


# Filtering out the superabundant numbers

data_book$set_current_filter(data_name="data1", filter_name="filter")


# Finding the count of divisors for the super-abundant numbers

data1 <- data_book$get_data_frame(data_name="data1", use_current_filter=FALSE)
attach(what=data1)
scalars <- data_book$get_scalars(data_name="data1")
attach(what=scalars)
count <- sapply(  divisor ,length)
data_book$add_columns_to_data(data_name="data1", col_name="count", col_data=count, before=FALSE)

detach(name=data1, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data1", col_names="count", property="labels", new_val="")
rm(list=c("count", "data1", "scalars"))