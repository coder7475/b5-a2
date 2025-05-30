-- Create Database
CREATE DATABASE conservation_db;
--! Conncet to conservation_db

-- ? Create Tables for the database
-- Create Ranger table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(100) NOT NULL
);

-- Create species table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discover_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);

-- Create Sightings table
CREATE TABLE sightings (
   sighting_id SERIAL PRIMARY KEY,
   ranger_id INTEGER REFERENCES rangers(ranger_id),
   species_id INTEGER REFERENCES species(species_id),
   sighting_time TIMESTAMP NOT NULL,
   location VARCHAR(100) NOT NULL,
   notes TEXT
);

-- ? ADD Sample datas
-- Add sample data in ranger table
INSERT INTO rangers (name, region) 
VALUES 
  ('Alice Green', 'Northern Hills'),
  ('Bob White', 'River Delta'),
  ('Carol King', 'Mountain Range');

-- See sample values
SELECT * FROM rangers;

-- Insert into species table
INSERT INTO species (common_name, scientific_name, discover_date, conservation_status) 
VALUES
  ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
  ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
  ('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
  ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

-- See sample values
SELECT * FROM species;

-- Insert into sightings table
INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) 
VALUES
  (1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
  (2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
  (3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
  (4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

-- See the sample data
SELECT * FROM sightings;


-- Problem 1 - Solution
-- Add a new ranger
INSERT INTO rangers (name, region)
VALUES
    ('Derek Fox', 'Coastal Plains');

-- See Result
SELECT * FROM rangers;


-- Problem 2 - Solution
-- Count unique species ever sighted
SELECT count(DISTINCT scientific_name) 
AS unique_species_count
FROM species;


-- Problem 3 - Solution
-- All sigtings where location include 'Pass'
SELECT * FROM sightings WHERE location LIKE '%Pass%';


-- Problem 4 - Solution
-- List each ranger's name and their total number of sightings
SELECT name, count(sighting_time) AS total_sightings 
FROM rangers 
JOIN sightings
ON rangers.ranger_id = sightings.ranger_id
GROUP BY name 
ORDER BY name;


-- Problem 5 - Solution
-- List species that have never sighted
SELECT common_name FROM species
LEFT JOIN sightings
ON species.species_id = sightings.species_id
WHERE sighting_time IS NULL;


-- Problem 6 - Solution
-- Show the most recent 2 sightings
SELECT common_name, sighting_time, name 
FROM sightings
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
JOIN species ON sightings.species_id = species.species_id  
ORDER BY sighting_time DESC
LIMIT 2;


-- Problem 7 - Solution
-- Update all species discovered before year 1800 
-- to have status 'Historic'
UPDATE species
SET conservation_status = 'Historic'
WHERE EXTRACT(YEAR FROM discover_date) < 1800;

-- See updated status 
SELECT * FROM species;


-- Problem 8 - Solution
-- Label each sightings time of day
-- as 'Morning', 'Afternoon' or 'Evening'
SELECT
  sighting_id,
  CASE
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 
        THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) >= 12 AND EXTRACT(HOUR FROM sighting_time) <= 17 
        THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;


-- Problem 9 - Solution
-- Delete rangers who have never sighted any species
DELETE FROM rangers
WHERE ranger_id IN (
    SELECT rangers.ranger_id
    FROM rangers
    LEFT JOIN sightings 
        ON rangers.ranger_id = sightings.ranger_id
    WHERE sightings.ranger_id IS NULL
);


-- See if derek is deleted
SELECT * FROM rangers;

-- Final Cleaning - Drop all tables
DROP TABLE rangers, species, sightings;





