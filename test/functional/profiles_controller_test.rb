require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:petrik).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "profile not found should render a 404" do
	  get :show, id: "doesn't exist"
	  assert_response :not_found
  end

test "that variables are correctly assigned on successful profie view" do
	get :show, id: users(:petrik).profile_name
	assert assigns(:user)
	assert_not_empty assigns(:statuses)
end

test "only show the statuses for the correct user" do
  get :show, id: users(:petrik).profile_name
  assigns(:statuses).each do |status| 
    assert_equal users(:petrik), status.user
  end 


end



end
