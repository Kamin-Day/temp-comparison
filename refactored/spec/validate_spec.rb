require "spec_helper"
require_relative "../functions.rb"

#Tests validateCode function
describe "validateCode" do
	it "ensures a valid code is returned when a valid code is entered" do
		result = validateCode("12345")
		expect(result).to eq("12345")
	end
end

describe "checkCode" do 
	it "ensures that valid zip is input is accepted" do
		# Exercise
		result = checkCode("12345")

		# Verify
		expect(result).to eq(true)	
	end

	it "ensures that invalid user input is rejected" do
		# Exercise
		result = checkCode("1234g")

		# Verify
		expect(result).to eq(false)	
	end
end	

describe "api" do
	it "checks the response from googles geoCode api to ensure it is usable data" do
		result = geoCode("68154").class 
		expect(result).to eq(Hash)
	end
end

RSpec.describe "googleLatLngResponse" do
	it "ensures that given a proper hash, lat and lng can be extracted"
	
	    dbl = double({
   "results" : [
      {
         "address_components" : [
            {
               "long_name" : "68154",
               "short_name" : "68154",
               "types" : [ "postal_code" ]
            },
            {
               "long_name" : "Omaha",
               "short_name" : "Omaha",
               "types" : [ "locality", "political" ]
            },
            {
               "long_name" : "Douglas County",
               "short_name" : "Douglas County",
               "types" : [ "administrative_area_level_2", "political" ]
            },
            {
               "long_name" : "Nebraska",
               "short_name" : "NE",
               "types" : [ "administrative_area_level_1", "political" ]
            },
            {
               "long_name" : "United States",
               "short_name" : "US",
               "types" : [ "country", "political" ]
            }
         ],
         "formatted_address" : "Omaha, NE 68154, USA",
         "geometry" : {
            "bounds" : {
               "northeast" : {
                  "lat" : 41.2778119,
                  "lng" : -96.075794
               },
               "southwest" : {
                  "lat" : 41.247566,
                  "lng" : -96.15805899999999
               }
            },
            "location" : {
               "lat" : 41.25461749999999,
               "lng" : -96.1049958
            },
            "location_type" : "APPROXIMATE",
            "viewport" : {
               "northeast" : {
                  "lat" : 41.2778119,
                  "lng" : -96.075794
               },
               "southwest" : {
                  "lat" : 41.247566,
                  "lng" : -96.15805899999999
               }
            }
         },
         "place_id" : "ChIJmwnBnGbyk4cR5jqh6LPhEBs",
         "types" : [ "postal_code" ]
      }
   ],
   "status" : "OK"
})
	    expect(dbl.foo).to eq(3)
	    expect(dbl.bar).to eq(4)
  end
end

