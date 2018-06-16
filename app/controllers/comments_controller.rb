class CommentsController < ApplicationController

 #ここ微妙
  def create
    @article = Article.find(params[:article_id])
    @article.comments.create(user_id: current_user.id , comment_content: comment_params)
    redirect_to article_path(@article)
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
    params.require(:comment).permit(:comment_content)
  end


end
