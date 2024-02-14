# Database Data Loading Script

This script is designed to efficiently write data to a PostgreSQL database. It is particularly useful when dealing with large datasets, and it includes provisions for handling data in chunks to optimize loading speed.

## Prerequisites

Make sure you have the following prerequisites installed:

- RPostgres
- RPostgreSQL
- tidy.verse
- pacman
- DBI
- tictoc

## Configuration

Before running the script, update the following connection parameters in the script:

- `user`: Replace with the correct username.
- `password`: Replace with the correct password.
- `dbname`: Replace with the correct database name.
- `host`: Replace with the correct host name.
- `port`: Replace with the correct port number.

## Encoding

Ensure proper UTF-8 encoding by running the following lines in the script:

```R
dbGetQuery(connection, "SHOW SERVER_ENCODING")
dbGetQuery(connection, "SHOW CLIENT_ENCODING")
dbGetQuery(connection, "SET CLIENT_ENCODING = 'UTF8'")
