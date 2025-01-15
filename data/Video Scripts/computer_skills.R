# Script produced on 23 November 2024 using R-Instat Version 0.8.0.
## Computer skills for R-Instat r-script practical
## Getting started in R-Instat

# Creating a new data frame in R-Instat: Entering data

data <- data.frame(x1=as.numeric(rep(seq(1,1000), each=1, length.out=10)), x2=as.character(rep(NA, 10)))
data_book$import_data(data_tables=list(data=data))

rm(data)


# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data", col_name="x2", rows="1", new_value=2)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data", col_name="x2", rows="2", new_value=6)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data", col_name="x2", rows="3", new_value=10)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data", col_name="x2", rows="4", new_value=14)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data", col_name="x2", rows="5", new_value=22)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data", col_name="x2", rows="6", new_value=16)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data", col_name="x2", rows="7", new_value=9)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data", col_name="x2", rows="8", new_value=4)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data", col_name="x2", rows="9", new_value=2)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data", col_name="x2", rows="10", new_value=-5)


# Summarizing data in R-Instat using the one variable summarise dialog

data <- data_book$get_data_frame(data_name="data")
last_summary <- summary(data=data, object=data_book$get_columns_from_data(data_name="data", col_names=c("x1","x2")), maxsum=12, na.rm=FALSE)
data_book$add_object(data_name="data", object_name="last_summary", object_type_label="summary", object_format="text", object=last_summary)
data_book$get_object_data(data_name="data", object_name="last_summary", as_file=TRUE)
rm(list=c("last_summary", "data"))


# Right click menu: Converting a character column to a numeric column
data_book$convert_column_to_type(data_name="data", col_names="x2", to_type="numeric", ignore_labels=TRUE)


# Summarizing data in R-Instat using the one variable summarise dialog 

data <- data_book$get_data_frame(data_name="data")
last_summary <- summary(data=data, object=data_book$get_columns_from_data(data_name="data", col_names=c("x1","x2")), maxsum=12, na.rm=FALSE)
data_book$add_object(data_name="data", object_name="last_summary", object_type_label="summary", object_format="text", object=last_summary)
data_book$get_object_data(data_name="data", object_name="last_summary", as_file=TRUE)
rm(list=c("last_summary", "data"))


## Making a mistake when entering your data

# Creating a new data frame in R-Instat

data1 <- data.frame(x1=as.numeric(rep(seq(1,1000), each=1, length.out=10)), x2=as.character(rep(NA, 10)))
data_book$import_data(data_tables=list(data1=data1))

rm(data1)


# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data1", col_name="x2", rows="1", new_value=2)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data1", col_name="x2", rows="2", new_value=6)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data1", col_name="x2", rows="3", new_value="1o")

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data1", col_name="x2", rows="4", new_value=14)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data1", col_name="x2", rows="5", new_value=22)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data1", col_name="x2", rows="6", new_value=16)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data1", col_name="x2", rows="7", new_value=9)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data1", col_name="x2", rows="8", new_value=4)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data1", col_name="x2", rows="9", new_value=2)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data1", col_name="x2", rows="10", new_value=-5)

# Right click menu: Convert Column(s) To Numeric
data_book$convert_column_to_type(data_name="data1", col_names="x2", to_type="numeric", ignore_labels=TRUE)


# Summarizing data in R-Instat using the one variable summarise dialog when there is a missing value

data1 <- data_book$get_data_frame(data_name="data1")
last_summary <- summary(data=data1, object=data_book$get_columns_from_data(data_name="data1", col_names=c("x1","x2")), maxsum=12, na.rm=FALSE)
data_book$add_object(data_name="data1", object_name="last_summary", object_type_label="summary", object_format="text", object=last_summary)
data_book$get_object_data(data_name="data1", object_name="last_summary", as_file=TRUE)
rm(list=c("last_summary", "data1"))


## Saving data in R-Instat
# Saving the data for later use to an RDS file in the user's Documents directory

saveRDS(file=file.path(Sys.getenv("USERPROFILE"), "Documents", "computer_skills.RDS"), object=data_book)

## Changing names in new data frames
## Entering the data with a nonnumeric value after defining the column as numeric 

# Creating a new data frame in R-Instat

