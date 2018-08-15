class Review < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :content, length: { maximum: 1000 }, presence: true
  validates :star, inclusion: { in: 1..5 }, presence: true
  validates :title, length: { maximum: 100}, presence: true
  
  def self.search_by_star(num)
    if num.to_i==0
      all
    elsif num
      where(star: num)
    else 
      all
    end
  end
end
