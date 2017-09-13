require 'net/http'
require "pry"
require 'json'
require 'open-uri'
require "date"
require_relative "functions.rb"



prompt = 

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

