require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:monster)
    @other = users(:cheese)
  end
  #new
  test "should get new" do
    get new_user_registration_path
    assert_response :success
  end
  #edit
  test "should get edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_response :success
  end
  test "should redirect edit when wrong user logged in" do
    log_in_as(@other)
    get edit_user_path(@user)
    assert_redirected_to root_path
  end
  test "should redirect edit when no loggend in" do
    get edit_user_path(@user)
    assert_redirected_to new_user_session_path
  end

  #update
  test "should redirect update when no logged in" do
    patch user_path(@user), params: {
      user: {
        name: "sample", email: "email@gmail.com"
      }
    }
    assert_redirected_to new_user_session_path
  end
  test "should redirect update when wrong user logged in" do
    log_in_as @other
    patch user_path(@user), params: {
      user: {
        name: "sample", email: "email@gmail.com"
      }
    }
    assert_redirected_to root_path
  end
  test "should update when correct user" do
    log_in_as @user
    patch user_path(@user), params: {
      user: {
        name: "sample"
      }
    }
    @user.reload
    assert @user.name == "sample"
  end
end
