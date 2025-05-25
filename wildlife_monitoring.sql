-- Create Database
CREATE DATABASE conservation_db;

-- Create Tables for the database
-- Create Ranger table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    region TEXT NOT NULL
);

