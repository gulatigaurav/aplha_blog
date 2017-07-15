require 'test_helper'
class CategoriesControllerTest < ActionController::TestCase
 def setup
   @category = Category.create(name: "Sports")
 end

  test "should get categories index" do
    get :index
    assert_response :success
  end

  test "should get new" do
  get :new
  assert_response :success
  end

  test "should get show" do
   get :show, params: { id: @category.id}, flash: {notice: "This is show action"}  #NEW WRITING STYLE
  #  get(:show,{'id': @category.id})   # this will generate the route for showing category
    assert_response :success
  end

end
