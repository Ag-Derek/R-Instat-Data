## A tidy calculation system practice

# Creating a New Data Frame in R-Instat

data <- data.frame(x1=as.numeric(rep(seq(1,1000), each=1, length.out=100)), x2=as.character(rep(NA, 100)))
data_book$import_data(data_tables=list(data=data))

rm(data)


## The R-Instat calculator
## A basic calculator

# Doing basic calculations with the R-Instat calculator

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
calc <- 3 + 5
calc
data_book$add_scalar(data_name="data", scalar_name="calc", scalar_value=calc)
detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
rm(list=c("calc", "data", "scalars"))


# Doing basic calculations with the R-Instat calculator

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
calc <- 3 ^ 5
calc
data_book$add_scalar(data_name="data", scalar_name="calc", scalar_value=calc)
detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
rm(list=c("calc", "data", "scalars"))


## A column calculator

# Using the R-Instat calculator to carry out column calculations: Producing a 5 times table

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
x2 <- x1 * 5
data_book$add_columns_to_data(data_name="data", col_name="x2", col_data=x2, before=FALSE)

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="x2", property="labels", new_val="")
rm(list=c("x2", "data", "scalars"))


# Using the R-Instat calculator to carry out column calculations: Producing powers of 5 values

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
power5 <- x1 ^5
data_book$add_columns_to_data(data_name="data", col_name="power5", col_data=power5, before=FALSE)

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="power5", property="labels", new_val="")
rm(list=c("power5", "data", "scalars"))


## The Maths Keyboard

# Using the R-Instat calculator maths keyboard to carry out column calculations finding squareroots

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
sqrt <- sqrt(x1 )
data_book$add_columns_to_data(data_name="data", col_name="sqrt", col_data=sqrt, before=FALSE)

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="sqrt", property="labels", new_val="")
rm(list=c("sqrt", "data", "scalars"))


## The Integer keyboard

# Using the R-Instat calculator integer keyboard to carry out column calculations finding divisors

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
divisors <- DescTools::Divisors(x1 )
data_book$add_columns_to_data(data_name="data", col_name="divisors", col_data=divisors, before=FALSE)

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="divisors", property="labels", new_val="")
rm(list=c("divisors", "data", "scalars"))


# Using the R-Instat calculator integer keyboard to carry out column calculations generating prime numbers

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
primes <- primes::generate_n_primes(n=nrow(x=data))
data_book$add_columns_to_data(data_name="data", col_name="primes", col_data=primes, before=FALSE)

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="primes", property="labels", new_val="")
rm(list=c("primes", "data", "scalars"))


# Using the R-Instat calculator integer keyboard to carry out column calculations generating abundant numbers

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


# Using the R-Instat calculator integer keyboard to carry out column calculations generating deficient numbers

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
deficient <- Zseq::Deficient(n=nrow(x=data), gmp=FALSE)
data_book$add_columns_to_data(data_name="data", col_name="deficient", col_data=deficient, before=FALSE)

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="deficient", property="labels", new_val="")
rm(list=c("deficient", "data", "scalars"))


# Using the R-Instat calculator integer keyboard to carry out column calculations generating fibonacci numbers

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
fibonacci <- Zseq::Fibonacci(n=nrow(x=data))
data_book$add_columns_to_data(data_name="data", col_name="fibonacci", col_data=fibonacci, before=FALSE, adjacent_column="x1")

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="fibonacci", property="labels", new_val="")
rm(list=c("fibonacci", "data", "scalars"))


## The basic keyboard

# Doing basic calculations to check the ratios of the fibonacci numbers

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
calc <- 13 / 8
calc
data_book$add_scalar(data_name="data", scalar_name="calc", scalar_value=calc)
detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
rm(list=c("calc", "data", "scalars"))


# Doin basic calculations to check the ratios of the fibonacci numbers

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
21 / 13
detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
rm(list=c("data", "scalars"))

# Doin basic calculations to check the ratios of the fibonacci numbers

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
calc <- 610 / 377
calc
data_book$add_scalar(data_name="data", scalar_name="calc", scalar_value=calc)
detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
rm(list=c("calc", "data", "scalars"))



#  Duplicating the fibonacci numbers Column and changing it's type to numeric 

fibonacci1 <- data_book$get_columns_from_data(data_name="data", col_names="fibonacci", use_current_filter=FALSE)
data_book$add_columns_to_data(data_name="data", col_name="fibonacci1", col_data=fibonacci1, before=FALSE, adjacent_column="fibonacci")

data_book$convert_column_to_type(data_name="data", col_names="fibonacci1", to_type="integer")
rm(fibonacci1)


## The transform keyboard
# Using the transform keyboard and the lag button

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
fibonacci2 <- dplyr::lag(fibonacci1 )
data_book$add_columns_to_data(data_name="data", col_name="fibonacci2", col_data=fibonacci2, before=FALSE, adjacent_column="fibonacci1")

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="fibonacci2", property="labels", new_val="")
rm(list=c("fibonacci2", "data", "scalars"))


## The basic keyboard
# Using the basic keyboard in the R-Instat calculator to generate the golden ratios

data <- data_book$get_data_frame(data_name="data", use_current_filter=FALSE)
attach(what=data)
scalars <- data_book$get_scalars(data_name="data")
attach(what=scalars)
golden <- fibonacci1 / fibonacci2
data_book$add_columns_to_data(data_name="data", col_name="golden", col_data=golden, before=FALSE, adjacent_column="fibonacci2")

detach(name=data, unload=TRUE)
detach(name=scalars, unload=TRUE)
data_book$append_to_variables_metadata(data_name="data", col_names="golden", property="labels", new_val="")
rm(list=c("golden", "data", "scalars"))


# Generating a line plot for the golden ratio

data <- data_book$get_data_frame(data_name="data")
last_graph <- ggplot2::ggplot(data=data, mapping=ggplot2::aes(y=golden, x=x1)) + ggplot2::geom_line(colour="blue", size=0.8) + ggplot2::geom_point() + theme_grey()
data_book$add_object(data_name="data", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="data", object_name="last_graph", as_file=TRUE)
rm(list=c("last_graph", "data"))


## You can often avoid this halfway calculator dialogue until you are comfortable with the simple use of R-Instat

# Using the Transform dialog instead to calculate squareroots

x1 <- data_book$get_columns_from_data(data_name="data", col_names="x1", use_current_filter=FALSE)
sqrt <- sqrt(x=x1)
data_book$add_columns_to_data(data_name="data", col_name="sqrt", col_data=sqrt, before=FALSE, adjacent_column="x1")

data_book$append_to_variables_metadata(data_name="data", col_names="sqrt", property="labels", new_val="")
rm(list=c("sqrt", "x1"))