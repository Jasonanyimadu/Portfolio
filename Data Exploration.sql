/*
Bike Share Data Exploration

Skills utilised: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

/*

SELECT * 
FROM `portoflioprojectbikeshares.tripdata.March2022`
 
 -- Select Data to anaylze first
 
SELECT ride_id, rideable_type, member_casual, ride_length, day_of_week, start_station_name end_station_name 
FROM `portoflioprojectbikeshares.tripdata.March2022`

--  Ride Length vs Bike Type (Top 10)
-- Shows top 10 bike types in descending order ridden the longest

Select ride_length, rideable_type
From `portoflioprojectbikeshares.tripdata.March2022` 
Order By ride_length DESC
Limit 10;

-- ride_type Frequency
-- Calculates the Frequency of most popular bike types used 

ct rideable_type, COUNT(rideable_type) AS Frequency
From `portoflioprojectbikeshares.tripdata.March2022`
Group By rideable_type 
Order By Count(rideable_type) DESC

-- Where statement
-- Narrowing down the search to find start station names that only have "Michigan Ave & Oak St"

SELECT start_station_name 
FROM `portoflioprojectbikeshares.tripdata.March2022`
WHERE start_station_name LIKE '%Michigan Ave & Oak St%';

-- Join Statement 

Select s.start_station_id, s.start_station_name,s.start_lat, s.start_lng.*
From `portoflioprojectbikeshares.tripdata.March2022` AS b
LEFT JOIN statement AS s
ON s.start_lat = b.start_lat AND s.start_lng = b.start_lng
