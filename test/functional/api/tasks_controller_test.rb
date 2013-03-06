require 'test_helper'

class Api::TasksControllerTest < ActionController::TestCase
  setup do
    @api_task = api_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_task" do
    assert_difference('Api::Task.count') do
      post :create, api_task: {  }
    end

    assert_redirected_to api_task_path(assigns(:api_task))
  end

  test "should show api_task" do
    get :show, id: @api_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_task
    assert_response :success
  end

  test "should update api_task" do
    put :update, id: @api_task, api_task: {  }
    assert_redirected_to api_task_path(assigns(:api_task))
  end

  test "should destroy api_task" do
    assert_difference('Api::Task.count', -1) do
      delete :destroy, id: @api_task
    end

    assert_redirected_to api_tasks_path
  end
end
