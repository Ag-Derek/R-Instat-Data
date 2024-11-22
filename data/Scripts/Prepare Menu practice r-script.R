# Prepare menu practice r-script

# Importing the 2013 stats data of garuoua dataset to preview
# Export the data frame to an Excel file in the user's Documents directory
# Current working directory
current_dir <- getwd()

# Construct the desired file path
file_path <- file.path(dirname(dirname(current_dir)), "Library", "Climatic","Cameroon", "garoua_1999_tr.xlsx") 

# Importing the Dodoma Dataset into R-Instat

X2013Stats <- rio::import(file=file_path, guess_max=Inf, which=1)
data_book$import_data(data_tables=list(X2013Stats=X2013Stats))
# Delete the 2013 stats data frame so that it can be imported again in the right format

data_book$delete_dataframes(data_names="X2013Stats")


# Importing the garoua_1999_tr dataset into R-Instat with a specified number of rows to import
current_dir <- getwd()

# Construct the desired file path
file_path <- file.path(dirname(dirname(current_dir)), "Library", "Climatic","Cameroon", "garoua_1999_tr.xlsx") 

garoua_1999_tr_list <- rio::import_list(file = file_path, guess_max = Inf, na = c("", ""), n_max = 31)
data_book$import_data(data_tables=garoua_1999_tr_list, data_names=c("X2013.Stats", "X2012.Stats", "X2011.Stats", "X2010.Stats", "X2009.Stats", "X2008.Stats", "X2007.Stats", "X2006.Sats", "X2005.Stats", "X2004.Stats", "X2003.Stats", "X2002.Stats", "X2001.Stats", "X2000.Stats", "X1999.Stats"))

rm(garoua_1999_tr)


# Putting all the data sheets together by appending them to achieve a more systematic and reliable way to tidy the data

append <- dplyr::bind_rows(data_book$get_data_frame(data_name=c("X2013.Stats","X2012.Stats","X2011.Stats","X2010.Stats","X2009.Stats","X2008.Stats","X2007.Stats","X2006.Sats","X2005.Stats","X2004.Stats","X2003.Stats","X2002.Stats","X2001.Stats","X2000.Stats","X1999.Stats")), .id="id")
data_book$import_data(data_tables=list(append=append))

rm(append)


# Transforming the text column to extract the year

id <- data_book$get_columns_from_data(data_name="append", col_names="id", use_current_filter=FALSE)
year <- stringr::str_sub(string=id, start=2, end=5)
data_book$add_columns_to_data(data_name="append", col_name="year", col_data=year, before=FALSE, adjacent_column="id")

rm(list=c("year", "id"))


# Rename the "date" column to day
data_book$rename_column_in_data(data_name="append", column_name="Date", new_val="day", label="")


# Stacking the months to go down rather than across

append <- data_book$get_data_frame(data_name="append")
append_stacked <- tidyr::pivot_longer(append  %>%  dplyr::select(January, February, March, April, May, June, July, August, September, October, November, December, year, day), cols=c("January","February","March","April","May","June","July","August","September","October","November","December"), names_to="month",  values_to="rain")
data_book$import_data(data_tables=list(append_stacked=append_stacked))

rm(list=c("append_stacked", "append"))


# Making a date variable

date <- data_book$make_date_yearmonthday(data_name="append_stacked", day="day", month="month", year="year", year_format="%Y", month_format="%B")
data_book$add_columns_to_data(data_name="append_stacked", col_name="date", col_data=date, before=TRUE, adjacent_column="year")

rm(date)


# Create Filter subdialog: Created new filter
data_book$add_filter(filter=list(C0=list(column="date", operation="is.na")), data_name="append_stacked", filter_name="filter")


# Filtering the date column to find missing dates

data_book$set_current_filter(data_name="append_stacked", filter_name="filter")


# Right click menu: Delete Row(s)
data_book$remove_rows_in_data(data_name="append_stacked", row_names=c("338","350","362","364","366","369","371","722","734","736","738","741","743","1082","1094","1106","1108","1110","1113","1115","1454","1466","1478","1480","1482","1485","1487","1826","1838","1850","1852","1854","1857","1859","2210","2222","2224","2226","2229","2231","2570","2582","2594","2596","2598","2601","2603","2942","2954","2966","2968","2970","2973","2975","3314","3326","3338","3340","3342","3345","3347","3698","3710","3712","3714","3717","3719","4058","4070","4082","4084","4086","4089","4091","4430","4442","4454","4456","4458","4461","4463","4802","4814","4826","4828","4830","4833","4835","5186","5198","5200","5202","5205","5207","5546","5558","5570","5572","5574","5577","5579"))


# Right click menu: Remove Current Filter
data_book$remove_current_filter(data_name="append_stacked")


# Sorting the date column to make it into the right order

data_book$sort_dataframe(data_name="append_stacked", col_names="date")

