require 'net/http'
require "pry"
require 'json'
require 'open-uri'
require "date"

#Displays prompt
#Gathers user input
def getCode 
	#Message prompting user to input a postal code to continue
	puts "Please enter a valid zip code containing 5 digits"
	userInput = gets.chomp
	return userInput
end
#Takes in user input
#Calls a function on user input to check validity
#If return is false, the code is invalid and the user is prompted to enter a new code
#Once the user input is a valid zip code,
#The valid code is returned
def validateCode(userInput)
	until (checkCode(userInput) == true)
		getCode()
	end
	return userInput
end

#Takes in user input
#Checks to make sure input is a valid zip code.
#Returns true if valid, false if invalid
def checkCode(userInput)
	return (/^\d{5}$/ === userInput)
end

#Takes in a zip code,
# then makes a request to googles geocode api 
# calls a function to retreive latitude and longitude from the response
def geoCode(postal)
	url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + postal + "&key=AIzaSyBZqs-MS-5WyI9s-eS2Bx3wEemC5gzlhqc"
	uri = URI(url)
	response = Net::HTTP.get(uri)
	geoInfo = JSON.parse(response)
	return geoInfo
end

#Takes in a hash response from googles geocode api
#extracts the lat and lng information into a coordinates hash
#returns the coordinates hash
def getCoordinates(geoCodeResponse)
	coordinates = {}
	coordinates[lat:] = geoCodeResponse["results"][0]["geometry"]["location"]["lat"].to_s
	coordinates[lng:] = getCodeResponse["results"][0]["geometry"]["location"]["lng"].to_s
	return coordinates
end

# def getLat(geoCodeResponse)


# 	return coordinates
# end

# def getLng(geoCodeResponse)


# 	return coordinates
# end


# 	lat = geoInfo["results"][0]["geometry"]["location"]["lat"].to_s
# 	lng = geoInfo["results"][0]["geometry"]["location"]["lng"].to_s

# 	timeToCompare = (Time.now.to_i.fdiv(3600).round) * 3600

# 	yesterdaysTemp = getWeatherThen(lat, lng, timeToCompare)
# 	todaysTemp = getWeatherNow(lat, lng, timeToCompare)

# 	temps = [yesterdaysTemp,todaysTemp]
# 	return temps
# end

























