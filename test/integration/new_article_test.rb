require 'test_helper'

class NewArticleTest < ActionDispatch::IntegrationTest
  
  def setup
		@user = User.create(username: "Omkar11", password: "password", email: "example@example.com", admin: false)
		@category = Category.create(name: "Sports")
	end

	test "get new article form and create new article" do
		sign_in_as(@user, "password")
		get new_article_path
		assert_template 'articles/new'
		assert_difference 'Article.count', 1 do
			post articles_path, params: { article: {title: "Test Article New", description: "Description for this article", category_id: @category}}
			follow_redirect!
		end
		assert_template 'articles/show'
		assert_match "Sports", response.body
	end
end
