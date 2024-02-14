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
```

## Usage

- Replace the example data with your actual dataset.

- If the table already exists, the script will remove it to prevent conflicts with outdated data. This ensures that the script can be run multiple times without issues.

- The script creates a new table with the provided schema and table name in the PostgreSQL database.

- It then loads the data in batches to optimize performance, especially for large datasets. You can adjust the chunk_size variable as needed.


## Execution

Run the script and monitor the progress as it prints batch numbers and execution times.

```R
source("your_script_name.R")
```

## Notes

- This script uses the RPostgres package for database connections.

- Ensure that you have the necessary permissions to create and modify tables in the specified database.

- Adjust the script as needed for your specific database setup.

## Author
Murad Khalilov


