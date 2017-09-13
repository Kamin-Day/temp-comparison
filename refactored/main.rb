require 'net/http'
require "pry"
require 'json'
require 'open-uri'
require "date"
require_relative "functions.rb"

#Displays prompt
#Gathers user input
postalCode = getCode()

#Function
#inputs user inputted postal code
#confirms that the entered information is of proper length and type
#prompts user to enter correct information if postal code is invalid.
postalCode = validateCode(getCode)		

#Calls a function to gather latitude and longitude information about 
# the postal code from googles 'geocode' api.
#Sends in postal code from user input, then makes a request to the api


getCoords(geoCode(postalCode))	
puts postalCode



# puts prompt
# prompt = "Enter a postal code to continue fetching weather information"
