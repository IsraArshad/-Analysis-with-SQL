# Analysis with SQL

## Project Overview
This project involves creating and analyzing a relational database using MySQL. The database consists of bands, albums, and songs, and the analysis includes querying various details such as longest albums, number of songs per band, and albums released in a certain period. The dataset is structured with appropriate foreign key relationships to ensure data integrity.

## Database Setup
### 1. Schema Setup
- The database schema is defined in `schema.sql`, which contains the structure for the tables.
- Run the script in **MySQL Workbench** to create the necessary tables.

### 2. Creating the Songs Table
```sql
CREATE TABLE Songs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    length DECIMAL(5,2) NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Albums(id)
);
```
- The `Songs` table is added to store song details with a foreign key reference to the `Albums` table.

### 3. Populating the Database
- Copy and run the `data.sql` script in MySQL Workbench to insert data into the tables.
- Ensure there are no errors in data insertion.


## File Structure
```
Analysis-with-SQL/
│-- schema.sql         # Contains database schema
│-- data.sql           # Inserts initial data
│-- queries.sql        # SQL queries for analysis
│-- README.md          # Documentation of the project
```

## How to Run the Project
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Analysis-with-SQL.git
   ```
2. Open **MySQL Workbench** and execute `schema.sql` to create the tables.
3. Run `data.sql` to populate the database.
4. Execute queries from `queries.sql` to analyze the dataset.

## Conclusion
This project demonstrates how to set up and analyze a relational database using SQL. The queries provide valuable insights into the dataset, such as identifying the longest albums, oldest albums, and albums from specific decades.
