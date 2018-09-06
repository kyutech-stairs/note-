class Notification < ApplicationRecord
  belongs_to :notice, class_name: "User"
  belongs_to :article, optional: true
  belongs_to :noticer, class_name: "User"
  validates :message, presence: true
end
