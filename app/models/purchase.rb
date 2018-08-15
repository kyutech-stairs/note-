class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :user, uniqueness: { scope: :article }
  validates :price, presence: true, inclusion: { in: 100..10000 }
  validate :myself

  def myself
    if user_id == Article.find(article_id).user_id
      errors.add(:article, "cant purchase your own article")
    end
  end
end
