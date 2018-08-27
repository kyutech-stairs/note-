class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :notified, class_name: "User"
end
