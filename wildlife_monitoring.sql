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