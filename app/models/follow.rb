class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"
  validates :following, uniqueness: { scope: :follower }
  validate :myself

  def myself
    if follower == following
      errors.add(:following, " 自分自身をフォローできません")
    end
  end
end
