class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :sender, class_name: "User"

  scope :unaccepted, -> { where(accepted: nil) }

  def self.create_request(user_id, sender_id)
    FriendRequest.create(user_id: user_id, sender_id: sender_id)
  end
end
