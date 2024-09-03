# Install necessary packages
if(!require(rvest)) install.packages("rvest")
if(!require(httr)) install.packages("httr")

library(rvest)
library(httr)

# URL of the CDC historic data page
url <- "https://www.cdc.gov/dengue/data-research/facts-stats/historic-data.html"

# Read the webpage content
webpage <- read_html(url)

# Extract the links to CSV files
library(magrittr)
csv_links <- webpage %>%
  html_nodes("a") %>% 
  html_attr("href") %>% 
  grep("\\.csv$", ., value = TRUE) # Filter only .csv links

# Ensure that the links are complete URLs
base_url <- "https://www.cdc.gov"
csv_links_full <- ifelse(grepl("^http", csv_links), csv_links, paste0(base_url, csv_links))

# Create a directory to store the downloaded files
dir.create("cdc_dengue_csv", showWarnings = FALSE)

# Download each CSV file
for (link in csv_links_full) {
  file_name <- basename(link)
  download.file(link, file.path("cdc_dengue_csv", file_name))
  cat("Downloaded:", file_name, "\n")
}