test <- data.frame(x1=as.numeric(rep(seq(1,1000), each=1, length.out=10)), max_temp=as.numeric(rep(NA, 10)))
data_book$import_data(data_tables=list(test=test))

rm(test)


# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="test", col_name="max_temp", rows="1", new_value=2)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="test", col_name="max_temp", rows="2", new_value=6)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="test", col_name="max_temp", rows="3", new_value=10)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="test", col_name="max_temp", rows="4", new_value=14)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="test", col_name="max_temp", rows="5", new_value=22)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="test", col_name="max_temp", rows="6", new_value=16)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="test", col_name="max_temp", rows="7", new_value=9)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="test", col_name="max_temp", rows="8", new_value=4)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="test", col_name="max_temp", rows="9", new_value=2)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="test", col_name="max_temp", rows="10", new_value=-5)


## More on the right click menu

# Renaming Columns in R-Instat via the right-click menu

data_book$rename_column_in_data(data_name="test", column_name="x1", new_val="row", label="")


# Renaming Columns in R-Instat via the right-click menu

data_book$rename_column_in_data(data_name="test", column_name="max_temp", new_val="maxtemp", label="")


# Sorting data in ascending order in R-Instat via the right-click menu

data_book$sort_dataframe(data_name="test", col_names="maxtemp")


# Sorting data in ascending order in R-Instat via the right-click menu

data_book$sort_dataframe(data_name="test", col_names="row")


## Adding ranks in R-Instat

# Using the transform dialog to add a rank in R-Instat

maxtemp <- data_book$get_columns_from_data(data_name="test", col_names="maxtemp", use_current_filter=FALSE)
maxtemp1 <- rank(maxtemp)
data_book$add_columns_to_data(data_name="test", col_name="maxtemp1", col_data=maxtemp1, before=FALSE, adjacent_column="maxtemp")

rm(list=c("maxtemp1", "maxtemp"))

# Right click menu: Deleting columns in R-Instat
data_book$remove_columns_in_data(data_name="test", cols="maxtemp1")


## A big data frame in R-Instat

# Creating a new data frame in R-Instat

