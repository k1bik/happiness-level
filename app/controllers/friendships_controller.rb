class FriendshipsController < ApplicationController
  protect_from_forgery with: :exception

  def create
    Friendship.create_reciprocal_for_ids(current_user.id, params[:friend_id])
  end

  def destroy
    Friendship.destroy_reciprocal_for_ids(current_user.id, params[:id])
  end
end
