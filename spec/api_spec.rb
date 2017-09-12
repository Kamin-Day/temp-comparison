# describe
# it
# expect
# to
# eq


require "spec_helper"
require_relative "../functions.rb"

describe "compareTemps" do 
	it "compares 2 temperatures and finds their difference displaying an increase in temperatures." do
		# Exercise
		result = compareTemps([86.5,79.23])

		# Verify
		expect(result).to eq("Yesterday it was 7.27 degrees warmer at this time")	
	end
	# it "compares 2 temperatures and finds their difference displaying a decrease in temperatures." do
	# 	# Exercise
	# 	result = compareTemps([86.5,79.23])

	# 	# Verify
	# 	expect(result).to eq("Yesterday it was 7.27 degrees warmer at this time")	
	# end

# 	it "multiplies two numbes together" do
# 		# Exercise
# 		result = multiply(2,3)

# 		# Verify
# 		expect(result).to eq(6)

# 	end
end