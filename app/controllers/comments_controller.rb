class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def create
    @comment = current_user.comments.build(comment_params)
    @article = @comment.article
    if @comment.save
      respond_to do |format|
        format.html {redirect_to @article}
        format.js
      end
    else
      redirect_to @article
    end
  end

  def destroy
    @article = @comment.article
    if @comment.destroy
      set_flash(:notice, "コメントが削除されました")
      respond_to do |format|
        format.html {redirect_to @comment.article}
        format.js {}
      end
    else
      messages = ""
      @comment.errors.full_messages.each{|msg| messages += "#{msg}¥n"}
      set_flash(:alert, messages)
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :article_id, :reply_id)
  end
  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_path if @comment.nil?
  end


end
