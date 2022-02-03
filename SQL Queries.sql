--> LSOA

--> Create table 
CREATE TABLE LSOA (
    LSOA11CD VARCHAR,
    LSOA11NM VARCHAR,
    TCITY15CD VARCHAR,
    TCITY15NM VARCHAR,
    FID VARCHAR ,
    PRIMARY KEY (LSOA11CD)
);

--> Delete all values that are null 
DELETE FROM lsoa 
WHERE COALESCE (lsoa11nm, tcity15cd, tcity15nm, fid ) IS NULL;

--> ACCIDENTS BETWEEN 2012 TO 2014

--> Create table 
CREATE TABLE accidents (
Accident_Index varchar, 
Location_Easting_OSGR varchar, 
Location_Northing_OSGR	varchar, 
Longitude varchar, 
Latitude varchar, 
Police_Force varchar, 	
Accident_Severity varchar, 
Number_of_Vehicles	varchar, 
Number_of_Casualties varchar, 	
Date_of_accident varchar, 
Day_of_Week	varchar, 
Time_of_accident varchar, 
Local_Authority_District varchar, 
Local_Authority_Highway	varchar, 
Road_Class_one	varchar, 
Road_Number_one	varchar, 
Road_Type varchar,
Speed_limit	varchar, 
Junction_Detail	varchar, 
Junction_Control varchar, 
Road_Class_Two	varchar, 
Road_Number_Two	varchar, 
Pedestrian_Crossing_Human_Control	varchar, 
Pedestrian_Crossing_Physical_Facilities	varchar,
Light_Conditions varchar, 	
Weather_Conditions	varchar, 
Road_Surface_Conditions	varchar, 
Special_Conditions_at_Site	varchar, 
Carriageway_Hazards	varchar, 
Urban_or_Rural_Area	varchar, 
Did_Police_Officer_Attend_Scene_of_Accident	varchar, 
LSOA_of_Accident_Location	varchar, 
Year_of_accident varchar
);

--> accidents on the 14/02/2014 
SELECT * FROM accidents
WHERE date_of_accident='14/02/2014';

--> the number of accidents taken place on 14/02/2014 
SELECT COUNT(date_of_accident)
FROM accidents
WHERE date_of_accident='14/02/2014';







    


