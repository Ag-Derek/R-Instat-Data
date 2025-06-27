# load the packages
library(dplyr)
library(gosset)
library(PlackettLuce)
library(instatExtras)
library(databook)

# load a data set into R
data_book <- DataBook$new()

# Read in the data into R-Instat from gosset
utils::data(package="gosset", X=cassava)
data_book$import_data(data_tables=list(cassava=cassava))

# First they do some cleaning/checking: =======================================================================
# But this data is clean already - mostly. We will set country and gender to be factors
data_book$convert_column_to_type(data_name="cassava", col_names=c("gender", "country"), to_type="factor")

# Checking for unlikely values. We would replace with an NA if there were age == 0 or > 80
data_book$add_filter(and_or="|", filter=list(C0=list(column="age", operation="==", value=0), C1=list(column="age", operation=">", value=80)), data_name="cassava", filter_name="filter")
data_book$set_current_filter(data_name="cassava", filter_name="filter")

# there arent any so we now remove the filter
data_book$remove_current_filter(data_name="cassava")

# we also check for NAs in "consumption" - there are none!
data_book$calculate_summary(data_name="cassava", store_results=TRUE, return_output=FALSE, factors="consumption", j=1, summaries=c("summary_count", "summary_count_miss", "summary_count_all"), silent=TRUE)

# So we want to rearrange the data
# First, we will check the data level of the data frame(s) of interest
output_data_levels <- instatExtras::summarise_data_levels(data_list=c("cassava"), id_cols = "id")
output_data_levels

# Then we will create the plot and variety level data------------------------------------------------------------------
output_data_levels <- create_tricot_datasets(output_data_levels, id_col = "id", 
                                             good_suffixes = "_pos",
                                             bad_suffixes = "_neg",
                                             na_candidates = "Not observed")                                          
# Our cassava data is untouched
# We have created a new data set `cassava_plot`, which gives data at the plot level. This means that every row is a unique
# id and variety variable
# Then we have `cassava_plot_by_variety`, which gives the data at the variety level. Every row is a unique variety.

# Next we want to define the data.
# We need to define each data set: cassava, cassava_plot_by_variety, and cassava_plot.
# We can see from the output that things are correctly defined, and key columns are added for the unique columns.
data_book$define_as_tricot(data_name="cassava", key_col_names="id", types=c(varieties=c("option_a","option_b","option_c"), traits=c("colour_pos","colour_neg","smoothness_pos","smoothness_neg","mouldability_pos","mouldability_neg","stretchability_pos","stretchability_neg","taste_pos","taste_neg","odour_pos","odour_neg","firmness_pos","firmness_neg","overall_pos","overall_neg"), id="id"), auto_selection=TRUE)

data_book$define_as_tricot(data_name="cassava_plot_by_variety", key_col_names="variety", types=c(variety="variety"), auto_selection=TRUE)

data_book$define_as_tricot(data_name="cassava_plot", key_col_names=c("id", "variety"), types=c(traits=c("colour","firmness","odour","overall","stretchability","taste","mouldability","smoothness"), variety="variety", id="id"), auto_selection=TRUE)

# We create a rankings object for cassava_plot, which is our non-grouped rankings
cassava_plot <- data_book$get_data_frame(data_name="cassava_plot")
traits <- data_book$get_column_selection(name="traits_selection", data_name="cassava_plot")
traits <- unname(traits$conditions$C0$parameters$x)
rankings_list <- instatExtras::create_rankings_list(data=cassava_plot, traits=traits, variety="variety", id="id", FALSE)
data_book$add_object(data_name="cassava_plot", object_name="rankings_list", object_type_label="structure", object_format="text", object=rankings_list)

# We create a rankings object for cassava_plot, which is our grouped rankings
grouped_rankings_list <- instatExtras::create_rankings_list(data=cassava_plot, traits=traits, variety="variety", id="id", TRUE)
data_book$add_object(data_name="cassava_plot", object_name="grouped_rankings_list", object_type_label="structure", object_format="text", object=grouped_rankings_list)

rm(list=c("grouped_rankings_list", "rankings_list", "cassava_plot", "traits"))

# Now onto some Modelling =======================================================================
# first we convert variety to be a factor
data_book$convert_column_to_type(data_name="cassava_plot", col_names="variety", to_type="factor")

# and then we reorder the factor levels to set our baseline level
data_book$reorder_factor_levels(data_name="cassava_plot", col_name="variety", new_level_names=c("Game Changer","TMS1","TMS2","Obasanjo-2","TMSIBA","Sape","TMS3","Madame","TMS6","TMEB1","TMEB3","Akpu","TMEB2"))

