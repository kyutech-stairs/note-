class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :prices, dependent: :destroy
  accepts_nested_attributes_for :prices
  validates :title, presence: true
  validates :content, presence: true
end
