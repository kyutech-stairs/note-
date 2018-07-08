class FollowsController < ApplicationController
  def create
    @follow = Follow.new(follow_params)
    # @follow = Follow.new(user_id: params[:user_id], follow_id: params[:follow_id])
    if @follow.save
      render json: { success: true }
    else
      render :new
  end


  private
   def follow_params
     params.require(:follow).permit(:user_id, :follow_id)
   end
end
