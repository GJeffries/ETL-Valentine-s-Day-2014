# Project-2

Title: 
An investigation into potential factors that caused road accidents in London on Valentine's Day 2014. 

Proposal: 
Despite an increase in car usage in the UK (Shale-Hester, 2021), the statistics gathered over the years have confirmed that the main contributor to road accidents stems from bad weather conditions (Davies, 2017). However, previous evidence has shown UK holidays such as Christmas day can also contribute to the increase of road accidents and, therefore, throws light into alternative reasons for the gradual rise in road accidents (Higgs, 2021). 
With the use of relational database SQL, this investigation will look into the possible interactions between car usage/type (vehicle info data), weather conditions (API data set) and road accidents taken place on Valentine's Day 2014 (valentine's day data 2014) in cities such as London (accident cities csv & isoa codes). 

#### Data Cleansing

The vehicle information and traffic data was uploaded from the following Kaggle pages:

 - [Traffic Flow - daveianhickey](https://www.kaggle.com/daveianhickey/2000-16-traffic-flow-england-scotland-wales)
 - [Road Safety Accidents and Vehicles - tsiaras](https://www.kaggle.com/tsiaras/uk-road-safety-accidents-and-vehicles)

The vehicle info file was then cleaned using Python to only contain data for the accident indices contained in the [valentines_day_2014.csv]("https://github.com/GJeffries/Project-2/blob/main/JF%20-%20File%20Cleansing/valentines_day_2014.csv") file. To clean the data, we created a dataframe containing only the accident indices needed, then performed a merge.

The citipy package was then used on the remaining latitude and longitude data to collate a list of city names for scraping the relevant weather information. Two lists were created in a loop: one with a returned value for every row (for subsequent addition to the main table) and one to only contain unique values for the API calls.

The process of collecting the API weather data:

To collect the weather data of the locations obtained from accident_cities.csv, the use of an API was essential to extract the data needed into a Pandas DataFrame. Our source of information was derived from visualcrossing.com where we received an API key to make requests and load JSONs from our API responses. It was necessary to build a query that would reduce the amount of information to fit the criteria required using the url, cities and API key. From there, we requested a query for each city using a FOR loop; this would loop through the list of cities via their index. Also, to make sure that the loop was functioning correctly for each city, the index was set to 0 and once the kernel had reached the end of the loop, it would restart for the next city (index += 1). Within the loop, the desired data was appended with empty list variables and ultimately extracted into a Pandas DataFrame. The DataFrame was converted to a CSV file with a parameter that would drop the index (index=False) in order for it to be imported into the final SQL database.

Using relation database SQL, it was identified that there was a correlation between… 


References:
Davies, J. (2017) Analysis of weather effects on daily road accidents. Gss.civilservice. https://gss.civilservice.gov.uk/wp-content/uploads/2017/01/Road-accidents.pdf 
Higgs, B. (2021, June 1). Why Road Traffic Accidents Increase Over The Christmas Period. Higgs Newton Kenyon Solicitors. https://hnksolicitors.com/advice/why-road-traffic-accidents-increase-over-the-christmas-period/ 
Shale-Hester, T. (2021, January 13). Current car usage at similar levels to May 2020 despite lockdown. Auto Express. https://www.autoexpress.co.uk/news/352240/current-car-usage-similar-levels-may-2020-despite-lockdown#:%7E:text=New%20data%20suggests%2010%20per,first%20lockdown%20in%20March%202020&text=Car%20usage%20during%20England’s%20third,to%20return%20to%20their%20workplaces


