1. flow

  -user starts app
  -CLI asks for input (choice of hike distance, difficulty, proximity)
  -user input
  -CLI finds info on website & returns all matches
  -user chooses best match
  -CLI returns info on user input

2. classes

  -Park
  -Hike
  -CLI 
  -Scraper

require "Geocoder"

results1 = Geocoder.search("city name").first.coordinates
results2 = Geocoder.search("park name").first.coordinates
distance = Geocoder::Calculations.distance_between(results1, results2)
match = results2 if distance < 50