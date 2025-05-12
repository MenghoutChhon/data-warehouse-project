/*
-- =============================================================
-- This script is to create the database 'Data_Warehouse' 
-- and SCHEMA for a 3-layered architecture (WTL: Warehouse → Transform → Load).
-- The layers are:
-- 1. Raw_Layer: Store raw ingested data from external sources.
-- 2. Staging_Layer: Clean, validate, and standardize the raw data.
-- 3. Core_Layer: Create fact and dimension tables based on the staging data.
-- =============================================================
*/
-- Create the Data Warehouse Database
USE master;
GO

CREATE DATABASE Data_Warehouse;
GO

-- Switch to the newly created database
USE Data_Warehouse;
GO

-- Create schema for raw data (initial landing zone)
CREATE SCHEMA Raw_Layer;
GO

-- Create schema for staging data (cleaned/prepared)
CREATE SCHEMA Staging_Layer;
GO

-- Create schema for core layer (fact and dimension tables)
CREATE SCHEMA Core_Layer;
GO

