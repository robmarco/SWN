require 'test_helper'

class TrainningsControllerTest < ActionController::TestCase
  setup do
    @trainning = trainnings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trainnings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trainning" do
    assert_difference('Trainning.count') do
      post :create, :trainning => @trainning.attributes
    end

    assert_redirected_to trainning_path(assigns(:trainning))
  end

  test "should show trainning" do
    get :show, :id => @trainning.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @trainning.to_param
    assert_response :success
  end

  test "should update trainning" do
    put :update, :id => @trainning.to_param, :trainning => @trainning.attributes
    assert_redirected_to trainning_path(assigns(:trainning))
  end

  test "should destroy trainning" do
    assert_difference('Trainning.count', -1) do
      delete :destroy, :id => @trainning.to_param
    end

    assert_redirected_to trainnings_path
  end
end
