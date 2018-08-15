class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bads, dependent: :destroy
  #followする
  has_many :active_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_follows
  #followされる
  has_many :passive_follows, class_name: "Follow", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :passive_follows
  has_many :reviews
  validates :name, presence: true
  has_many :feeds, dependent: :destroy

  def like(article)
    if feed = feeds.find_by(article_id: article.id)
      feed.update_attributes(like: true, bad: false)
    else
      feeds.create!(article_id: article.id, like: true)
    end
  end
  def liking?(article)
    feeds.where(like: true).map(&:article_id).include?(article.id)
  end
  def bad(article)
    if feed = feeds.find_by(article_id: article.id)
      feed.update_attributes(like: false, bad: true)
    else
      feeds.create!(article_id: article.id, bad: true)
    end
  end
  def bads?(article)
    feeds.where(bad: true).map(&:article_id).include?(article.id)
  end
  def cancel_feed(article)
    feeds.find_by(article_id: article.id).destroy
  end
  def follow(user)
    active_follows.create!(following_id: user.id)
  end
  def cancel_follow(user)
    active_follows.find_by(following_id: user.id).destroy
  end
  def following?(user)
    following.include?(user)
  end

  def is_purchased?(article)
    purchases.map(&:article_id).include?(article.id)
  end
end
