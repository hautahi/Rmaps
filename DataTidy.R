# This program tidies up some of the raw files provided by the NIJ 
# for ease of explanation in blog post

# Load Data
library(rgdal)
port <- readOGR(dsn = "./data", layer = "Police_Districts_Portland")
nov <- readOGR(dsn = "./data", layer = "NIJ2016_NOV01_NOV30")

# Remove unnecessary columns
nov@data <- nov@data[c("CATEGORY","occ_date","census_tra")]

# Save
writeOGR(nov, dsn = 'data', layer = 'NIJ_Nov2016_Crime', driver = "ESRI Shapefile", overwrite_layer=TRUE)