test2 <- data.frame(x1=as.numeric(rep(seq(1,1000), each=1, length.out=50000)), x2=as.character(rep(NA, 50000)), x3=as.character(rep(NA, 50000)), x4=as.character(rep(NA, 50000)), x5=as.character(rep(NA, 50000)), x6=as.character(rep(NA, 50000)), x7=as.character(rep(NA, 50000)), x8=as.character(rep(NA, 50000)), x9=as.character(rep(NA, 50000)), x10=as.character(rep(NA, 50000)), x11=as.character(rep(NA, 50000)), x12=as.character(rep(NA, 50000)), x13=as.character(rep(NA, 50000)), x14=as.character(rep(NA, 50000)), x15=as.character(rep(NA, 50000)), x16=as.character(rep(NA, 50000)), x17=as.character(rep(NA, 50000)), x18=as.character(rep(NA, 50000)), x19=as.character(rep(NA, 50000)), x20=as.character(rep(NA, 50000)), x21=as.character(rep(NA, 50000)), x22=as.character(rep(NA, 50000)), x23=as.character(rep(NA, 50000)), x24=as.character(rep(NA, 50000)), x25=as.character(rep(NA, 50000)), x26=as.character(rep(NA, 50000)), x27=as.character(rep(NA, 50000)), x28=as.character(rep(NA, 50000)), x29=as.character(rep(NA, 50000)), x30=as.character(rep(NA, 50000)), x31=as.character(rep(NA, 50000)), x32=as.character(rep(NA, 50000)), x33=as.character(rep(NA, 50000)), x34=as.character(rep(NA, 50000)), x35=as.character(rep(NA, 50000)), x36=as.character(rep(NA, 50000)), x37=as.character(rep(NA, 50000)), x38=as.character(rep(NA, 50000)), x39=as.character(rep(NA, 50000)), x40=as.character(rep(NA, 50000)), x41=as.character(rep(NA, 50000)), x42=as.character(rep(NA, 50000)), x43=as.character(rep(NA, 50000)), x44=as.character(rep(NA, 50000)), x45=as.character(rep(NA, 50000)), x46=as.character(rep(NA, 50000)), x47=as.character(rep(NA, 50000)), x48=as.character(rep(NA, 50000)), x49=as.character(rep(NA, 50000)), x50=as.character(rep(NA, 50000)), x51=as.character(rep(NA, 50000)), x52=as.character(rep(NA, 50000)), x53=as.character(rep(NA, 50000)), x54=as.character(rep(NA, 50000)), x55=as.character(rep(NA, 50000)), x56=as.character(rep(NA, 50000)), x57=as.character(rep(NA, 50000)), x58=as.character(rep(NA, 50000)), x59=as.character(rep(NA, 50000)), x60=as.character(rep(NA, 50000)), x61=as.character(rep(NA, 50000)), x62=as.character(rep(NA, 50000)), x63=as.character(rep(NA, 50000)), x64=as.character(rep(NA, 50000)), x65=as.character(rep(NA, 50000)), x66=as.character(rep(NA, 50000)), x67=as.character(rep(NA, 50000)), x68=as.character(rep(NA, 50000)), x69=as.character(rep(NA, 50000)), x70=as.character(rep(NA, 50000)), x71=as.character(rep(NA, 50000)), x72=as.character(rep(NA, 50000)), x73=as.character(rep(NA, 50000)), x74=as.character(rep(NA, 50000)), x75=as.character(rep(NA, 50000)), x76=as.character(rep(NA, 50000)), x77=as.character(rep(NA, 50000)), x78=as.character(rep(NA, 50000)), x79=as.character(rep(NA, 50000)), x80=as.character(rep(NA, 50000)), x81=as.character(rep(NA, 50000)), x82=as.character(rep(NA, 50000)), x83=as.character(rep(NA, 50000)), x84=as.character(rep(NA, 50000)), x85=as.character(rep(NA, 50000)), x86=as.character(rep(NA, 50000)), x87=as.character(rep(NA, 50000)), x88=as.character(rep(NA, 50000)), x89=as.character(rep(NA, 50000)), x90=as.character(rep(NA, 50000)), x91=as.character(rep(NA, 50000)), x92=as.character(rep(NA, 50000)), x93=as.character(rep(NA, 50000)), x94=as.character(rep(NA, 50000)), x95=as.character(rep(NA, 50000)), x96=as.character(rep(NA, 50000)), x97=as.character(rep(NA, 50000)), x98=as.character(rep(NA, 50000)), x99=as.character(rep(NA, 50000)), x100=as.character(rep(NA, 50000)), x101=as.character(rep(NA, 50000)), x102=as.character(rep(NA, 50000)), x103=as.character(rep(NA, 50000)), x104=as.character(rep(NA, 50000)), x105=as.character(rep(NA, 50000)), x106=as.character(rep(NA, 50000)), x107=as.character(rep(NA, 50000)), x108=as.character(rep(NA, 50000)), x109=as.character(rep(NA, 50000)), x110=as.character(rep(NA, 50000)), x111=as.character(rep(NA, 50000)), x112=as.character(rep(NA, 50000)), x113=as.character(rep(NA, 50000)), x114=as.character(rep(NA, 50000)), x115=as.character(rep(NA, 50000)), x116=as.character(rep(NA, 50000)), x117=as.character(rep(NA, 50000)), x118=as.character(rep(NA, 50000)), x119=as.character(rep(NA, 50000)), x120=as.character(rep(NA, 50000)), x121=as.character(rep(NA, 50000)), x122=as.character(rep(NA, 50000)), x123=as.character(rep(NA, 50000)), x124=as.character(rep(NA, 50000)), x125=as.character(rep(NA, 50000)), x126=as.character(rep(NA, 50000)), x127=as.character(rep(NA, 50000)), x128=as.character(rep(NA, 50000)), x129=as.character(rep(NA, 50000)), x130=as.character(rep(NA, 50000)), x131=as.character(rep(NA, 50000)), x132=as.character(rep(NA, 50000)), x133=as.character(rep(NA, 50000)), x134=as.character(rep(NA, 50000)), x135=as.character(rep(NA, 50000)), x136=as.character(rep(NA, 50000)), x137=as.character(rep(NA, 50000)), x138=as.character(rep(NA, 50000)), x139=as.character(rep(NA, 50000)), x140=as.character(rep(NA, 50000)), x141=as.character(rep(NA, 50000)), x142=as.character(rep(NA, 50000)), x143=as.character(rep(NA, 50000)), x144=as.character(rep(NA, 50000)), x145=as.character(rep(NA, 50000)), x146=as.character(rep(NA, 50000)), x147=as.character(rep(NA, 50000)), x148=as.character(rep(NA, 50000)), x149=as.character(rep(NA, 50000)), x150=as.character(rep(NA, 50000)), x151=as.character(rep(NA, 50000)), x152=as.character(rep(NA, 50000)), x153=as.character(rep(NA, 50000)), x154=as.character(rep(NA, 50000)), x155=as.character(rep(NA, 50000)), x156=as.character(rep(NA, 50000)), x157=as.character(rep(NA, 50000)), x158=as.character(rep(NA, 50000)), x159=as.character(rep(NA, 50000)), x160=as.character(rep(NA, 50000)), x161=as.character(rep(NA, 50000)), x162=as.character(rep(NA, 50000)), x163=as.character(rep(NA, 50000)), x164=as.character(rep(NA, 50000)), x165=as.character(rep(NA, 50000)), x166=as.character(rep(NA, 50000)), x167=as.character(rep(NA, 50000)), x168=as.character(rep(NA, 50000)), x169=as.character(rep(NA, 50000)), x170=as.character(rep(NA, 50000)), x171=as.character(rep(NA, 50000)), x172=as.character(rep(NA, 50000)), x173=as.character(rep(NA, 50000)), x174=as.character(rep(NA, 50000)), x175=as.character(rep(NA, 50000)), x176=as.character(rep(NA, 50000)), x177=as.character(rep(NA, 50000)), x178=as.character(rep(NA, 50000)), x179=as.character(rep(NA, 50000)), x180=as.character(rep(NA, 50000)), x181=as.character(rep(NA, 50000)), x182=as.character(rep(NA, 50000)), x183=as.character(rep(NA, 50000)), x184=as.character(rep(NA, 50000)), x185=as.character(rep(NA, 50000)), x186=as.character(rep(NA, 50000)), x187=as.character(rep(NA, 50000)), x188=as.character(rep(NA, 50000)), x189=as.character(rep(NA, 50000)), x190=as.character(rep(NA, 50000)), x191=as.character(rep(NA, 50000)), x192=as.character(rep(NA, 50000)), x193=as.character(rep(NA, 50000)), x194=as.character(rep(NA, 50000)), x195=as.character(rep(NA, 50000)), x196=as.character(rep(NA, 50000)), x197=as.character(rep(NA, 50000)), x198=as.character(rep(NA, 50000)), x199=as.character(rep(NA, 50000)), x200=as.character(rep(NA, 50000)))
data_book$import_data(data_tables=list(test2=test2))

