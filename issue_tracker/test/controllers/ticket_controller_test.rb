require 'test_helper'

class TicketControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get answer" do
    get :answer
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get getTicker" do
    get :getTicker
    assert_response :success
  end

end