# Model 1: Plackett-Luce Model (Rankings Model)
# We create a model for each of our traits
# These models look at the ranking for the different traits

# firstly we need to get our ranking object for the traits of interest (we are doing all of them)
get_index_names <- data_book$get_variables_metadata(data_name="cassava_plot")
vars <- (c("colour","firmness","odour","overall","stretchability","taste", "mouldability", "smoothness"))
rankings_object <- data_book$get_object(data_name="cassava_plot", object_name="rankings_list")$object
rankings_object <- get_ranking_items(data=get_index_names, vars_to_get=vars, index="rankings_index", rankings_object)

# then we need to get the baseline level to set the reference
cassava_plot <- data_book$get_data_frame("cassava_plot")
var_name <- data_book$get_variables_from_metadata(data_name="cassava_plot", property="Tricot_Type", property_value="variety")
variety_baseline <- levels(factor(x=cassava_plot[[var_name]]))
variety_baseline <- variety_baseline[1]

# and now we run the model
mod <- purrr::map(.x=rankings_object, .f= ~ PlackettLuce::PlackettLuce(.x), ref=variety_baseline)

# we look at the model itself, as well as coefficinets, summary, quasi variance, and reliability.
names(mod) <- vars
purrr::map(.x=mod, .f= ~ coef(.x))
purrr::map(.x=mod, .f=~summary(.x))
purrr::map(.x=mod, .f=~qvcalc::qvcalc(PlackettLuce::itempar(.x)))
purrr::map(.x=purrr::imap(.x = mod,  .f = ~gosset::reliability(.x, ref = variety_baseline)), .f=~ .x %>% dplyr::mutate(reliability_rescaled = round(reliability / 0.5 - 1, 2)))
# we also look at a worth map
plot <- gosset::worth_map(mod, labels=names(mod))
data_book$add_object(data_name="cassava_plot", object_name="plot", object_type_label="graph", object_format="image", object=instatExtras::check_graph(graph_object=plot))
data_book$get_object_data(data_name="cassava_plot", object_name="plot", as_file=TRUE)
last_model <- mod
data_book$add_object(data_name="cassava_plot", object_name="last_model", object_type_label="model", object_format="text", object=last_model)
data_book$get_object_data(data_name="cassava_plot", object_name="last_model", as_file=TRUE)
rm(list=c("last_model", "rankings_object", "get_index_names", "vars", "var_name", "variety_baseline", "mod", "plot"))




##### MODELS WITH COVARIATES ======================================================================================================================================================================================
# Our ranking object vs consumption ====
# so firstly we set consumption as a factor
data_book$convert_column_to_type(data_name="cassava", col_names="consumption", to_type="factor")

# then we get the model
cassava_plot <- data_book$get_data_frame("cassava_plot")
cassava <- data_book$get_data_frame("cassava")
var_name <- data_book$get_variables_from_metadata(data_name="cassava_plot", property_value="variety", property="Tricot_Type")

library(PlackettLuce)
get_index_names <- data_book$get_variables_metadata("cassava_plot")
vars <- c("overall","taste")
rankings_object <- data_book$get_object(object_name="grouped_rankings_list", data_name="cassava_plot")$object
ranking_objects <- get_ranking_items(data=get_index_names, vars_to_get=vars, index="rankings_index", rankings_object)
variety_baseline <- levels(factor(cassava_plot[[var_name]]))[1]
mod_list <- purrr::map(.x=ranking_objects, .f=~PlackettLuce::pltree(ref=variety_baseline, .x ~ consumption, data=cassava, minsize = 5,
                                                                    alpha = 0.1, 
                                                                    gamma = TRUE))

names(mod_list) <- vars
purrr::map(.x=mod_list, .f=~summary(.x))
list_of_plots <- purrr::map2(.x=mod_list, .y=names(mod_list), .f=~plot_pltree(.x) + ggplot2::labs(caption = .y))
list_of_plots
last_graph <- patchwork::wrap_plots(list_of_plots)
data_book$add_object(object_name="last_graph", object_type_label="graph", object_format="image", object=instatExtras::check_graph(graph_object=last_graph))
data_book$get_object_data(object_name="last_graph", as_file=TRUE)
purrr::map(.x=mod_list, .f=~gosset::node_rules(.x))
purrr::map(.x=mod_list, .f=~gosset::node_labels(.x))
purrr::map(.x=mod_list, .f=~gosset::regret(.x))
last_model <- mod_list
data_book$add_object(data_name="cassava_plot", object_name="last_model", object_type_label="model", object_format="text", object=last_model)
data_book$get_object_data(data_name="cassava_plot", object_name="last_model", as_file=TRUE)
rm(list=c("last_model", "cassava_plot", "cassava", "var_name", "mod_list", "ranking_objects", "get_index_names", "vars", "rankings_object", "variety_baseline", "list_of_plots", "last_graph"))



