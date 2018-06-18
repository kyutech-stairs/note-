class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!, except: :show

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private 
  
  def user_params
    params.require(:user).permit(:name, :profile, :image)
  end
  def correct_user
    @user = User.find(params[:user_id])
    redirect_to root_path unless current_user?(@user)
  end

end
