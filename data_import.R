library(DBI)
library(dplyr)

# Dataset downloaded from kaggle: https://www.kaggle.com/datasets/rtatman/188-million-us-wildfires/data

wildfireDataLoc = "C:/Users/kwwur/Documents/personal_projects/wildfires_project/data/FPA_FOD_20170508.sqlite"

con <- dbConnect(RSQLite::SQLite(), wildfireDataLoc)
dbListTables(con)


wildfires = dbGetQuery(con, 'SELECT * FROM Fires') %>% collect()


save(wildfires, file = "C:/Users/kwwur/Documents/personal_projects/wildfires_project/data/Fires.Rdata")

dbDisconnect(con)

