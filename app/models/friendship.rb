class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User" 

  def self.create_reciprocal_for_ids(user_id, friend_id)
    return if user_id.to_i == friend_id.to_i || Friendship.where(user_id: user_id, friend_id: friend_id).present?

    Friendship.create(user_id: user_id, friend_id: friend_id)
    Friendship.create(user_id: friend_id, friend_id: user_id)
  end

  def self.destroy_reciprocal_for_ids(user_id, friend_id)
    Friendship.find_by(user_id: user_id, friend_id: friend_id).destroy
    Friendship.find_by(user_id: friend_id, friend_id: user_id).destroy
  end
end
