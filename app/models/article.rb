class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :feeds, dependent: :destroy
  has_one :price, dependent: :destroy
  accepts_nested_attributes_for :price
  validates :price, presence: true
  has_many :purchases, dependent: :destroy

  has_many :reviews

  validates :title, presence: true
  validates :content, presence: true
  mount_uploader :image, ImageUploader


  def update_price
    if price.min >= 100 && price.rate != "free"
      r = Price.rates[price.rate]
      # 100 is not decided yet. 100 is fluctuation range
      flu_p = 100 / r
      tmp_p = likes.count * flu_p + purchases.count * flu_p - bads.count * flu_p * 2 + price.min
      if tmp_p > price.max
        price.now_price = price.max
      elsif tmp_p < price.min
        price.now_price = price.min
      else
        price.now_price = tmp_p
      end
    end
  end

  def like_count
    feeds.where(like: true).size
  end
  def bad_count
    feeds.where(bad: true).size
  end
  def purchases_count
    purchases.where(is_purchased: true).size
  end

  def self.search(key)
    if key != ""
      self.where("title like '%#{key}%' or content like '%#{key}%' ")
    else
      nil
    end
  end
end
