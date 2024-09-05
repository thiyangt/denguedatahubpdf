# Sep 5, 2024
# Packages
library(tidyverse)
library(readr)
library(here)

# Set the folder path
here()
folder_path <- here("cdc_dengue_csv")
folder_path

# Get the list of CSV files in the folder
csv_files <- list.files(path = folder_path, pattern = "\\.csv$", full.names = TRUE)
csv_files

#----------------------------------------------------------------------------------------------
#
# "Dengue cases by age group and sex based on year and travel status selected above"
#
#----------------------------------------------------------------------------------------------

filtered_addresses <- grep("Dengue cases by age group and sex based on year and travel status selected above", csv_files, value = TRUE)

# Read all CSV files into a list of data frames
age_sex_data_list <- lapply(filtered_addresses, read_csv)
View(age_sex_data_list)
merged_tibble_age_sex_data_list <- bind_rows(age_sex_data_list)
View(merged_tibble_age_sex_data_list)

cdc_dengue_agesex <- merged_tibble_age_sex_data_list |>
  arrange(Year)
View(cdc_dengue_agesex)

# Optionally, combine all data frames into one using rbind
combined_data <- do.call(rbind, data_list)