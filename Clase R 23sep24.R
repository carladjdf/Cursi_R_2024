library(tidyverse)
library(httr)
library(readxl)
# Define the URL for the raw Excel file
url <- "https://raw.githubusercontent.com/stringfestdata/advancing-into-analytics-book/main/datasets/star/star.xlsx"
# Get the data from the URL
response <- httr::GET(url)
# Ensure the response status is 200 (OK)
if (response$status_code == 200) {
  # Read data from the raw binary content
  temp_file <- tempfile(fileext = ".xlsx")
  writeBin(httr::content(response, "raw"), temp_file)
  data <- readxl::read_excel(temp_file)
  # Optionally, delete the temporary file after reading
  unlink(temp_file)
  # Use the data
  print(head(data))
} else {
  print("Failed to download file: HTTP status code is not 200")}

