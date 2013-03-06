require 'test_helper'

class Api::ListsControllerTest < ActionController::TestCase
  setup do
    @api_list = api_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_list" do
    assert_difference('Api::List.count') do
      post :create, api_list: {  }
    end

    assert_redirected_to api_list_path(assigns(:api_list))
  end

  test "should show api_list" do
    get :show, id: @api_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_list
    assert_response :success
  end

  test "should update api_list" do
    put :update, id: @api_list, api_list: {  }
    assert_redirected_to api_list_path(assigns(:api_list))
  end

  test "should destroy api_list" do
    assert_difference('Api::List.count', -1) do
      delete :destroy, id: @api_list
    end

    assert_redirected_to api_lists_path
  end
end
