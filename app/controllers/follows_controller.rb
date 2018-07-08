class FollowsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @user = User.find(params[:follow_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end
  def destroy
    @user = User.find(params[:user_id])
    current_user.cancel_follow(@user)
    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end
end