# Then we do a one-covariate (variety) model ---------------------------------------------------------------
get_index_names <- data_book$get_variables_metadata(data_name="cassava_plot")
rankings_object <- data_book$get_object(data_name="cassava_plot", object_name="rankings_list") $ object
vars <- c("overall")
rankings_object <- get_ranking_items(data=get_index_names, rankings_object, vars_to_get=vars, index ="rankings_index")

column <- data_book$get_columns_from_data("cassava_plot_by_variety", "variety")
variety_baseline <- levels(factor(column)) [ 1]

cassava_plot_by_variety <- data_book$get_data_frame(data_name="cassava_plot_by_variety")
mod_list <- purrr::map(.x=rankings_object, .f= ~ PlackettLuce::pladmm(.x,  ~ variety, data=cassava_plot_by_variety))
vars <- c("overall")
names(mod_list) <- vars
last_model <- mod_list
data_book$add_object(data_name="cassava_plot_by_variety", object_name="last_model", object_type_label="model", object_format="text", object=last_model)
data_book$get_object_data(data_name="cassava_plot_by_variety", object_name="last_model", as_file=TRUE)
rm(list=c("last_model", "rankings_object", "get_index_names", "vars", "variety_baseline", "column", "mod_list", "cassava_plot_by_variety"))

### 
# rankings - fit a new rankings for all traits, except overall. ---------------------------------
# and not logged
# then we save it as a data frame
get_index_names <- data_book$get_variables_metadata(data_name="cassava_plot")
vars <- (c("colour","firmness","odour","overall","stretchability","taste", "mouldability", "smoothness"))
rankings_object <- data_book$get_object(data_name="cassava_plot", object_name="rankings_list")$object
rankings_object <- get_ranking_items(data=get_index_names, vars_to_get=vars, index="rankings_index", rankings_object)
mod <- purrr::map(.x=rankings_object, .f= ~ PlackettLuce::PlackettLuce(.x))
names(mod) <- vars
coefficients_data <- purrr::map(.x=mod, .f= ~ coef(.x))

coefficients_data  <- coefficients_data %>%
  purrr::imap_dfr(~ {
    tibble::tibble(variety = names(.x), value = as.numeric(.x), trait = .y)
  }) %>%
  tidyr::pivot_wider(names_from = trait, values_from = value)
data_book$import_data(list(coefficients_data=coefficients_data))
data_book$define_as_tricot(data_name="coefficients_data", key_col_names="variety", types=c(variety = "variety"), auto_selection=TRUE)

# PLADMM model of overall against the coefficients variety features -- we can look at the overall rankings agianst the traits now (previously looked at it against the varietieis)
get_index_names <- data_book$get_variables_metadata(data_name="cassava_plot")
rankings_object <- data_book$get_object(data_name="cassava_plot", object_name="rankings_list")$object
vars <- "overall"
rankings_object <- get_ranking_items(data=get_index_names, rankings_object, vars_to_get=vars, index ="rankings_index")
cassava_plot <- data_book$get_data_frame("cassava_plot")
var_name <- data_book$get_variables_from_metadata(data_name="cassava_plot", property="Tricot_Type", property_value="variety")
variety_baseline <- levels(factor(cassava_plot[[var_name]]))[1]

coefficients_data <- data_book$get_data_frame(data_name="coefficients_data")
# can be all of htem, but, can't here because of NAs!!!
mod_list <- purrr::map(.x=rankings_object, .f= ~ PlackettLuce::pladmm(.x,  ~ colour, data=coefficients_data)) #odour+firmness+stretchability+taste+mouldability+smoothness, data=coefficients_data2))
vars <- "overall"
names(mod_list) <- vars
last_model <- mod_list
data_book$add_object(data_name="coefficients_data", object_name="last_model", object_type_label="model", object_format="text", object=last_model)
data_book$get_object_data(data_name="coefficients_data", object_name="last_model", as_file=TRUE)
rm(list=c("last_model", "rankings_object", "get_index_names", "vars", "cassava_plot", "var_name", "variety_baseline", "mod_list", "coefficients_data"))
