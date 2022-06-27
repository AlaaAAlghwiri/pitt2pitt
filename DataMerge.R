# In this script, I will only be merging with data warehouse spread sheet

library(readxl)
library(tidyverse)
pitttopitt <- read_excel("pitt2pitt_study2.xlsx", sheet = "Study 2") %>%
  rename(EMPLID = `Emplid of Students Offered Admission`)
 
dw <- read_excel("pitt2pitt_data_warehouse.xlsx") %>%
  filter(!duplicated(EMPLID))


# all got merged except 60 students

df <- left_join(pitttopitt, dw, 'EMPLID')

# export the file into path

write_csv(df, "mergedfile.csv")
