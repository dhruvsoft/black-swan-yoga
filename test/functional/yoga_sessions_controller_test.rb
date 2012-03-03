require 'test_helper'

class YogaSessionsControllerTest < ActionController::TestCase
  setup do
    @yoga_session = yoga_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yoga_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yoga_session" do
    assert_difference('YogaSession.count') do
      post :create, yoga_session: @yoga_session.attributes
    end

    assert_redirected_to yoga_session_path(assigns(:yoga_session))
  end

  test "should show yoga_session" do
    get :show, id: @yoga_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yoga_session
    assert_response :success
  end

  test "should update yoga_session" do
    put :update, id: @yoga_session, yoga_session: @yoga_session.attributes
    assert_redirected_to yoga_session_path(assigns(:yoga_session))
  end

  test "should destroy yoga_session" do
    assert_difference('YogaSession.count', -1) do
      delete :destroy, id: @yoga_session
    end

    assert_redirected_to yoga_sessions_path
  end
end
