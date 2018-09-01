class FollowsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  # after_action :create_notifications, only: :create
  def create
    @user = User.find(params[:following_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html {}
      format.js 
    end
  end
  def destroy
    @user = User.find(params[:following_id])
    current_user.cancel_follow(@user)
    respond_to do |format|
      format.html {}
      format.js
    end
  end
  private
  def create_notifications
    current_user.active_notices.create(notice: @user, message: "#{current_user.name}さんにフォローされました")
  end
end
