library(DBI)
library(dplyr)

wildfireDataLoc = "C:/Users/kwwur/Documents/personal_projects/wildfires_project/data/FPA_FOD_20170508.sqlite"

con <- dbConnect(RSQLite::SQLite(), wildfireDataLoc)
dbListTables(con)


wilfires = dbGetQuery(con, 'SELECT * FROM Fires') %>% collect()



dbDisconnect(con)

