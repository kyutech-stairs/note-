class Feed < ApplicationRecord
  belongs_to :user
  belongs_to :article
  
  validate :like_or_bad
  validate :myself
  validate :no_feed_without_purchase
  
  def like_or_bad
    if like && bad
      errors.add(:like, "it must be like or bad")
    end
  end
  
  def myself
    if user_id == Article.find(article_id).user_id
      errors.add(:user, "cant evaluation your own article")
    end
  end
  
  def no_feed_without_purchase
    user = User.find(user_id)
    article = Article.find(article_id)
    unless user.is_purchased?(article)
      errors.add(:article, "cant feed without purchase")
    end
  end
end
