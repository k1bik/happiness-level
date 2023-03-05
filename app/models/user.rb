class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships, dependent: :destroy  
  has_many :friends, through: :friendships

  after_destroy { |user| Friendship.where(friend_id: user.id).destroy_all }

  def fullname
    "#{first_name} #{last_name}"
  end
end
