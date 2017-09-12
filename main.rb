require 'net/http'
require "pry"
require 'json'
require 'open-uri'
require "date"


def geoCode(postal)
	url= "https://maps.googleapis.com/maps/api/geocode/json?address=" + postal + "&key=AIzaSyBZqs-MS-5WyI9s-eS2Bx3wEemC5gzlhqc"
	uri = URI(url)
	response = Net::HTTP.get(uri)
	geoInfo = JSON.parse(response)

	lat = geoInfo["results"][0]["geometry"]["location"]["lat"].to_s
	lng = geoInfo["results"][0]["geometry"]["location"]["lng"].to_s

	getWeatherNow(lat, lng)
	getWeatherThen(lat, lng)

end
adjusted_datetime = (datetime_from_form.to_time - n.hours).to_datetime

	
def getWeatherThen(lat, lng)
	key = "bdff756c7b33041b10dcef1de7bf1fff/"
	time = Time.now
	yesterday = (DateTime.now - 1).to_s
	# yyyy = time.year.to_s + "-"
	# mm = time.month.to_s + "-"
	# dd = time.day.to_s + "T"
	# hh = time.hour.to_s + ":"
	# min = time.min.to_s + ":"
	# ss = time.sec.to_s 
	# timezone = time.zone.to_s
	dateTime = yyyy + mm + dd + hh + min + ss # + timezone

	dateTime = time.to_s.delete(" ").insert 10, "T"
	exclude = "?exclude=currently,minutely,hourly,alerts,flags"

	url = "https://api.darksky.net/forecast/" + key + lat + "," + lng + "," + dateTime + exclude
	uri = URI(url)
	response = Net::HTTP.get(uri)
	weatherInfo = JSON.parse(response)
	
	tempHigh = weatherInfo["daily"]["data"][0]["temperatureHigh"]
	tempLow = weatherInfo["daily"]["data"][0]["temperatureLow"]
	binding.pry

end
# [YYYY]-[MM]-[DD]T[HH]:[MM]:[SS][timezone]
# https://api.darksky.net/forecast/[key]/[latitude],[longitude],[time
# => 2017-09-12 10:33:37 -0500
# GET https://api.darksky.net/forecast/0123456789abcdef9876543210fedcba/42.3601,-71.0589,409467600?exclude=currently,flags
def checkForcast(forcast)


end

geoCode("68154")

puts "Enter a postal code to continue fetching weather information"

#.  - HTTPARTY

# pokemon
# uri = URI("http://pokeapi.co/api/v2/pokemon/" + pokemon)
# Net::HTTP.get


# def getPokemon(pokeNum)


# # uri = URI("pokeapi.co", "/api/v2/pokemon/" + pokeNum.to_s)


# 	poke1 = Net::HTTP.get('pokeapi.co', '/api/v2/pokemon1') 

# 	# poke1 = Net::HTTP.get("pokeapi.co", "/api/v2/pokemon/" + pokeNum.to_s)

# binding.pry
# 		return poke1
# end

# pokemon = getPokemon(1)
# binding.pry
# puts pokemon


# Google API Geocoding Key - AIzaSyBZqs-MS-5WyI9s-eS2Bx3wEemC5gzlhqc

# https://maps.googleapis.com/maps/api/geocode/json?address=high+st+hasting&components=country:GB&key=YOUR_API_KEY

# components=postal_code