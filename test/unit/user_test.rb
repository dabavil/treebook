require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a user shoul enter their first name when signing up" do
	  
	  	user = User.new
	  	assert !user.save
	  	assert !user.errors[:first_name].empty?
	end


	test "a user shoul enter their last name when signing up" do
	  
	  	user = User.new
	  	assert !user.save
	  	assert !user.errors[:last_name].empty? 
	end

	test "a user shoul enter their profile name when signing up" do
	  
	  	user = User.new
	  	assert !user.save
	  	assert !user.errors[:profile_name].empty? 
	  end
	
	test "a user should have a unique profile name" do
		user = User.new
		user.profile_name = users(:petrik).profile_name

		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "profile name should have correct format - no spaces" do
		user = User.new
		user.profile_name = "My Profile With Spaces"

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must have profile name without spaces!")
	end



end
