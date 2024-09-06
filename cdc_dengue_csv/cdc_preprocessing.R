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
unique()
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
write_csv(cdc_dengue_agesex, file=here("cdc_dengue_csv", "cdc_dengue_agesex.csv"))

#-------------------------------------------------
#
# Dataset 2
#
#-------------------------------------------------
filtered_addresses2 <- grep("Dengue cases by county based on year and travel status selected above", csv_files, value = TRUE)
# Read all CSV files into a list of data frames
county_year_data_list <- lapply(filtered_addresses2, read_csv)
View(county_year_data_list)
merged_tibble_county_year_data_list <- bind_rows(county_year_data_list)
View(merged_tibble_county_year_data_list)

cdc_dengue_countyyear <- merged_tibble_county_year_data_list |>
  arrange(Year)
View(cdc_dengue_countyyear)
write_csv(cdc_dengue_countyyear, file=here("cdc_dengue_csv", "cdc_dengue_countyyear.csv"))

#-------------------------------------------------
#
# Dataset 3
#
#-------------------------------------------------
filtered_addresses3 <- grep("Dengue cases by jurisdiction based on year and travel status selected above", csv_files, value = TRUE)
# Read all CSV files into a list of data frames
casesbyjurisdiction_data_list <- lapply(filtered_addresses3, read_csv)
View(casesbyjurisdiction_data_list)
merged_tibble_casesbyjurisdiction_data_list <- bind_rows(casesbyjurisdiction_data_list)
View(merged_tibble_casesbyjurisdiction_data_list)

cdc_dengue_casesbyjurisdiction <- merged_tibble_casesbyjurisdiction_data_list |>
  arrange(Year)
View(cdc_dengue_casesbyjurisdiction )
write_csv(cdc_dengue_casesbyjurisdiction , file=here("cdc_dengue_csv", "cdc_dengue_casesbyjurisdiction.csv"))


#-------------------------------------------------
#
# Dataset 4
#
#-------------------------------------------------
filtered_addresses4 <- grep("Dengue cases by week based on year and travel status selected above", csv_files, value = TRUE)
# Read all CSV files into a list of data frames
cdc_casesby_week_data_list <- lapply(filtered_addresses4, read_csv)
View(cdc_casesby_week_data_list)
merged_tibble_cdc_casesby_week_data_list <- bind_rows(cdc_casesby_week_data_list)
View(merged_tibble_cdc_casesby_week_data_list)

cdc_casesby_week <- merged_tibble_cdc_casesby_week_data_list |>
  arrange(Year)
View(cdc_casesby_week)
write_csv(cdc_casesby_week , file=here("cdc_dengue_csv", "cdc_casesby_week.csv"))
