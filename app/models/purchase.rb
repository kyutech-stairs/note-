class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :user, uniqueness: { scope: :article }
  validates :price, presence: true, inclusion: { in: 100..5000 }
end