# Right click menu: Convert Column(s) To Numeric
data_book$convert_column_to_type(data_name="append_stacked", col_names="year", to_type="numeric", ignore_labels=TRUE)

# Right click menu: Convert Column(s) To Factor
data_book$convert_column_to_type(data_name="append_stacked", col_names="month", to_type="factor")


# Using the One Variable Summarise dialog to check the data

append_stacked <- data_book$get_data_frame(data_name="append_stacked")
last_summary <- summary(data=append_stacked, object=data_book$get_columns_from_data(data_name="append_stacked", col_names=c("date","year","day","month","rain")), maxsum=12, na.rm=FALSE)
data_book$add_object(data_name="append_stacked", object_name="last_summary", object_type_label="summary", object_format="text", object=last_summary)
data_book$get_object_data(data_name="append_stacked", object_name="last_summary", as_file=TRUE)
rm(list=c("last_summary", "append_stacked"))


# Generating a rainday column

rain <- data_book$get_columns_from_data(data_name="append_stacked", col_names="rain", use_current_filter=FALSE)
rainday <- rain >= 1
data_book$add_columns_to_data(data_name="append_stacked", col_name="rainday", col_data=rainday, before=FALSE, adjacent_column="rain")

data_book$append_to_variables_metadata(data_name="append_stacked", col_names="rainday", property="labels", new_val="")
rm(list=c("rainday", "rain"))


# Using the Column Summaries dialog to make the annual rainfall summaries

data_book$calculate_summary(data_name="append_stacked", columns_to_summarise=c("rain","rainday"), factors="year", store_results=TRUE, j=1, summaries=c("summary_count_non_missing", "summary_sum"), silent=TRUE)


# Using the Column Summaries dialog to make the annual rainfall summaries without the missing values

data_book$calculate_summary(data_name="append_stacked", columns_to_summarise=c("rain","rainday"), factors="year", store_results=TRUE, na.rm=TRUE, na_type=c(), j=1, summaries=c("summary_count_non_missing", "summary_sum"), silent=TRUE)


# Using the Column Summaries dialog to find the maximum daily rainfall yearly

data_book$calculate_summary(data_name="append_stacked", columns_to_summarise="rain", factors="year", store_results=TRUE, na.rm=TRUE, na_type=c(), j=1, summaries=c("summary_count_non_missing", "summary_max", "summary_sum"), silent=TRUE)


# Using the Column Summaries dialog to find the maximum daily rainfall monthly

data_book$calculate_summary(data_name="append_stacked", columns_to_summarise="rain", store_results=TRUE, factors=c("year","month"), na.rm=TRUE, na_type=c(), j=1, summaries=c("summary_count_non_missing", "summary_max", "summary_sum"), silent=TRUE)


# Using the Column Summaries dialog to find the sumof the raindays monthly

data_book$calculate_summary(data_name="append_stacked", columns_to_summarise=c("rain","rainday"), store_results=TRUE, factors=c("year","month"), na.rm=TRUE, na_type=c(), j=1, summaries=c("summary_sum"), silent=TRUE)


# Sorting the year column to organize the data by year

data_book$sort_dataframe(data_name="append_stacked_by_year_month", col_names="year")


# Save the data for later use

saveRDS(file=file.path(Sys.getenv("USERPROFILE"), "Documents", "garoua.RDS"), object=data_book)


# Exporting datasets as Excel files

rio::export(x = data_book$get_data_frame(data_name = "append_stacked"),file = file.path(Sys.getenv("USERPROFILE"), "Documents", "append_stacked.xlsx"))
rio::export(x = data_book$get_data_frame(data_name = "append_stacked_by_year"),file = file.path(Sys.getenv("USERPROFILE"), "Documents", "append_stacked_by_year.xlsx"))
rio::export( x = data_book$get_data_frame(data_name="append_stacked_by_year_month"), file = file.path(Sys.getenv("USERPROFILE"), "Documents", "append_stacked_by_year_month.xlsx"))

# Renaming the append_stacked Data Frame

data_book$rename_dataframe(data_name="append_stacked", new_value="garoua", label="")


# Renaming the append_stacked_by_year Data Frame

data_book$rename_dataframe(data_name="append_stacked_by_year", new_value="garoua_by_year", label="")


# Renaming the append_stacked_by_year_by_month Data Frame

data_book$rename_dataframe(data_name="append_stacked_by_year_month", new_value="garouar_month", label="")


# File > Save: save file
saveRDS(file=file.path(Sys.getenv("USERPROFILE"), "Documents", "garoua.RDS"), object=data_book)



# Adding a  comment to make a report about the data

data_book$add_new_comment(data_name="garoua_by_year", row="2", column="sum_rainday", comment="Missing value on February 29th in each leap year.")


# Adding a  comment to make a report about the data

data_book$add_new_comment(data_name="garoua_by_year", row="8", column="sum_rainday", comment="31st September was wrongly identified as having rainfall and September has 30 days")
