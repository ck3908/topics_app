require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get ideas" do
    get :ideas
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get new_idea" do
    get :new_idea
    assert_response :success
  end

  test "should get contact_us" do
    get :contact_us
    assert_response :success
  end

end
