require 'net/http'
require "pry"
require 'json'
require 'open-uri'
require "date"




def compareTemps(temps)
	tempDifference = temps[0] - temps[1]

	if tempDifference < 0 
		return "Yesterday it was " + tempDifference.round(3).to_s + " degrees colder at this time"
	elsif tempDifference > 0
		return "Yesterday it was " + tempDifference.round(3).to_s + " degrees warmer at this time"
	else
		return "It is the same temperature now as it was this time yesterday"
	end	
end

def geoCode(postal)
	url= "https://maps.googleapis.com/maps/api/geocode/json?address=" + postal + "&key=AIzaSyBZqs-MS-5WyI9s-eS2Bx3wEemC5gzlhqc"
	uri = URI(url)
	response = Net::HTTP.get(uri)
	geoInfo = JSON.parse(response)

	lat = geoInfo["results"][0]["geometry"]["location"]["lat"].to_s
	lng = geoInfo["results"][0]["geometry"]["location"]["lng"].to_s

	timeToCompare = (Time.now.to_i.fdiv(3600).round) * 3600

	yesterdaysTemp = getWeatherThen(lat, lng, timeToCompare)
	todaysTemp = getWeatherNow(lat, lng, timeToCompare)

	temps = [yesterdaysTemp,todaysTemp]
	return temps
end
	
# weatherInfo["hourly"]["data"] # array of hash Time
# hour = (Time.now.to_i.fdiv(3600).round) * 3600

def getWeatherThen(lat, lng, timeToCompare)
	yesterday = (DateTime.now - 1).to_s
	keyDS = "bdff756c7b33041b10dcef1de7bf1fff/"
	exclude = "?exclude=currently,minutely,alerts,flags" #hourly"

	url = "https://api.darksky.net/forecast/" + keyDS + lat + "," + lng + "," + yesterday + exclude
	uri = URI(url)
	response = Net::HTTP.get(uri)
	weatherInfo = JSON.parse(response)

	checkTime = timeToCompare - (3600 * 24)
	weatherInfo["hourly"]["data"].each do |hour| 
		if hour["time"] == checkTime
			tempThen = hour["temperature"]
			return tempThen
		end
	end
end

def getWeatherNow(lat, lng, timeToCompare)
	dateTime = DateTime.now.to_s
	keyDS = "bdff756c7b33041b10dcef1de7bf1fff/"
	exclude = "?exclude=currently,minutely,alerts,flags" #hourly,

	url = "https://api.darksky.net/forecast/" + keyDS + lat + "," + lng + "," + dateTime + exclude
	uri = URI(url)
	response = Net::HTTP.get(uri)
	weatherInfo = JSON.parse(response)
	
	weatherInfo["hourly"]["data"].each do |hour| 
		if hour["time"] == timeToCompare
			tempNow = hour["temperature"]
			return tempNow
		end
	end
end



#Asks for user input 
puts "Enter a postal code to continue fetching weather information"
areaCode = gets.chomp
#Gathers Lat/Long information and captures time of request
tempsToCompare = geoCode(areaCode)

#Shows temp info
puts "The temperature right now is " + tempsToCompare[1].to_s
puts "The temperature at this time yesterday was " + tempsToCompare[0].to_s
#Compares temp info
puts compareTemps(tempsToCompare)


	

# [YYYY]-[MM]-[DD]T[HH]:[MM]:[SS][timezone]
# https://api.darksky.net/forecast/[key]/[latitude],[longitude],[time
# => 2017-09-12 10:33:37 -0500
# GET https://api.darksky.net/forecast/0123456789abcdef9876543210fedcba/42.3601,-71.0589,409467600?exclude=currently,flags
	# yyyy = time.year.to_s + "-"
	# mm = time.month.to_s + "-"
	# dd = time.day.to_s + "T"
	# hh = time.hour.to_s + ":"
	# min = time.min.to_s + ":"
	# ss = time.sec.to_s 
	# timezone = time.zone.to_s
	# dateTime = yyyy + mm + dd + hh + min + ss # + timezonedef checkForcast(forcast)
		# time = Time.now
	# dateTime = time.to_s.delete(" ").insert 10, "T"


# Google API Geocoding Key - AIzaSyBZqs-MS-5WyI9s-eS2Bx3wEemC5gzlhqc

