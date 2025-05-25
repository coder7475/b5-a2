-- Create Database
CREATE DATABASE conservation_db;

-- ? Create Tables for the database
-- Create Ranger table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    region TEXT NOT NULL
);

-- Create species table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name TEXT NOT NULL,
    scientific_name TEXT NOT NULL,
    discover_date DATE NOT NULL,
    conservation_status TEXT NOT NULL
);

-- Create Sightings table
CREATE TABLE sightings (
   sighting_id SERIAL PRIMARY KEY,
   ranger_id INTEGER REFERENCES rangers(ranger_id),
   species_id INTEGER REFERENCES species(species_id),
   sighting_time TIMESTAMP NOT NULL,
   location TEXT NOT NULL,
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

















