class CommentsController < ApplicationController
  before_action :authenticate_user!

 #ここ微妙
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to @comment.article
  end

  def destroy
    @article = Article.find(params[:post_id])
    @comment = @article.comments.find(params[:id])
    if @comment.destroy
      set_flash(:notice, "コメントが削除されました")
    else
      messages = ""
      @comment.errors.full_messages.each{|msg| messages += "#{msg}¥n"}
      set_flash(:alert, messages)
    end
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :article_id)
  end


end
