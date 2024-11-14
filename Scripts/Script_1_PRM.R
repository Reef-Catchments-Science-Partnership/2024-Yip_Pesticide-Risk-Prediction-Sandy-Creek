## Cath wrote this to clean and format the data extracted from Tahbil for the PRM calculator
## This process can be done on multiple sites, this code is just for the site "Sandy Creek Homebush"

# load libraries
library(readxl)
library(lubridate)
library(dplyr)
library(tidyr)

##########################
# load data
##########################

# read in original, unformatted data
Pest_Dat <- read.csv("Data/Script_1_PRM/Concentration_2024-05-14_17-12.csv", header = TRUE)

#############################
# clean and reformat data
#############################

# check format
str(Pest_Dat)

# fix date/time column
Pest_Dat$Date.Time <- as.POSIXct(Pest_Dat$Date.Time, format="%d/%m/%Y %H:%M", tz = "Australia/Brisbane")
str(Pest_Dat) # check

## this step was added because the original file was edited, this step can otherwise be skipped
# remove unnecessary Date column (the one where hours:minutes have been removed) and concatenated concentration
# Pest_Dat <- Pest_Dat[-c(13, 22)] 
unique(unlist(Pest_Dat$Quality.Code, use.names = TRUE)) #check levels

# create concatenated <LOR column
# note this is a nested command
# there is an if/else statement that says if there is a "<" sign then concatenate Operator and Value
# if not, then just return the Value
Pest_Dat$Conc <- ifelse(grepl("<", Pest_Dat$Operator), paste(Pest_Dat$Operator, Pest_Dat$Value), Pest_Dat$Value)


# now lets cut down the df to only the columns we need for the PRM calculator
# we only need Site.Code, Site.Name, Sampling.Year, Date.Time, Analyte, Conc
# remove everything else
Pest_Dat <- Pest_Dat[-c(1:4, 7:10, 13:15, 17, 19:25)] 

# remove blank rows (seem to have been created in excel version)
unique(unlist(Pest_Dat$Analyte, use.names = TRUE)) # check levels - there is a set of data with no analyte value. These will need to be removed
Analyte_check <-subset(Pest_Dat, Analyte %in% c("")) # first check to see what these rows are and if they have any data
str(Analyte_check) # 1176 observations with no data - can remove
Pest_Dat <- Pest_Dat %>% dplyr::filter(!(Analyte=="")) # remove rows with no data, should be 33862 rows remaining

########################################################
# check for duplicates at Sandy Ck
#######################################################

str(Pest_Dat)
# first check for duplicates
duplicates <- Pest_Dat %>%
  dplyr::group_by(Site.Code, Site.Name, Sampling.Year, Date.Time, Analysis.Method, Analyte) %>%
  dplyr::summarise(n = dplyr::n(), .groups = "drop") %>% 
  dplyr::filter(n > 1L)

# add identifier column
duplicates$dupes <- "duplicate"

# create unique identifier in each df for merging back together
Pest_Dat$ID <- paste(Pest_Dat$Site.Code, Pest_Dat$Site.Name, Pest_Dat$Sampling.Year, Pest_Dat$Date.Time, Pest_Dat$Analysis.Method, Pest_Dat$Analyte)
duplicates$ID <- paste(duplicates$Site.Code, duplicates$Site.Name, duplicates$Sampling.Year, duplicates$Date.Time, duplicates$Analysis.Method, duplicates$Analyte)

duplicates <- merge(Pest_Dat, duplicates, by="ID", all = T)

# write to file
# send to WQI for checking
write.csv(duplicates, "duplicates.csv", row.names = FALSE)

########################################################
# pivot wide so each pesticide is in its own column
#######################################################

# subset to Sandy first
# SandyHB <- "Sandy Creek at Homebush"
subset_df <- Pest_Dat[Pest_Dat$Site.Name == "Sandy Creek at Homebush", ]

# remove unecessary columns in Pest_Dat_wide (Site.Code etc not needed)
subset_df <- subset_df[-c(1,3,5, 8)] 

# pivot wide by pesticide
Sandy_wide <- subset_df %>% pivot_wider(names_from = Analyte, values_from = Conc)

#############################################################
# Clean headers, check format and save
#############################################################

# read in template first (allows cross checking of header names)
Template <- read.csv("Data/Script1_PRM/Tidy Format Example.csv", header = TRUE)
colnames(Template)

# fix column headers to match template
colnames(Sandy_wide)
{
names(Sandy_wide)[which(colnames(Sandy_wide) == "Date.Time")] <- "Date"
names(Sandy_wide)[which(colnames(Sandy_wide) == "Haloxyfop (acid)")] <- "Haloxyfop..acid."
names(Sandy_wide)[which(colnames(Sandy_wide) == "Isoxaflutole metabolite (DKN)")] <- "Isoxaflutole.metabolite..DKN."
names(Sandy_wide)[which(colnames(Sandy_wide) == "MCPA (Monochlorophenoxyacetic acid)")] <- "MCPA"
names(Sandy_wide)[which(colnames(Sandy_wide) == "Metsulfuron-methyl")] <- "Metsulfuron.methyl"
names(Sandy_wide)[which(colnames(Sandy_wide) == "MCPA (Monochlorophenoxyacetic acid)")] <- "MCPA"
names(Sandy_wide)[which(colnames(Sandy_wide) == "2,4-D")] <- "X2.4.D"
}

#Check
colnames(Sandy_wide)
colnames(Template)
unique(unlist(Sandy_wide$Site.Name, use.names = TRUE)) 
str(Sandy_wide)
Sandy_wide <- Sandy_wide[names(Template)]

# Function to check if all values in a row are NULL
all_null <- function(row) {
  all(is.null(row))
}
# Apply the function to each row in the dataframe
null_rows <- apply(Sandy_wide, 1, all_null)
# Display rows where all values are NULL
print("Rows where all values are NULL:")
print(which(null_rows))

# write cleaned df to file 
# this should now be okay to upload to the PRM calculator
write.csv(Sandy_wide,"Sandy at Homebush.csv", row.names = FALSE)

## repeat this process for all sites if needed
