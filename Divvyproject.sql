#Importing Data
CREATE TABLE divvy202104 (
    ride_id VARCHAR UNIQUE,
    rideable_type VARCHAR,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name VARCHAR,
    start_station_id VARCHAR,
    end_station_name VARCHAR,
    end_station_id VARCHAR,
    start_lat NUMERIC,
    start_lng NUMERIC,
    end_lat NUMERIC,
    end_lng NUMERIC,
    member_casual VARCHAR
)
CREATE TABLE divvy202105 (
    ride_id VARCHAR UNIQUE,
    rideable_type VARCHAR,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name VARCHAR,
    start_station_id VARCHAR,
    end_station_name VARCHAR,
    end_station_id VARCHAR,
    start_lat NUMERIC,
    start_lng NUMERIC,
    end_lat NUMERIC,
    end_lng NUMERIC,
    member_casual VARCHAR
)

ect...

#REMOVING NULLS
DELETE FROM divvy202104
WHERE start_station_name IS NULL
OR end_station_name IS NULL

DELETE FROM divvy202105
WHERE start_station_name IS NULL 
OR end_station_name) IS NULL

ect...

#COMBINING TABLES for Yearly Data
SELECT * 
    INTO d2021
FROM 
(
        SELECT * 
    FROM divvy202104
    UNION
    SELECT *
    FROM divvy202105
    UNION
    SELECT *
    FROM divvy202106
    UNION
    SELECT *
    FROM divvy202107
    UNION
    SELECT *
    FROM divvy202108
) AS cd2021

SELECT * 
    INTO d2022
FROM 
(
        SELECT * 
    FROM divvy202204
    UNION
    SELECT *
    FROM divvy202205
    UNION
    SELECT *
    FROM divvy202206
    UNION
    SELECT *
    FROM divvy202207
    UNION
    SELECT *
    FROM divvy202208
) AS cd2022
