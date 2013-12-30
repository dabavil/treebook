require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  
test "status has some content" do
	status = Status.new
	assert !status.save
	assert !status.errors[:content].empty?
end

test "that status is at least 2 letter long" do
	status = Status.new
	status.content = "O"
	assert !status.save
	assert !status.errors[:content].empty?
end


test "that a status has user id associated with it" do
status = Status.new
status.content = "Hellow"
assert !status.save
assert !status.errors[:user_id].empty?

end


  # test "the truth" do
  #   assert true
  # end
end
