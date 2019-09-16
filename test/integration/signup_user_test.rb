require 'test_helper'

class SignupUserTest < ActionDispatch::IntegrationTest
  
  def setup
		#@user = User.create(username: "Omkar11", password: "password", email: "example@example.com", admin: true)
	end

	test "get new user form and create new user" do
		#sign_in_as(@user, "password")
		get signup_path
		assert_template 'users/new'
		assert_difference 'User.count', 1 do
			post users_path, params: { user: {username: "omkar", email: "deshpandeomkar10@yahoo.com", password: "password"}}
			follow_redirect!
		end
		assert_template 'users/show'
		assert_match "omkar", response.body
	end
end
