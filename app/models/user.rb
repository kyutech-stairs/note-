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
  has_many :follows, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bads, dependent: :destroy

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
    follows.create!(follow_id: user.id);
  end
  def cancel_follow(user)
    follows.find_by(follow_id: user.id).destroy
  end
  def follows?(user)
    follows.map(&:follow_id).include?(user.id)
  end

end
