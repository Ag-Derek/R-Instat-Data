## Fun with lists

## Animals lists

# Producing a list of dinosaurs

dinosaurs <- read_corpora(data=rcorpora::corpora("animals/dinosaurs"))
data_book$import_data(data_tables=list(dinosaurs=dinosaurs))

rm(dinosaurs)


# Using the Transform Text Column dialog to examine the length of dinosaurs names

list <- data_book$get_columns_from_data(data_name="dinosaurs", col_names="list", use_current_filter=FALSE)
length <- stringr::str_length(string=list)
data_book$add_columns_to_data(data_name="dinosaurs", col_name="length", col_data=length, before=FALSE, adjacent_column="list")

rm(list=c("length", "list"))


# Copying the Row Numbers into a column

row <- data_book$get_row_names(data_name="dinosaurs")
data_book$add_columns_to_data(data_name="dinosaurs", col_name="row", col_data=row, before=TRUE)

rm(row)


# Sorting the lengths of the names to find out the longest name

data_book$sort_dataframe(data_name="dinosaurs", col_names="length", decreasing=TRUE)


## Food lists

# Producing a list of bread and pastries

breads_and_pastries <- read_corpora(data=rcorpora::corpora("foods/breads_and_pastries"))
data_book$import_data(data_tables=list(breads_and_pastries=breads_and_pastries))

rm(breads_and_pastries)


# Producing a list of fruits

fruits <- read_corpora(data=rcorpora::corpora("foods/fruits"))
data_book$import_data(data_tables=list(fruits=fruits))

rm(fruits)


# Producing a list of vegetables

vegetables <- read_corpora(data=rcorpora::corpora("foods/vegetables"))
data_book$import_data(data_tables=list(vegetables=vegetables))

rm(vegetables)


#  Appending the food lists to create one data frame

food <- dplyr::bind_rows(data_book$get_data_frame(data_name=c("breads_and_pastries","fruits","vegetables")), .id="type")
data_book$import_data(data_tables=list(food=food))

rm(food)

# Right click menu: Convert Column(s) To Factor
data_book$convert_column_to_type(data_name="food", col_names="type", to_type="factor")


# Checking the Labels/Levels

data_book$set_factor_levels(data_name="food", col_name="type", new_labels=c("breads_and_pastries","fruits","vegetables"))


## Crossword Clues

# Producing a list of word clues

clues_four <- read_corpora(data=rcorpora::corpora("words/word_clues/clues_four"))
data_book$import_data(data_tables=list(clues_four=clues_four))

rm(clues_four)



# Using the Count in Factor the clue number for each word

variable2 <- data_book$get_columns_from_data(data_name="clues_four", col_names="variable2", use_current_filter=FALSE)
clue <- dae::fac.nested(nesting.fac=variable2)
data_book$add_columns_to_data(data_name="clues_four", col_name="clue", col_data=clue, before=FALSE, adjacent_column="variable2")

rm(list=c("clue", "variable2"))


# Using the Unstack dialog to make the data wider

clues_four <- data_book$get_data_frame(data_name="clues_four")
clues_four_unstacked <- tidyr::pivot_wider(data=clues_four  %>%  dplyr::select(clue, list, variable2), names_from=clue, values_from=list, names_prefix="clue")
data_book$import_data(data_tables=list(clues_four_unstacked=clues_four_unstacked))

rm(list=c("clues_four_unstacked", "clues_four"))


# Right click menu: Delete Row(s)
data_book$remove_rows_in_data(data_name="clues_four_unstacked", row_names="1")


# Replacing the missing Values with blanks

data_book$replace_value_in_data(data_name="clues_four_unstacked", col_names=c("clue1","clue2","clue3","clue4","clue5","clue6","clue7"), new_value="", old_is_missing=TRUE)