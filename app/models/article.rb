class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :price, dependent: :destroy
  accepts_nested_attributes_for :price

  validates :title, presence: true
  validates :content, presence: true
end
