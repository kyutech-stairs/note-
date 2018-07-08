class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :price
end
