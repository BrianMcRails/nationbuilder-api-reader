require 'test_helper'

class NbUsersControllerTest < ActionController::TestCase
  setup do
    @nb_user = nb_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nb_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nb_user" do
    assert_difference('NbUser.count') do
      post :create, nb_user: { email: @nb_user.email, emailoptin: @nb_user.emailoptin, firstname: @nb_user.firstname, lastname: @nb_user.lastname, updatedat: @nb_user.updatedat }
    end

    assert_redirected_to nb_user_path(assigns(:nb_user))
  end

  test "should show nb_user" do
    get :show, id: @nb_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nb_user
    assert_response :success
  end

  test "should update nb_user" do
    patch :update, id: @nb_user, nb_user: { email: @nb_user.email, emailoptin: @nb_user.emailoptin, firstname: @nb_user.firstname, lastname: @nb_user.lastname, updatedat: @nb_user.updatedat }
    assert_redirected_to nb_user_path(assigns(:nb_user))
  end

  test "should destroy nb_user" do
    assert_difference('NbUser.count', -1) do
      delete :destroy, id: @nb_user
    end

    assert_redirected_to nb_users_path
  end
end
