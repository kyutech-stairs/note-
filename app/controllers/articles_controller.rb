class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]
  after_action :create_notifications, only: :create

  def new
    @article = Article.new
    @article.build_price
  end
  def edit
    @article = Article.find(params[:id])
  end
  def show
    @article = Article.find(params[:id])
    @reviews = @article.reviews.page(params[:page]).per(5)
    @reviews_feeds = @article.reviews.page(params[:page]).per(5).search_by_star(params[:search])
    @review = @article.reviews.find_by(user_id: current_user)
    @review = Review.new unless @review
    respond_to do |format|
      format.html {}
      format.js
    end
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
    @article = current_user.articles.build(article_params)
    @article.price.now_price = @article.price.min
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
    params.require(:article).permit(:title, :content, :image, price_attributes: [:min, :max, :rate])
  end
  def article_update_params
    params.require(:article).permit(:title, :content, :image)
  end
  def correct_user
    if current_user
      user = current_user.articles.find_by(id: params[:id])
      redirect_to root_path if user.nil?
    else
      redirect_to new_user_session_path
    end
  end
  def create_notifications
    current_user.followers.each do |follower|
      current_user.active_notices.create(notice: follower, article: @article, message: "#{current_user.name}さんが新しい記事「#{@article.title.truncate(15)}」を投稿しました")
    end
  end
end
