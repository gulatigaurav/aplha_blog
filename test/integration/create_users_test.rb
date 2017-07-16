require 'test_helper'
class CreateUsersTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "John", email: "john@example.com",password: "password", admin: true)
  end

  test "get new user signup form and create user" do
     get signup_path
     assert_template 'users/new'
     assert_difference 'User.count', 1 do
     post_via_redirect users_path, user: {username: "John1", email: "john1@example.com",password: "password"}
     end
     assert_template 'users/show'
    end
test "invalid user submission results in failure" do
  get signup_path
  assert_template 'users/new'
  assert_no_difference 'User.count' do
  post users_path, user: {username: " ", email: " ",password: "password", admin: true}
  end
  assert_template 'users/new'
  assert_select 'h2.panel-title'
  assert_select 'div.panel-body'
end

end
