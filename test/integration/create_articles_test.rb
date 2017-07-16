require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "John", email: "john@example.com",password: "password", admin: true)
  end

  test "get new article form and create one" do
     sign_in_as(@user, "password")
     get new_article_path
     assert_template 'articles/new'
     assert_difference 'Article.count', 1 do
     post_via_redirect articles_path, article: {title: "New Article" , description: "Ne Description", user_id: @user}
     end
     assert_template 'articles/show'
  end

  test "invalid article submission leads to failure" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_no_difference 'Article.count' do
    post_via_redirect articles_path, article: {title: "" , description: "Ne Description", user_id: @user}
    end
    assert_template 'articles/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'

  end

end
