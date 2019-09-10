require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
	def setup
		@category = Category.create(name: "sports")
		@user = User.create(username: "Omkar11", password: "password", email: "example@example.com", admin: true)
	end

	test "Should get categories index" do
		get categories_path
		assert_response :success		
	end

	test "Should get new" do
		sign_in_as(@user, "password")
		get new_category_path
                assert_response :success
	end

	test "Should get show" do
		get category_path(@category)
                assert_response :success
	end

	test "Should redirect create when admin logged in" do
		assert_no_difference 'Category.count' do
			post categories_path, params: {category: {name: "sports"}}
		end
		assert_redirected_to categories_path
	end	
end	
