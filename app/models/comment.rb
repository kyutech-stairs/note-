class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates :content, presence: true

  has_many :replies, class_name: Comment, foreign_key: :reply_id, dependent: :destroy
end
