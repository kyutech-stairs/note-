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
  
  

  validates :name, presence: true

  def like(article)
    likes.create!(article_id: article.id)
  end
  def cancel_like(article)
    likes.find_by(article_id: article.id).destroy
  end
  def liking?(article)
    likes.map(&:article_id).include?(article.id)
  end
  def bad(article)
    bads.create!(article_id: article.id)
  end
  def cancel_bad(article)
    bads.find_by(article_id: article.id).destroy
  end
  def bads?(article)
    bads.map(&:article_id).include?(article.id)
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
