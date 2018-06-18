require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::TestHelpers
  def setup
    @user = users(:nomiyama)   
    @other_user = users(:natsuki)
  end

  test "update action should be done by correct user" do
    get edit_user_path(@user)

  end
end
