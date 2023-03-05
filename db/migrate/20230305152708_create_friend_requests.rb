class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :sender
      t.boolean :accepted, null: true, default: nil

      t.timestamps
    end
  end
end
