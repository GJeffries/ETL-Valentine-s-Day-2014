-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/CeJLHN
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "valentines_day_2014" (
    "Accident_Index" VARCHAR(255)  NULL,
    "LocationEasting_OSGR" INT NULL,
    "Location_Northing_OSGR" INT   NULL,
    "Longitude" DEC   NULL,
    "Latitude" DEC  NULL,
    "Accident_Severity" INT   NULL,
    "Number_of_Vehicles" INT  NULL,
    "Number_of_Casualties" INT  NULL,
    "Time" VARCHAR(255)   NULL,
    "Road_Type" VARCHAR(255)  NULL,
    "Speed_limit" INTEGER  NULL,
    "Junction_Control" VARCHAR(255)   NULL,
    "Light_Conditions" VARCHAR(255)   NULL,
    "Weather_Conditions" VARCHAR(255)  NULL,
    "Road_Surface_Conditions" VARCHAR(255)   NULL,
    "Special_Conditions_at_Site" VARCHAR(255)  NULL,
    "Carriageway_Hazards" VARCHAR(255)  NULL,
    "Did_Police_Officer_Attend_Scene_of_Accident" VARCHAR(255)  NULL,
    "LSOA_of_Accident_Location" VARCHAR(255)  NULL,
    CONSTRAINT "pk_valentines_day_2014" PRIMARY KEY (
        "Accident_Index"
     )
);

CREATE TABLE "lsoa_codes" (
    "LSOA11CD" VARCHAR(255)   NULL,
    "LSOA11NM" VARCHAR(255)   NULL,
    "BUASD11CD" VARCHAR(255)    NULL,
    "BUASD11NM" VARCHAR(255)    NULL,
    "BUA11CD" VARCHAR(255)   NULL,
    "BUA11NM" VARCHAR(255)   NULL,
    "LAD11CD" VARCHAR(255)   NULL,
    "LAD11NM" VARCHAR(255)   NULL,
    "LAD11NMW" VARCHAR(255)   NULL,
    "RGN11CD" VARCHAR(255)   NULL,
    "RGN11NM" VARCHAR(255)   NULL,
    "RGN11NMW" VARCHAR(255)   NULL,
    "ObjectId" INT  NULL,
    CONSTRAINT "pk_lsoa_codes" PRIMARY KEY (
        "LSOA11CD"
     )
);

CREATE TABLE "accident_cities" (
    "Accident_Index" VARCHAR(255)   NULL,
    "Longitude" DECIMAL  NULL,
    "Latitude" DECIMAL  NULL,
    "City" VARCHAR(255)    NULL
);

CREATE TABLE "vehicle_info" (
    "Accident_Index" VARCHAR(255)   NULL,
    "Age_Band" VARCHAR(255)   NULL,
    "Age_of_Vehicle" INT  NULL,
    "Driver_Home_Area_Type" VARCHAR(255) NULL,
    "Driver_IMD_Decile" INT   NULL,
    "Engine_Capacity_.CC." INT   NULL,
    "Hit_Object_in_Carriageway" VARCHAR(255)  NULL,
    "Hit_Object_off_Carriageway" VARCHAR(255)  NULL,
    "Journey_Purpose_of_Driver" VARCHAR(255)   NULL,
    "Junction_Location" VARCHAR(255)  NULL,
    "make" VARCHAR(255)   NULL,
    "model" VARCHAR(255)   NULL,
    "Propulsion_Code" VARCHAR(255)   NULL,
    "Sex_of_Driver" VARCHAR(255)    NULL,
    "Skidding_and_Overturning" VARCHAR(255)  NULL,
    "Towing_and_Articulation" VARCHAR(255)   NULL,
    "Vehicle_Leaving_Carriageway" VARCHAR(255)    NULL,
    "Vehicle_Location.Restricted_Lane" INT   NULL,
    "Vehicle_Manoeuvre" VARCHAR(255)   NULL,
    "Vehicle_Reference" INT   NULL,
    "Vehicle_Type" VARCHAR(255)   NULL,
    "Was_Vehicle_Left_Hand_Drive" VARCHAR(255)   NULL,
    "X1st_Point_of_Impact" VARCHAR(255)  NULL,
    "Year" INT   NULL
);

CREATE TABLE "weather_data" (
    "City" VARCHAR(255)   NULL,
    "Lat" DEC  NULL,
    "Lng" DEC  NULL,
    "Max_Temp" DEC NULL,
    "Conditions" VARCHAR(255)   NULL,
    "Visability" DEC  NULL,
    "Wind_Speed" DEC   NULL,
    "Sunrise" VARCHAR(255)   NULL,
    "Sunset" VARCHAR(255)    NULL,
    "Rain" DEC NULL,
    "Date" DATE   NULL
    CONSTRAINT "pk_weather_data" PRIMARY KEY (
        "City"
     )
);

ALTER TABLE "valentines_day_2014" ADD CONSTRAINT "fk_valentines_day_2014_LSOA_of_Accident_Location" FOREIGN KEY("LSOA_of_Accident_Location")
REFERENCES "lsoa_codes" ("LSOA11CD");

ALTER TABLE "accident_cities" ADD CONSTRAINT "fk_accident_cities_Accident_Index" FOREIGN KEY("Accident_Index")
REFERENCES "valentines_day_2014" ("Accident_Index");

ALTER TABLE "accident_cities" ADD CONSTRAINT "fk_accident_cities_City" FOREIGN KEY("City")
REFERENCES "weather_data" ("City");

ALTER TABLE "vehicle_info" ADD CONSTRAINT "fk_vehicle_info_Accident_Index" FOREIGN KEY("Accident_Index")
REFERENCES "valentines_day_2014" ("Accident_Index");