class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit_first_name edit_last_name edit_username update]

  def index
    @users = User.all
  end

  def show
    @friend_requests = FriendRequest.unaccepted.includes(:user).where(user: @user)
  end

  def edit_first_name; end

  def edit_last_name; end

  def edit_username; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user) }
        format.json { render :show, status: :ok, location: user_path(@user) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username)
  end
end
