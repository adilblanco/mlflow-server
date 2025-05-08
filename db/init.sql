-- init.sql
CREATE USER mlflow WITH PASSWORD 'mlflow';
CREATE DATABASE mlflowdb;
GRANT ALL PRIVILEGES ON DATABASE mlflowdb TO mlflow;

-- Optionnel : Tables spécifiques si nécessaire
-- \connect mlflowdb
-- CREATE TABLE IF NOT EXISTS experiments (...);
