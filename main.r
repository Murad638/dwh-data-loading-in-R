# ==========================================================================================
pacman::p_load(tidyverse, RPostgreSQL, RPostgres, DBI, tictoc)

print("Write data to database...")


connection <- dbConnect(RPostgres::Postgres(),
                            user = "example", # Change to correct user name
                            password = "...", # Change to correct password name
                            dbname = '...', # Change to correct database name name
                            host = 'host_name', # Change to correct host name
                            port = ...) # Change to correct port name



# Run below lines to get correct UTF8 encoding otherwise, different alphabetic letter will not be avaiable in cells.

dbGetQuery(connection, "SHOW SERVER_ENCODING")
dbGetQuery(connection, "SHOW CLIENT_ENCODING")
dbGetQuery(connection, "SET CLIENT_ENCODING = 'UTF8'") # change encoding to UTF-8




# example data

data <- as.data.frame(data)

if (dbExistsTable(connection, name = SQL('"schema_name"."table_name"'))){ # remove table if it exist on same name or outdated data in DB
  DBI::dbRemoveTable(conn = connection, name = SQL('"schema_name"."table_name"')) # it is necessary to automate script


# create the table // you can write table via dbwritetable however you should have at least empty table in db to update
x <- DBI::dbCreateTable(conn = connection, # connection to your adm.x user
                        name = SQL('"schema_name"."table_name"'), # schema_name.table_name
                        fields = data #, # data.frame of what you want to enter
                        # fileEncoding = "WIN1257"
)

x # check if table was created sucsessfully, (true)




# Assuming 'data' contains your dataset
# sometimes table size might be too big to load db in attempt and takes too long, then it is better to use chucks for loading part by part

chunk_size <- 200000 # for example, it can be changed different number
num_chunks <- ceiling(nrow(data) / chunk_size)




# if there is already table in db and table size is small, then it can be directly used this method

# dbWriteTable(conn = con_postgre_admin,
#              name = SQL('"schema_name"."table_name"'),
#              value = chunk_data,
#              append = TRUE
# )
#





# data loading with batches...

print("Table writing with batches...")

for (i in 1:num_chunks) {
  tic()
  print(i)
  start_row <- (i - 1) * chunk_size + 1
  end_row <- min(i * chunk_size, nrow(data))
  chunk_data <- data[start_row:end_row, ]

  dbWriteTable(conn = connection_dev,
               name = SQL('"schema_name"."table_name"'),
               value = chunk_data,
               append = TRUE
  )


  #dbAppendTable(connect, name = DBI::SQL('"schema_name.table_name"'), value = chunk_data) # another solution for batching however it is slow

  toc()
}


RPostgres::dbDisconnect(connection_dev)

gc()

