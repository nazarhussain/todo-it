require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  setup do
    @list = task_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_list" do
    assert_difference('TaskList.count') do
      post :create, list: {  }
    end

    assert_redirected_to task_list_path(assigns(:list))
  end

  test "should show task_list" do
    get :show, id: @list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @list
    assert_response :success
  end

  test "should update task_list" do
    put :update, id: @list, list: {  }
    assert_redirected_to task_list_path(assigns(:list))
  end

  test "should destroy task_list" do
    assert_difference('TaskList.count', -1) do
      delete :destroy, id: @list
    end

    assert_redirected_to task_lists_path
  end
end
