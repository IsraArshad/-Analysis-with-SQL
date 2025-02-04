select * from bands

SELECT * FROM albums

CREATE TABLE Songs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    length DECIMAL(5,2) NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Albums(id)
);

SELECT * FROM songs


--Select only the names of all Bands from the Songs table
SELECT DISTINCT b.name 
FROM Bands b
JOIN Albums a ON b.id = a.band_id
JOIN Songs s ON a.id = s.album_id;

--Select the oldest album
SELECT top(1)* from albums order by release_year asc

--Get all the bands that have albums
SELECT DISTINCT b.name 
FROM Bands b
JOIN Albums a ON b.id = a.band_id;

--Get all the bands that have no albums
SELECT b.name FROM Bands b
LEFT JOIN Albums a ON b.id = a.band_id
WHERE a.id IS NULL;

--Get the longest album (by total song length)
SELECT top(1) a.name, SUM(s.length) AS total_length
FROM Albums a
JOIN Songs s ON a.id = s.album_id
GROUP BY a.id,a.name
ORDER BY total_length DESC;

--Insert a record for your favorite Band and one of their Albums
INSERT INTO Bands (name) VALUES ('Coldplay');

INSERT INTO Albums (name, release_year, band_id)
VALUES ('A Head Full of Dreams', 2015, (SELECT id FROM Bands WHERE name='Coldplay'));

--Delete the Band and Album you added in the previous question 
DELETE FROM Albums WHERE band_id = (SELECT id FROM Bands WHERE name='Coldplay');
DELETE FROM Bands WHERE name = 'Coldplay';

--Get the Average length of all songs 
SELECT AVG(length) AS avg_song_len FROM Songs;

--Select the longest song of each album 
SELECT a.name AS album_name, s.name AS longest_song, s.length
FROM Songs s 
JOIN Albums a ON s.album_id = a.id
WHERE s.length = (SELECT MAX(length) FROM Songs WHERE album_id = a.id);

--Get the number of songs for each band
SELECT b.name, COUNT(s.id) AS total_songs FROM Bands b
JOIN Albums a ON b.id = a.band_id
JOIN Songs s ON a.id = s.album_id
GROUP BY b.id,b.name;

--Create a decade column dividing the year 
ALTER TABLE Albums ADD decade INT;

UPDATE Albums SET decade = FLOOR(release_year/10)*10;

--Filter the Albums which start with the word 'The'
SELECT * FROM Albums WHERE name LIKE 'The%';

--Find the albums released between 2008 and 2013 
SELECT * FROM Albums WHERE release_year BETWEEN 2008 AND 2013;