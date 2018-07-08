class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user 

 #ここ微妙
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    @article = @comment.article
    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      set_flash(:notice, "コメントが削除されました")
    else
      messages = ""
      @comment.errors.full_messages.each{|msg| messages += "#{msg}¥n"}
      set_flash(:alert, messages)
    end
    
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :article_id)
  end
  def correct_user
    user = User.find(params[:comment][:user_id])
    redirect_to root_path unless user == current_user
  end
end
