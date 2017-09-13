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