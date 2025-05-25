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