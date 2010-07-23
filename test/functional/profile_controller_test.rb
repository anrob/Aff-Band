require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get business_name:string" do
    get :business_name:string
    assert_response :success
  end

  test "should get address:string" do
    get :address:string
    assert_response :success
  end

  test "should get city:string" do
    get :city:string
    assert_response :success
  end

  test "should get state:string" do
    get :state:string
    assert_response :success
  end

  test "should get zip:string" do
    get :zip:string
    assert_response :success
  end

  test "should get email:string" do
    get :email:string
    assert_response :success
  end

  test "should get user:reference" do
    get :user:reference
    assert_response :success
  end

end
