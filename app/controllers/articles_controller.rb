class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :create_by_correct_user, only: :create

  def new
    @article = Article.new
    @article.build_price
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
    if @article.update_attributes(article_update_params)
      set_flash(:notice, "記事が変更されました")
      redirect_to @article
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
      @article.build_price
      set_flash(:alert, messages)
      render 'new'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :user_id, price_attributes: [:min, :max, :rate])
  end
  def article_update_params
    params.require(:article).permit(:title, :content, :user_id)
  end
  def correct_user
    user = current_user.articles.find_by(id: params[:id])
    redirect_to root_path if user.nil?
  end
  def create_by_correct_user
    user = User.find(params[:article][:user_id])
    redirect_to root_path unless current_user == user
  end
end
