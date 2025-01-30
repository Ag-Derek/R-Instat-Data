## Different ways of entering a regular sequence in R-Instat
# Produced on 30 January, 2025 on Version 0.8.1
# Entering a regular sequence from a New Data Frame

data <- data.frame(x1=as.numeric(rep(seq(1,36), each=1, length.out=36)), x2=as.numeric(rep(seq(1,5), each=1, length.out=36)))
data_book$import_data(data_tables=list(data=data))

rm(data)

## The regular sequence dialog
# Generating a Regular Sequence using the regular sequence dialog in steps of 2

x3 <- rep(x=seq(from=1, to=36, by=2), each=1, length.out=36)
data_book$add_columns_to_data(data_name="data", col_name="x3", col_data=x3, before=FALSE)

rm(x3)

# Generating a Regular Sequence using the regular sequence dialog in steps of 1 repeating the values twice

x4 <- rep(x=seq(from=1, to=36, by=1), each=2, length.out=36)
data_book$add_columns_to_data(data_name="data", col_name="x4", col_data=x4, before=FALSE)

rm(x4)

# Generating a Regular Sequence using the regular sequence dialog from 36 down to 10 in steps of -2.5

x5 <- rep(x=seq(from=36, to=10, by=-2.5), each=1, length.out=36)
data_book$add_columns_to_data(data_name="data", col_name="x5", col_data=x5, before=FALSE)

rm(x5)


## The enter dialog

# Using the Enter dialog to generate a numeric regular sequence

data <- data_book$get_data_frame(data_name="data")
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
x6 <- seq(from = 1, to = 36, by = 2)
data_book$add_columns_to_data(data_name="data", col_name="x6", col_data=x6, before=FALSE)

detach(unload=TRUE, name=data)
detach(name=scalars, unload=TRUE)
rm(list=c("x6", "data", "scalars"))

# Using the Enter dialog to generate a numeric regular sequence 

data <- data_book$get_data_frame(data_name="data")
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
x7 <- seq(1,36,3 )
data_book$add_columns_to_data(data_name="data", col_name="x7", col_data=x7, before=FALSE)

detach(unload=TRUE, name=data)
detach(name=scalars, unload=TRUE)
rm(list=c("x7", "data", "scalars"))

# Using the Enter dialog to generate a numeric regular sequence 

data <- data_book$get_data_frame(data_name="data")
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
x8 <- seq(1,36,5 )
data_book$add_columns_to_data(data_name="data", col_name="x8", col_data=x8, before=FALSE)

detach(unload=TRUE, name=data)
detach(name=scalars, unload=TRUE)
rm(list=c("x8", "data", "scalars"))


# Using the Enter dialog to generate a numeric regular sequence 

data <- data_book$get_data_frame(data_name="data")
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
x8 <- rep(seq(1,36,5 ), length=36 )
data_book$add_columns_to_data(data_name="data", col_name="x8", col_data=x8, before=FALSE)

detach(unload=TRUE, name=data)
detach(name=scalars, unload=TRUE)
rm(list=c("x8", "data", "scalars"))

# Using the Regular Sequence dialog to generate a numeric regular sequence in steps of 5

x9 <- rep(x=seq(from=1, to=36, by=5), each=1, length.out=36)
data_book$add_columns_to_data(data_name="data", col_name="x9", col_data=x9, before=FALSE)

rm(x9)

## Non-numeric sequences


# Using the Enter dialog to generate a non-numeric regular sequence

data <- data_book$get_data_frame(data_name="data")
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
x10 <- month.abb
data_book$add_columns_to_data(data_name="data", col_name="x10", col_data=x10, before=FALSE)

detach(unload=TRUE, name=data)
detach(name=scalars, unload=TRUE)
rm(list=c("x10", "data", "scalars"))


# Using the Enter dialog to generate a non-numeric regular sequence

data <- data_book$get_data_frame(data_name="data")
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
x11 <- letters
data_book$add_columns_to_data(data_name="data", col_name="x11", col_data=x11, before=FALSE)

detach(unload=TRUE, name=data)
detach(name=scalars, unload=TRUE)
rm(list=c("x11", "data", "scalars"))


# Using the Enter dialog to generate a non-numeric regular sequence

data <- data_book$get_data_frame(data_name="data")
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
x11 <- letters[1:4]
data_book$add_columns_to_data(data_name="data", col_name="x11", col_data=x11, before=FALSE)

detach(unload=TRUE, name=data)
detach(name=scalars, unload=TRUE)
rm(list=c("x11", "data", "scalars"))


# Using the Enter dialog to generate a non-numeric regular sequence

data <- data_book$get_data_frame(data_name="data")
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
x12 <- rep(letters, length=36)
data_book$add_columns_to_data(data_name="data", col_name="x12", col_data=x12, before=FALSE)

detach(unload=TRUE, name=data)
detach(name=scalars, unload=TRUE)
rm(list=c("x12", "data", "scalars"))


# Using the Enter dialog to generate a non-numeric regular sequence with our own words

data <- data_book$get_data_frame(data_name="data")
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
x13 <- c("Kenya","Uganda","Rwanda" )
data_book$add_columns_to_data(data_name="data", col_name="x13", col_data=x13, before=FALSE)

detach(unload=TRUE, name=data)
detach(name=scalars, unload=TRUE)
rm(list=c("x13", "data", "scalars"))
