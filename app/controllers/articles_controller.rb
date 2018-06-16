class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      set_flash(:notice, "記事が削除されました")
    else
      messages = ""
      @article.errors.full_messages.each{|msg| messages += "#{msg}¥n"}
      set_flash(:alert, messages)
    end
    redirect_to("/static_pages/index")
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      set_flash(:notice, "記事が変更されました")
    else
      messages = ""
      @article.errors.full_messages.each{|msg| messages += "#{msg}¥n"}
      set_flash(:alert, messages)
    end
    redirect_to article_path(@article)
  end


#save a new article
  def create
    @article = Article.new(article_params)
    if @article.save
      set_flash(:notice, "記事が投稿されました")
    else
      messages = ""
      @article.errors.full_messages.each{|msg| messages += "#{msg}¥n"}
      set_flash(:alert, messages)
    end
    redirect_to article_path(@article)
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
