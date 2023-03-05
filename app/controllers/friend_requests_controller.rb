class FriendRequestsController < ApplicationController
  def create
    FriendRequest.create_request(params[:user_id], current_user.id)
  end
end
