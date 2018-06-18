class ArticlesController < ApplicationController 
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @article = Article.new
  end
  def edit
    @article = Article.find(params[:id])
  end
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      set_flash(:notice, "記事が削除されました")
      redirect_to root_path
    else
      messages = ""
      @article.errors.full_messages.each{|msg| messages += "#{msg}¥n"}
      set_flash(:alert, messages)
      render 'show'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attribures(article_params)
      set_flash(:notice, "記事が変更されました")
      redirect_to @aritcle
    else
      messages = ""
      @article.errors.full_messages.each{|msg| messages += "#{msg}¥n"}
      set_flash(:alert, messages)
      render 'edit'
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      set_flash(:notice, "記事が投稿されました")
      redirect_to @article
    else
      messages = ""
      @article.errors.full_messages.each{|msg| messages += "#{msg}¥n"}
      set_flash(:alert, messages)
      render 'new'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end
  def correct_user
    @article = Article.find(params[:id])
    redirect_to root_path unless current_user == @article.user
  end
end
