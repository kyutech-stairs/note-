require 'test_helper'

class FollowTest < ActiveSupport::TestCase
  def setup
    @user = users(:monster)
    @other = users(:cheese)
    @follow = Follow.new(follower_id: @other.id, following_id: @user.id)
  end
  test "should be valid" do
    assert @follow.valid?
  end
  test "cannot follow myself" do
    @follow.follower_id = @user.id
    assert_not @follow.valid?
  end
  test "following and should be presence" do
    @follow.following_id = nil
    assert_not @follow.valid?
  end
  test "follower and should be presence" do
    @follow.follower_id = nil
    assert_not @follow.valid?
  end
end