rm(test2)

# Deleting data frames in R-Instat using the R-Instat

data_book$delete_dataframes(data_names="test2")


## The tool bar

# Creating a new data frame in R-Instat

data2 <- data.frame(x1=as.numeric(rep(NA, 5)), x2=as.numeric(rep(NA, 5)))
data_book$import_data(data_tables=list(data2=data2))

rm(data2)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data2", col_name="x1", rows="1", new_value=2)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data2", col_name="x2", rows="1", new_value=16)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data2", col_name="x1", rows="2", new_value=6)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data2", col_name="x2", rows="2", new_value=9)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data2", col_name="x1", rows="3", new_value=10)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data2", col_name="x2", rows="3", new_value=4)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data2", col_name="x1", rows="4", new_value=14)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data2", col_name="x2", rows="4", new_value=2)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data2", col_name="x1", rows="5", new_value=22)

# Replace Value In Data: Entering data in R-Instat
data_book$replace_value_in_data(data_name="data2", col_name="x2", rows="5", new_value=-5)


# Getting graphical summary of the data using the one variable graph dialog

last_graph <- data_book$graph_one_variable(data_name="data2", columns=c("x1","x2"), numeric="geom_boxplot", categorical="geom_bar")
data_book$add_object(data_name="data2", object_name="last_graph", object_type_label="graph", object_format="image", object=check_graph(graph_object=last_graph))
data_book$get_object_data(data_name="data2", object_name="last_graph", as_file=TRUE)
rm(last_graph)

# Viewing the one variable graph displayed by plotly
view_object_data(object=plotly::ggplotly(p=data_book$get_last_object_data(object_type_label="graph", as_file=FALSE)), object_format="html")



